/* 
  "id": 1,
    "name": "test",
    "birthDate": "2010-03-04T00:54:28.078",
    "age": 25,
    "gender": 0,
    "password": "xxxxxxx"
*/

class User {
  int? id;
  String? name;
  String? birthDate;
  int? age;
  int? gender;
  String? password;
  User({
    this.id,
    this.name,
    this.birthDate,
    this.age,
    this.gender,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    name = json['name'].toString();
    birthDate = json['birthDate'].toString();
    age = json['age'].toInt();
    gender = json['gender'].toInt();
    password = json['password'].toString();
  }
}
