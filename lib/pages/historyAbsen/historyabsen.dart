import 'package:bara_flutter/pages/component/navbar.dart';
import 'package:bara_flutter/pages/home/home.dart';
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
class StoryAbsen extends StatefulWidget {
  const StoryAbsen({Key? key}) : super(key: key);

  @override
  _StoryAbsenState createState() => _StoryAbsenState();
}
class _StoryAbsenState extends State<StoryAbsen> {
   @override
  StoryAbsen createState() => StoryAbsen();
  Widget build(BuildContext context) {
    AppConfig _ac = AppConfig(context);
    int _selectedIndex = 1; 
    print(_selectedIndex);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Stack(
        children: [
          Positioned(
            top: _ac.rWP(25),
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('lib/images/homeAssets/baraLogos.png', width: _ac.rWP(50)),
                  SizedBox(height: 30), // Mengurangi ketinggian SizedBox menjadi 20
                  Text(
                    'Hallo SUPER TEAM,Muhammad Alfi Syahrin',
                    style: TextStyle( 
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: _ac.rHP(1)), // Mengurangi ketinggian SizedBox menjadi 20
                  Text('Tue,27 2024 14:35',
                  style: TextStyle( 
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: _ac.rWP(7)), // Jarak antara Container

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16), 
                          ),
                          width: _ac.rWP(44),
                          height: _ac.rWP(90),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start, // Align children to the start (top) of the column
                            children: [
                              Container(
                                alignment: Alignment.topCenter, // Align the child to the top center
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("lib/images/homeAssets/alfi.jpg"),
                                  radius: 87,
                                ),
                              ),
                              Text(
                                '25:00:00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'MASUK KANTOR',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                  padding: EdgeInsets.all(7), // Adjust the padding as needed
                                  decoration: BoxDecoration(
                                    color: Colors.blue, // Background color
                                    borderRadius: BorderRadius.circular(6), // Adjust the radius as needed
                                  ),
                                  child: Text(
                                    '18:00:00',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              SizedBox(height:16),
                              Container(
                                  padding: EdgeInsets.all(7), // Adjust the padding as needed
                                  decoration: BoxDecoration(
                                    color: Colors.green, // Background color
                                    borderRadius: BorderRadius.circular(6), // Adjust the radius as needed
                                  ),
                                  child: Text(
                                    'Hadir di Kantor',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              SizedBox(height:16),
                               ElevatedButton(
                                onPressed: () {
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                  foregroundColor: MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context).size.height * 0.01, 
                                    horizontal: MediaQuery.of(context).size.width * 0.02, 
                                  )),
                                  minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width * 0.2, 
                                    MediaQuery.of(context).size.height * 0.00, 
                                  )
                                  ),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                                ),
                                child: Text('Clock in',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15), // Jarak antara Container
                       Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16), 
                          ),
                          width: _ac.rWP(44),
                          height: _ac.rWP(90),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start, // Align children to the start (top) of the column
                            children: [
                              Container(
                                alignment: Alignment.topCenter, // Align the child to the top center
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("lib/images/homeAssets/alfi.jpg"),
                                  radius: 87,
                                ),
                              ),
                              Text(
                                '25:00:00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'MASUK KANTOR',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                  padding: EdgeInsets.all(7), // Adjust the padding as needed
                                  decoration: BoxDecoration(
                                    color: Colors.blue, // Background color
                                    borderRadius: BorderRadius.circular(6), // Adjust the radius as needed
                                  ),
                                  child: Text(
                                    '18:00:00',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              SizedBox(height:16),
                              Container(
                                  padding: EdgeInsets.all(7), // Adjust the padding as needed
                                  decoration: BoxDecoration(
                                    color: Colors.green, // Background color
                                    borderRadius: BorderRadius.circular(6), // Adjust the radius as needed
                                  ),
                                  child: Text(
                                    'Hadir di Kantor',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              SizedBox(height:16),
                               ElevatedButton(
                                onPressed: () {
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 140, 255)),
                                  foregroundColor: MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context).size.height * 0.01, 
                                    horizontal: MediaQuery.of(context).size.width * 0.02, 
                                  )),
                                  minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width * 0.2, 
                                    MediaQuery.of(context).size.height * 0.00, 
                                  )
                                  ),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                                ),
                                child: Text('Clock in',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 20),
                   Container(
                     decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16), 
                      ),
                       width: _ac.rWP(90),
                       height: _ac.rWP(38),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16), 
                              ),
                                width: _ac.rWP(45),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text('Perasaan Anda Ketika Datang',style: TextStyle(fontSize: 13 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                      Text('😎',style: TextStyle(fontSize: 60 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)
                                  ]
                                  ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16), 
                              ),
                                width: _ac.rWP(45),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text('Perasaan Anda Ketika Pulang',style: TextStyle(fontSize: 13 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                      Text('😎',style: TextStyle(fontSize: 60 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)
                                  ]
                                  ),
                              ),
                        ],
                      ),
                   ) 
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Navbar(
              navItems: [
                NavItem(icon: Icons.home, label: 'Home'),
                NavItem(icon: Icons.history, label: 'History Absen'),
                NavItem(icon: Icons.list, label: 'Task'),
                NavItem(icon: Icons.settings, label: 'Profile'),
              ],
              selectedIndex: _selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                // Check if the selected index is for 'Home'
                  if (index == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else if (index == 2) {
                    // Lakukan sesuatu jika indeks adalah 2
                  }
              },
            ),
          ),
        ],
        
      ),
    );
  }
}
