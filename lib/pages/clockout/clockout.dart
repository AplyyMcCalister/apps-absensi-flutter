import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator
import 'package:permission_handler/permission_handler.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

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

class ClockOut extends StatefulWidget {
  const ClockOut({Key? key}) : super(key: key);

  @override
  _ClockInState createState() => _ClockInState();
}

class _ClockInState extends State<ClockOut> {
  late AppConfig _ac;
  String selectedValue = 'Masuk Kantor';
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    _ac = AppConfig(context);
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    var permission = await Permission.locationWhenInUse.request();
    if (permission.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          latitude = position.latitude;
          longitude = position.longitude;
        });
      } catch (e) {
        print("Error getting current location: $e");
      }
    } else {
      print("Location permission denied");
    }
  }

  Future<void> _captureAndSaveImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      await detectFaces(image.path);
    } else {
      print('User cancelled image selection');
    }
  }

  Future<void> detectFaces(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final faceDetector = GoogleMlKit.vision.faceDetector();
    final List<Face> faces = await faceDetector.processImage(inputImage);

    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      final double headEulerAngleY = face.headEulerAngleY ?? 0.0;
      final double smilingProbability = face.smilingProbability ?? 0.0;
      final double leftEyeOpenProbability = face.leftEyeOpenProbability ?? 0.0;
      final double rightEyeOpenProbability = face.rightEyeOpenProbability ?? 0.0;

      print("Bounding Box: $boundingBox");
      print("Head Euler Angle Y: $headEulerAngleY");
      print("Smiling Probability: $smilingProbability");
      print("Left Eye Open Probability: $leftEyeOpenProbability");
      print("Right Eye Open Probability: $rightEyeOpenProbability");
    }

    await faceDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text(
          'Clock Out',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(
          size: 30, // Atur ukuran ikon di sini
          color: Colors.blue, // Atur warna ikon di sini
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: _ac.rHP(3),right: _ac.rHP(3),left: _ac.rHP(3),bottom: _ac.rHP(3)),
              
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: _ac.rHP(90),
                  width: _ac.rHP(75),
                  child: Padding(
                    padding: EdgeInsets.only(top: _ac.rHP(3)),
                    child: Column(
                      children: [
                        Container(
                          width: _ac.rWP(74),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Nama',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ),
                              SizedBox(height: _ac.rHP(0.5)),
                              Container(
                                child: Container(
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: 'Muhammad Alfi Syahrin',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      filled: true,
                                      fillColor: Colors.blueGrey.shade100,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(left: _ac.rHP(2.5)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: _ac.rHP(3)),
                        Container(
                          width: _ac.rWP(74),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Foto Selfie',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ),
                              SizedBox(height: _ac.rHP(0.5)),
                              ElevatedButton(
                                onPressed: () =>
                                    _captureAndSaveImage(),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 25)),
                                  minimumSize: MaterialStateProperty.all(Size(
                                      _ac.rWP(100), 30)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_circle_outline_outlined,
                                        color: Colors.white),
                                    SizedBox(width: 6),
                                    Text('Capture Foto Selfie',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                              ),
                              Container(
                                child: Container(
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: 'Tidak Ada Foto',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      filled: true,
                                      fillColor: Colors.blueGrey.shade100,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(left: _ac.rHP(2.5)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: _ac.rHP(3)),
                        Container(
                          width: _ac.rWP(74),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Lat',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ),
                              SizedBox(height: _ac.rHP(0.5)),
                              Container(
                                child: Container(
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: latitude != null
                                          ? latitude.toString()
                                          : 'Loading...',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      filled: true,
                                      fillColor: Colors.blueGrey.shade100,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(left: _ac.rHP(2.5)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: _ac.rHP(3)),
                        Container(
                          width: _ac.rWP(74),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Long',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ),
                              SizedBox(height: _ac.rHP(0.5)),
                              Container(
                                child: Container(
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: longitude != null
                                          ? longitude.toString()
                                          : 'Loading...',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      filled: true,
                                      fillColor: Colors.blueGrey.shade100,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(left: _ac.rHP(2.5)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: _ac.rHP(3)),
                        Container(
                          width: _ac.rWP(74),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: _ac.rHP(0.5)),
                              SizedBox(height: _ac.rHP(0.5)),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Clock In action here
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.green.shade500),
                                  foregroundColor:
                                      MaterialStateProperty.all(
                                          Colors.black),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 25)),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(_ac.rWP(100), 30)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(
                                                  6))),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 6),
                                    Text('Clock In',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
