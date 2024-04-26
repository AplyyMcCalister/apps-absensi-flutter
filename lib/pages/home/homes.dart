import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomesPage extends StatefulWidget {
  final String accessToken;

  HomesPage({required this.accessToken});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomesPage> {
  late String user_name;

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk mengambil data pengguna setelah widget diinisialisasi
    _getUserData();
  }

  Future<void> _getUserData() async {
    final String apiUrl = 'http://127.0.0.1:8000/api/auth/login'; // Ganti dengan URL API pengguna Anda

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'user_name': user_name
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      setState(() {
        user_name = userData['user_name'];
      });
    } else {
      // Menampilkan pesan kesalahan jika gagal mengambil data pengguna
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch user data.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(
          'Hello SUPER TEAM, $user_name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
