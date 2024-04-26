import 'package:bara_flutter/fix/home.dart';
import 'package:flutter/material.dart';

class AppConfig {
  final BuildContext _context;

  AppConfig(this._context);

  double rHP(double percent) {
    return MediaQuery.of(_context).size.height * (percent / 100);
  }

  double rWP(double percent) {
    return MediaQuery.of(_context).size.width * (percent / 100);
  }
}

class LoginsPage extends StatelessWidget {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  LoginsPage({Key? key}) : super(key: key) {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }
  Widget build(BuildContext context) {
    AppConfig _ac = AppConfig(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'lib/images/loginLogo/back_icon.png',
                  height: 35,
                ),
              ),
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
                  Image.asset('lib/images/loginLogo/login_logo.png', height: 230,),
                  SizedBox(height: 25),
                  Container(
                    width: _ac.rWP(80),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(13),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: _ac.rWP(80),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(13),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;

                      if (username == '0012024030400001' && password == 'b4r4d3v3') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomesPages())
                        );
                        print('Success');
                      } else {
                        print('Username atau password tidak valid');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      )),
                      minimumSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.05,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    child: Text('Sign In',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800)),
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
