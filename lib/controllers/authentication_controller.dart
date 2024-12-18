import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationController {
  static AuthenticationController authenticationController = Get.find();
  late Rx<File?> pickedFile = Rx<File?>(null);

  static var authController; // Initialize the Rx<File?> variable
  File? get profileImage => pickedFile.value;

  pickImageFileFromGallery() async {
    final XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery); // Corrected XFile type
    if (imageFile != null) { 
      Get.snackbar('Profile Image', 'You have successfully picked your profile image.');
      pickedFile.value = File(imageFile.path); 
    }
  }
    captureImageFromPhoneCamera() async {
    final XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery); // Corrected XFile type
    if (imageFile != null) { 
      Get.snackbar('Profile Image', 'You have successfully captured  your profile image using camera .');
      pickedFile.value = File(imageFile.path); 
    }
  }

}
