import 'package:bara_flutter/pages/login/login.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 255),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 16),
                      Image.asset('lib/images/startLogo/icon_start.png', height: 180),
                      SizedBox(height: 3),
                      Text(
                        'BARA Management',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Semua Kebutuhan SUPER Team BARA Enterprise.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()), // Ganti LoginPage() dengan halaman login yang sebenarnya
                          );
                        },
                          style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 230, 0)),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12, horizontal: 25)),
                          minimumSize: MaterialStateProperty.all(Size(270, 30)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                        ),
                        child: Text('Get Started'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 40,
            right: 0,
            child: Container(
              alignment: Alignment.topLeft,
              child: Image.asset('lib/images/startLogo/12_dots.png', height: 42),
            ),
          ),
           Positioned(
            top: 0,
            left: 0,
            bottom: -45, // Mengatur bottom: 0 untuk memenuhi seluruh tinggi Stack
            right: -60, // Mengatur right: 0 untuk memenuhi seluruh lebar Stack
            child: Container(
              alignment: Alignment.bottomRight, // Sesuaikan dengan bottom left
              child: Image.asset('lib/images/startLogo/circleStart.png', height: 230),
            ),
          ),
        ],
      ),
    );
  }
}
