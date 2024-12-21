import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder/authenticationScreen/login_screen.dart';
import 'package:tinder/homeScreen/home_screen.dart';
import 'package:tinder/models/person.dart' as personModel;

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  // Firebase Auth current user
  late Rx<User?> FirebaseCurrentUser;

  // Observable for storing the picked file
  Rx<File?> pickedFile = Rx<File?>(null);

  File? get profileImage => pickedFile.value;

  get imageFile => null;

  // Pick image from gallery
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

  // Capture image using the camera
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

  // Upload image to Firebase Storage
  Future<String> uploadImageToStorage(File imageProfile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child('Profile Images')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask task = referenceStorage.putFile(imageProfile);
    TaskSnapshot snapshot = await task;
    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
    return downloadUrlOfImage;
  }

  // Check if the user is logged in or not
  checkIfUserIsLoggedIn(User? currentUser) {
    if (currentUser != null) {
      Get.offAll(() => const HomeScreen()); // Navigate to HomeScreen
    } else {
      Get.offAll(() => const LoginScreen()); // Navigate to LoginScreen
    }
  }

  // Fixed onReady logic
  @override
  void onReady() {
    super.onReady();
    FirebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);

    // Bind the stream to track auth state changes
    FirebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

    // Listen to FirebaseCurrentUser changes and handle navigation
    ever<User?>(FirebaseCurrentUser, (user) {
      if (user != null) {
        print("User logged in: ${user.email}");
        Get.offAll(() => const HomeScreen()); // Navigate to HomeScreen
      } else {
        print("User logged out");
        Get.offAll(() => const LoginScreen()); // Navigate to LoginScreen
      }
    });
  }

  // Create a new user account
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
  ) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);
      personModel.Person personInstance = personModel.Person(
        uid:FirebaseAuth.instance.currentUser!.uid,
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
        height: height,
        bodyType: bodyType,
        weight: weight,
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
      Get.snackbar('Account created', 'Congratulations');
      Get.to(const HomeScreen());
    } catch (errorMsg) {
      Get.snackbar('Account Creation Unsuccessful', 'Error occurred: $errorMsg');
    }
  }
}
