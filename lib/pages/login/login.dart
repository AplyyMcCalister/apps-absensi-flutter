import 'dart:convert';
import 'package:bara_flutter/model/login-response.dart';
import 'package:bara_flutter/pages/home/home.dart';
import 'package:bara_flutter/pages/home/homes.dart';
import 'package:bara_flutter/pages/start/start.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late Future<String> _userName, _accessToken;

  @override
  void initState() {
    super.initState();
    _accessToken = _prefs.then((SharedPreferences prefs) {
      return prefs.getString("access_token") ?? "";
    });

    _userName = _prefs.then((SharedPreferences prefs) {
      return prefs.getString("user_name") ?? "";
    });
  }

  Future<void> _login() async {
    LoginResponse? loginResponse;
    final String apiUrl =
        'http://127.0.0.1:8000/api/auth/login'; // Ganti dengan URL API login Anda

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'user_nik': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      // Simpan token di sini
      final String accessToken = responseData['access_token'];

      // Navigasi ke halaman setelah login
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // Menampilkan pesan kesalahan jika login gagal
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['error'];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    Future saveUser(accessToken, userName) async {
      final SharedPreferences pref = await _prefs;
      pref.setString("user_name", userName);
      pref.setString("access_token", accessToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Color.fromARGB(255, 0, 42, 255),
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StartPage()));
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/loginLogo/login_logo.png',
                    height: 180,
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Log in BARA Managemenet.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Enter NIK',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        contentPadding: EdgeInsets.all(13),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 0, 255)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      )),
                      minimumSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.09,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                    ),
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
