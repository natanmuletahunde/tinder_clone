import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  createNewUserAccount(
    String imageProfile,
    String name,
    String age,
    String phoneNo,
    String city,
    String country,
    String profileHeading,
    String lookingForInAPartner,
    String height,
    String bodyType,
    String width,
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
  ) 
  {
    try{

    } 
    catch(errorMsg){
     Get.snackbar('Account Creation Unsuccessful', 'Error occured: $errorMsg');
    }

  } 
}
