// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class User {
  final String? id;
  final String picture;
  final String email;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String? state;
  final String city;
  final String brief;

  User({
    this.id,
    required this.picture,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    this.state,
    required this.city,
    required this.brief,
  });

  User copyWith({
    String? id,
    String? picture,
    String? email,
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    String? state,
    String? city,
    String? brief,
  }) {
    return User(
      id: id ?? this.id,
      picture: picture ?? this.picture,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      state: state ?? this.state,
      city: city ?? this.city,
      brief: brief ?? this.brief,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'picture': picture,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toString().substring(0, 10),
      'state': state,
      'city': city,
      'brief': brief,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    final dateFormated = DateFormat('yyyy-MM-DD').parse(map["birthDate"]);
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      picture: map['picture'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      birthDate: dateFormated,
      state: map['state'] != null ? map['state'] as String : null,
      city: map['city'] as String,
      brief: map['brief'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, picture: $picture, email: $email, firstName: $firstName, lastName: $lastName, birthDate: $birthDate, state: $state, city: $city, brief: $brief)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.picture == picture &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.birthDate == birthDate &&
        other.state == state &&
        other.city == city &&
        other.brief == brief;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        picture.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        birthDate.hashCode ^
        state.hashCode ^
        city.hashCode ^
        brief.hashCode;
  }
}
