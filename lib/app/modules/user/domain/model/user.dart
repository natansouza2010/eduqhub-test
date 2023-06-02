// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String picture;
  final String email;
  final String firstName;
  final DateTime birthDate;
  final String state;
  final String city;
  final String brief;

  User({
    required this.picture,
    required this.email,
    required this.firstName,
    required this.birthDate,
    required this.state,
    required this.city,
    required this.brief,
  });

  User copyWith({
    String? picture,
    String? email,
    String? firstName,
    DateTime? birthDate,
    String? state,
    String? city,
    String? brief,
  }) {
    return User(
      picture: picture ?? this.picture,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      birthDate: birthDate ?? this.birthDate,
      state: state ?? this.state,
      city: city ?? this.city,
      brief: brief ?? this.brief,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'picture': picture,
      'email': email,
      'firstName': firstName,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'state': state,
      'city': city,
      'brief': brief,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      picture: map['picture'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int),
      state: map['state'] as String,
      city: map['city'] as String,
      brief: map['brief'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(picture: $picture, email: $email, firstName: $firstName, birthDate: $birthDate, state: $state, city: $city, brief: $brief)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.picture == picture &&
        other.email == email &&
        other.firstName == firstName &&
        other.birthDate == birthDate &&
        other.state == state &&
        other.city == city &&
        other.brief == brief;
  }

  @override
  int get hashCode {
    return picture.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        birthDate.hashCode ^
        state.hashCode ^
        city.hashCode ^
        brief.hashCode;
  }
}
