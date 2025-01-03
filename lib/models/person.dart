import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  // Personal Information
  String uid;

  String? imageProfile;
  String? name;
  String? email;
  String?password;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInAPartner;
  int? publishedDateTime;

  // Appearance
  String? height;
  String? bodyType;
  String? weight;

  // Lifestyle
  String? drink;
  String? smoke;
  String? maritalStatus; // Fixed spelling: "martialStatus" -> "maritalStatus"
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  // Background - Cultural Values
  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;

  Person({
    required this.uid,
    this.imageProfile,
    this.name,
    this.email,
    this.password,
    this.age,
    this.phoneNo,
    this.city,  
    this.country,
    this.profileHeading,
    this.lookingForInAPartner,
    this.publishedDateTime,
    this.height,
    this.bodyType,
    this.weight,
    this.drink,
    this.smoke,
    this.maritalStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,
    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,
  });

  // Factory method to create a Person object from a Firestore DocumentSnapshot
  static Person fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      // Personal Information
      uid: dataSnapshot['uid'],
      imageProfile: dataSnapshot['imageProfile'],
      name: dataSnapshot['name'],
      email: dataSnapshot['email'],
      password: dataSnapshot['password'],
      age: dataSnapshot['age'],
      phoneNo: dataSnapshot['phoneNo'],
      city: dataSnapshot['city'],
      country: dataSnapshot['country'],
      profileHeading: dataSnapshot['profileHeading'],
      lookingForInAPartner: dataSnapshot['lookingForInAPartner'],
      publishedDateTime: dataSnapshot['publishedDateTime'],

      // Appearance
      height: dataSnapshot['height'],
      bodyType: dataSnapshot['bodyType'],
      weight: dataSnapshot['weight'],

      // Lifestyle
      drink: dataSnapshot['drink'],
      smoke: dataSnapshot['smoke'],
      maritalStatus: dataSnapshot['maritalStatus'], // Fixed spelling
      haveChildren: dataSnapshot['haveChildren'],
      noOfChildren: dataSnapshot['noOfChildren'],
      profession: dataSnapshot['profession'],
      employmentStatus: dataSnapshot['employmentStatus'],
      income: dataSnapshot['income'],
      livingSituation: dataSnapshot['livingSituation'],
      willingToRelocate: dataSnapshot['willingToRelocate'],
      relationshipYouAreLookingFor: dataSnapshot['relationshipYouAreLookingFor'],

      // Background - Cultural Values
      nationality: dataSnapshot['nationality'],
      education: dataSnapshot['education'],
      languageSpoken: dataSnapshot['languageSpoken'],
      religion: dataSnapshot['religion'],
      ethnicity: dataSnapshot['ethnicity'],
    );
  }
 Map<String, dynamic> toJson() => {
  // Personal Informationi
  "uid":uid,
  "imageProfile": imageProfile,
  "name": name,
  "email": email,
  "password": password,
  "age": age,
  "phoneNo": phoneNo,
  "city": city,
  "country": country,
  "profileHeading": profileHeading,
  "lookingForInAPartner": lookingForInAPartner,
  "publishedDateTime": publishedDateTime,

  // Appearance
  "height": height,
  "bodyType": bodyType,
  "weight": weight,

  // Lifestyle
  "drink": drink,
  "smoke": smoke,
  "maritalStatus": maritalStatus,
  "haveChildren": haveChildren,
  "noOfChildren": noOfChildren,
  "profession": profession,
  "employmentStatus": employmentStatus,
  "income": income,
  "livingSituation": livingSituation,
  "willingToRelocate": willingToRelocate,
  "relationshipYouAreLookingFor": relationshipYouAreLookingFor,

  // Background - Cultural Values
  "nationality": nationality,
  "education": education,
  "languageSpoken": languageSpoken,
  "religion": religion,
  "ethnicity": ethnicity,
};

}
