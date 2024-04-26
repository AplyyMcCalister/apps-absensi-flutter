import 'package:bara_flutter/model/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator
import 'package:permission_handler/permission_handler.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:http/http.dart' as http;

class ClockIns extends StatefulWidget {
  const ClockIns({Key? key}) : super(key: key);

  @override
  _ClockInState createState() => _ClockInState();
}

class _ClockInState extends State<ClockIns> {
  String selectedValue = 'Masuk Kantor';
  double? latitude;
  double? longitude;
  String name = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    User user = User(
      userId: 'a493aed1-b650-4c17-b1b3-54e0969a9456',
      idRole: '9ea51579-1755-4aa7-97b7-204cb5da0e91',
      idCompany: '4525a9ec-39e5-4b90-b043-1aec92623500',
      userNik: '0012024041000001',
      userName: 'Agus Setiawan', // Masukkan nama pengguna di sini
      userEmail: 'replyagussetiawan@gmail.com',
      // Isi properti lainnya sesuai kebutuhan
    );
    // Mengambil nama pengguna dari objek User dan menyimpannya di name
    name = user.userName;
  }

  Future<void> _getCurrentLocation() async {
    // Dapatkan izin lokasi
    var permission = await Permission.locationWhenInUse.request();
    if (permission.isGranted) {
      try {
        // Dapatkan posisi saat ini
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
    // Ambil gambar dari kamera
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Deteksi wajah pada gambar
      await detectFaces(image.path);
    } else {
      print('User cancelled image selection');
    }
  }

  

  Future<void> detectFaces(String imagePath) async {
    // Proses gambar untuk mendeteksi wajah
    final inputImage = InputImage.fromFilePath(imagePath);
    final faceDetector = GoogleMlKit.vision.faceDetector();
    final List<Face> faces = await faceDetector.processImage(inputImage);

    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      final double headEulerAngleY = face.headEulerAngleY ?? 0.0;
      final double smilingProbability = face.smilingProbability ?? 0.0;
      final double leftEyeOpenProbability = face.leftEyeOpenProbability ?? 0.0;
      final double rightEyeOpenProbability =
          face.rightEyeOpenProbability ?? 0.0;

      print("Bounding Box: $boundingBox");
      print("Head Euler Angle Y: $headEulerAngleY");
      print("Smiling Probability: $smilingProbability");
      print("Left Eye Open Probability: $leftEyeOpenProbability");
      print("Right Eye Open Probability: $rightEyeOpenProbability");
    }

    await faceDetector.close();
  }

  Future<void> _clockIn() async {
    // Data untuk dikirim ke API
    var data = {
      'lat': latitude.toString(),
      'long': longitude.toString(),
      'foto': 'foto', // Ganti dengan nama file foto yang diambil
      'tipe': selectedValue,
      'alasan': 'alasan' // Ganti dengan alasan clock in yang diperlukan
    };

    // Kirim permintaan HTTP ke API
    var response = await http.post(
      Uri.parse(
          'http://127.0.0.1:8000/api/absensi/clock-in'), // Ganti URL_API_ANDA dengan URL API Anda
      body: data,
    );

    // Cek status kode respon
    if (response.statusCode == 200) {
      print('Clock in berhasil');
      // Handle response jika clock in berhasil
    } else {
      print('Clock in gagal');
      // Handle response jika clock in gagal
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text(
          'Clock In',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(
          size: 30, // Adjust icon size here
          color: Colors.blue, // Adjust icon color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nama',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: '$name',
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12), // Adjust padding as needed
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Foto Selfie',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _captureAndSaveImage(),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 25), // Adjust padding as needed
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline_outlined,
                        color: Colors.white),
                    SizedBox(width: 6),
                    Text(
                      'Capture Foto Selfie',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Lat',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText:
                      latitude != null ? latitude.toString() : '$latitude',
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12), // Adjust padding as needed
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Long',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText:
                      longitude != null ? longitude.toString() : '$longitude  ',
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12), // Adjust padding as needed
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tipe',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  }
                },
                items: <String>['Masuk Kantor', 'WFH', 'Dinas']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                dropdownColor: Colors.white,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 26,
                isExpanded: true,
                underline: SizedBox(),
                elevation: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _clockIn(); // Panggil fungsi clock in saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade500,
                  padding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 25), // Adjust padding as needed
                ),
                child: Text(
                  'Clock In',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
