import 'dart:convert'; // Import library untuk mengonversi JSON
import 'package:flutter/material.dart';

// Contoh JSON
String jsonData = '''
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
    "token_type": "bearer",
    "expires_in": 3600,
    "user": {
        "user_id": "a493aed1-b650-4c17-b1b3-54e0969a9456",
        "id_role": "9ea51579-1755-4aa7-97b7-204cb5da0e91",
        "id_company": "4525a9ec-39e5-4b90-b043-1aec92623500",
        "user_nik": "0012024041000001",
        "user_name": "Agus Setiawan",
        "user_email": "replyagussetiawan@gmail.com",
        ...
    }
}
''';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Parse JSON menjadi objek Dart
    Map<String, dynamic> parsedJson = json.decode(jsonData);

    // Buat objek user dari JSON
    User user = User.fromJson(parsedJson['user']);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data User'),
        ),
        body: Center(
          child: Text('Nama Pengguna: ${user.userName}'),
        ),
      ),
    );
  }
}

// Model data untuk mewakili struktur JSON
class User {
  final String userId;
  final String idRole;
  final String idCompany;
  final String userNik;
  final String userName;
  final String userEmail;
  // Tambahkan properti lainnya sesuai kebutuhan

  User({
    required this.userId,
    required this.idRole,
    required this.idCompany,
    required this.userNik,
    required this.userName,
    required this.userEmail,
    // Tambahkan properti lainnya sesuai kebutuhan
  });

  // Buat factory constructor untuk mengonversi JSON menjadi objek Dart
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      idRole: json['id_role'],
      idCompany: json['id_company'],
      userNik: json['user_nik'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      // Tambahkan properti lainnya sesuai kebutuhan
    );
  }
}
