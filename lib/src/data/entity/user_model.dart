import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    final String title;
    final String subtitle;
    final String id;

    UserModel({
        required this.title,
        required this.subtitle,
        required this.id,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        title: json["title"],
        subtitle: json["subtitle"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "id": id,
    };
}
