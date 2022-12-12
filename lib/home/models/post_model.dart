import 'dart:convert';

PostModel postModelFromMap(Map<String, dynamic> str) => PostModel.fromMap(str);

String postModelToMap(PostModel data) => json.encode(data.toMap());

class PostModel {
    const PostModel({
        required this.image,
        required this.createdAt,
        required this.description,
        required this.title,
        required this.user,
    });

    final String image;
    final DateTime createdAt;
    final String description;
    final String title;
    final Map<String, dynamic> user;

    factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        description: json["description"],
        title: json["title"],
        user: json["user"],
    );

    Map<String, dynamic> toMap() => {
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "description": description,
        "title": title,
        "user": user,
    };
}

class User {
    const User({
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    final String firstName;
    final String lastName;
    final String avatar;

    factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
    };
}
