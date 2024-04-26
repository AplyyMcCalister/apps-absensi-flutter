import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String accessToken;
    String tokenType;
    int expiresIn;
    User user;

    LoginResponse({
        required this.accessToken,
        required this.tokenType,
        required this.expiresIn,
        required this.user,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "user": user.toJson(),
    };
}

class User {
    String userId;
    String idRole;
    String idCompany;
    String userNik;
    String userName;
    String userEmail;
    DateTime emailVerifiedAt;
    String userPosition;
    String userPhone;
    String password;
    dynamic rememberToken;
    String photo;
    dynamic userTrello;
    int userAdmin;
    int userSkema;
    dynamic gajiPokok;
    dynamic gajiJam;
    dynamic tunjangan;
    dynamic kesehatan;
    dynamic lemburWeekday;
    dynamic lemburWeekend;
    int userStatus;
    DateTime dateOfBirth;
    DateTime dateInCompany;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    User({
        required this.userId,
        required this.idRole,
        required this.idCompany,
        required this.userNik,
        required this.userName,
        required this.userEmail,
        required this.emailVerifiedAt,
        required this.userPosition,
        required this.userPhone,
        required this.password,
        required this.rememberToken,
        required this.photo,
        required this.userTrello,
        required this.userAdmin,
        required this.userSkema,
        required this.gajiPokok,
        required this.gajiJam,
        required this.tunjangan,
        required this.kesehatan,
        required this.lemburWeekday,
        required this.lemburWeekend,
        required this.userStatus,
        required this.dateOfBirth,
        required this.dateInCompany,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        idRole: json["id_role"],
        idCompany: json["id_company"],
        userNik: json["user_nik"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        userPosition: json["user_position"],
        userPhone: json["user_phone"],
        password: json["password"],
        rememberToken: json["remember_token"],
        photo: json["photo"],
        userTrello: json["user_trello"],
        userAdmin: json["user_admin"],
        userSkema: json["user_skema"],
        gajiPokok: json["gaji_pokok"],
        gajiJam: json["gaji_jam"],
        tunjangan: json["tunjangan"],
        kesehatan: json["kesehatan"],
        lemburWeekday: json["lembur_weekday"],
        lemburWeekend: json["lembur_weekend"],
        userStatus: json["user_status"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        dateInCompany: DateTime.parse(json["date_in_company"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id_role": idRole,
        "id_company": idCompany,
        "user_nik": userNik,
        "user_name": userName,
        "user_email": userEmail,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "user_position": userPosition,
        "user_phone": userPhone,
        "password": password,
        "remember_token": rememberToken,
        "photo": photo,
        "user_trello": userTrello,
        "user_admin": userAdmin,
        "user_skema": userSkema,
        "gaji_pokok": gajiPokok,
        "gaji_jam": gajiJam,
        "tunjangan": tunjangan,
        "kesehatan": kesehatan,
        "lembur_weekday": lemburWeekday,
        "lembur_weekend": lemburWeekend,
        "user_status": userStatus,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "date_in_company": "${dateInCompany.year.toString().padLeft(4, '0')}-${dateInCompany.month.toString().padLeft(2, '0')}-${dateInCompany.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}