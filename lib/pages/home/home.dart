import 'package:bara_flutter/pages/clockIn/clockIn.dart';
import 'package:bara_flutter/pages/clockIn/clokin.dart';
import 'package:bara_flutter/pages/clockout/clockout.dart';
import 'package:bara_flutter/pages/component/navbar.dart';
import 'package:bara_flutter/pages/component/sideBar.dart';
import 'package:bara_flutter/pages/historyAbsen/historyabsen.dart';
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
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  Future<void> _login() async {
    final String apiUrl = 'http://127.0.0.1:8000/api/auth/login';
  }
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  void _openDrawer(BuildContext context) {
  Scaffold.of(context)?.openDrawer();
}

 @override
Widget build(BuildContext context) {
  AppConfig _ac = AppConfig(context);
  print(_selectedIndex);
  return Scaffold(
    key: _scaffoldKey, 
    backgroundColor: Colors.blueGrey.shade100,
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 120.0),
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
                        '08:00:00',
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
                        padding: EdgeInsets.symmetric(horizontal:5,vertical: 3), // Adjust the padding as needed
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 42, 255), // Background color
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
                        padding: EdgeInsets.symmetric(horizontal:8,vertical: 3), // Adjust the padding as needed
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 20, 224, 27), // Background color
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClockIns()),
                        );},
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
                        child: Text('Clock In',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800)),
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
                        '17:00:00',
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
                        padding: EdgeInsets.symmetric(horizontal:5,vertical: 3), // Adjust the padding as needed
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 42, 255), // Background color
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
                        padding: EdgeInsets.symmetric(horizontal:8,vertical: 3), // Adjust the padding as needed
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 20, 220, 27), // Background color
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClockOut()),
                        );},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 166, 255)),
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
                        child: Text('Clock Out',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800)),
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
              height: _ac.rWP(35),
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
                        Text('😁',style: TextStyle(fontSize: 60 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)
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
                        Text('😁',style: TextStyle(fontSize: 60 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)
                      ]
                    ),
                  ),
                ],
              ),
            ) ,
            SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16), 
              ),
              width: _ac.rWP(90),
              height: _ac.rWP(35),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('17',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        Text('Hari',style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                           Container(
                             height:_ac.rWP(1.2) ,
                             width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('KEHADIRAN',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.grey),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('0',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        Text('Hari',style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                          Container(
                            height:_ac.rWP(1.2) ,
                            width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('WFH',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.grey),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('10',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        Text('Hari',style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                          Container(
                            height:_ac.rWP(1.2) ,
                            width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('DINAS',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.grey),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                ],
              ),
            ) ,
            SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16), 
              ),
              width: _ac.rWP(90),
              height: _ac.rWP(35),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('521',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        Text('menit',style: TextStyle(fontSize: 13 ,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                           Container(
                             height:_ac.rWP(1.2) ,
                             width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 17, 0),
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('TERLAMBAT',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.grey),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('480',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        Text('menit',style: TextStyle(fontSize: 13 ,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                          Container(
                            height:_ac.rWP(1.2) ,
                            width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 17, 0),
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('TK',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.grey),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1001',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        Text('menit',style: TextStyle(fontSize: 13 ,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                          Container(
                            height:_ac.rWP(1.2) ,
                            width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 17, 0),
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('TOTAL',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.grey),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),


            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16), 
              ),
              width: _ac.rWP(90),
              height: _ac.rWP(35),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('0',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                        Text('task',style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                          Container(
                            height:_ac.rWP(1.2) ,
                            width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('To Do',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                        Text('task',style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                          Container(
                            height:_ac.rWP(1.2) ,
                            width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('In Progress',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                    ),
                    width: _ac.rWP(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('61',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                        Text('task',style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.center,),
                          SizedBox(height: 12,),
                          Container(
                            height:_ac.rWP(1.2) ,
                            width: _ac.rWP(12),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          SizedBox(height: 20,),
                        Text('Done',style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,),

                      ]
                    ),
                  ),
                ],
              ),
            ) ,
            SizedBox(height: 30),
          ],
        ),
      ),
    ),
    bottomNavigationBar: Navbar(
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
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => StoryAbsen()),
            );
          } else if(index == 3) {
            Builder(
        builder: (context) {
          Scaffold.of(context)?.openDrawer();
          return SizedBox(); // Return a placeholder widget
        },
      );
          }
        });
      },
    ),
      drawer: SideBar()
    );
  }
}