import 'dart:convert';

EmployeeModel employeeModelJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  int id;
  String email;
  String firstName;
  String lastName;

  EmployeeModel({required this.id,required this.email, required this.firstName, required this.lastName});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      email: json["email"],firstName: json["firstName"], lastName: json["lastName"], id: json["id"]);

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    'id': id,
  };



  String get firstname => firstName;

  String get lastname => lastName;

  String get Email => email;
}
class coursModel
{
  int ? id;
  String ? courstype;
  int ? matiere;
  int ? professeurheure;
  int ? salle;
  HeuretravailleparjourByProfesseurheure ? heuretravailleparjourByProfesseurheure;


  coursModel.fromJSON(Map<String,dynamic> json)
  {
    id = json['id'];
    courstype = json['courstype'];
    matiere = json['matiere'];
    professeurheure = json['professeurheure'];
    salle = json['salle'];
    heuretravailleparjourByProfesseurheure = HeuretravailleparjourByProfesseurheure.fromJSON(json['heuretravailleparjourByProfesseurheure']);
  }

}

class HeuretravailleparjourByProfesseurheure
{
  int ? id;
  String ? jour;
  int ? debit;
  int ? fin;
  int ? professeur;



  HeuretravailleparjourByProfesseurheure.fromJSON(Map<String,dynamic> json)
  {
    id = json['id'];
    jour = json['jour'];
    debit = json['debit'];
    fin = json['fin'];
    professeur = json['professeur'];
  }

}