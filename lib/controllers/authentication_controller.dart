import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder/models/person.dart' as personModel;

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  // Observable for storing the picked file
  Rx<File?> pickedFile = Rx<File?>(null);

  File? get profileImage => pickedFile.value;

  get imageFile => null;

  pickImageFileFromGallery() async {
    try {
      XFile? imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        pickedFile.value = File(imageFile.path);
        Get.snackbar('Profile Image',
            'You have successfully picked your profile image.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  // Method to capture an image from the camera

  captureImageFromPhoneCamera() async {
    try {
      XFile? imageFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imageFile != null) {
        pickedFile.value = File(imageFile.path);
        Get.snackbar('Profile Image',
            'You have successfully captured your profile image using the camera.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to capture image: $e');
    }
  }

  Future<String> uploadImageToStorage(File imageProfile) async {
    // Accepting imageProfile as a parameter
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child('Profile Images')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask task =
        referenceStorage.putFile(imageProfile); // Using imageProfile here
    TaskSnapshot snapshot = await task;

    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
    return downloadUrlOfImage;
  }

  createNewUserAccount(
    File imageProfile,
    String name,
    String email,
    String password,
    String age,
    String phoneNo,
    String city,
    String country,
    String profileHeading,
    String lookingForInAPartner,
    String height,
    String bodyType,
    String weight,
    String drink,
    String smoke,
    String maritalStatus,
    String haveChildren,
    String noOfChildren,
    String profession,
    String employmentStatus,
    String income,
    String livingSituation,
    String willingToRelocate,
    String relationshipYouAreLookingFor,
    String nationality,
    String education,
    String languageSpoken,
    String religion,
    String ethnicity,
    int publishedDateTime,
  ) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String urlOfDownloadedImage = await uploadImageToStorage(
          imageProfile); // Now passing imageProfile correctly
      personModel.Person personInstance = personModel.Person(
        imageProfile: urlOfDownloadedImage,
        name: name,
        email: email,
        password: password,
        age: int.parse(age),
        phoneNo: phoneNo,
        city: city,
        country: country,
        profileHeading: profileHeading,
        lookingForInAPartner: lookingForInAPartner,
        publishedDateTime: publishedDateTime,

        // Appearance
        height: height,
        bodyType: bodyType,
        weight: weight,

        // Lifestyle
        drink: drink,
        smoke: smoke,
        maritalStatus: maritalStatus,
        haveChildren: haveChildren,
        noOfChildren: noOfChildren,
        profession: profession,
        employmentStatus: employmentStatus,
        income: income,
        livingSituation: livingSituation,
        willingToRelocate: willingToRelocate,
        relationshipYouAreLookingFor: relationshipYouAreLookingFor,

        // Background - Cultural Values
        nationality: nationality,
        education: education,
        languageSpoken: languageSpoken,
        religion: religion,
        ethnicity: ethnicity,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());
         Get.snackbar('Account created ','Congratulations');

    } catch (errorMsg) {
      Get.snackbar('Account Creation Unsuccessful', 'Error occured: $errorMsg');
    }
  }
}
