import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/controllers/authentication_controller.dart';
import 'package:tinder/widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //  Personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController =
      TextEditingController();
  TextEditingController lookingForInapartnerTextEditingController =
      TextEditingController();
  TextEditingController professionTextEditingController =
      TextEditingController();
  // Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();
  // Life style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController =
      TextEditingController();
  TextEditingController haveChildrenTextEditingController =
      TextEditingController();
  TextEditingController noOfChildrenTextEditingController =
      TextEditingController();
  TextEditingController employmentStatusTextEditingController =
      TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController =
      TextEditingController();
  TextEditingController willingToRelocateTextEditingController =
      TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController =
      TextEditingController();
  // Background  - Cultural Values
  TextEditingController nationalityTextEditingController =
      TextEditingController();
  TextEditingController educationTextEditingController =
      TextEditingController();
  TextEditingController languageSpokenTextEditingController =
      TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController =
      TextEditingController();
  bool showProgressBar = false;

  final AuthenticationController authenticationController =
      AuthenticationController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'to get started Now',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              authenticationController.profileImage == null
                  ? const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('images/profile_avatar.jpg'),
                      backgroundColor: Colors.black,
                    )
                  : Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                          image: FileImage(authenticationController
                              .profileImage!), // Pass the File object here
                          fit:
                              BoxFit.cover, // Adjust fit to cover the container
                        ),
                      ),
                    ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromGallery();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      await authenticationController
                          .captureImageFromPhoneCamera();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Center(
                child: Text(
                  'Personal Info',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: 'Name',
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: 'Email',
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: 'Password',
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // age

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: 'Age',
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: 'Phone',
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: 'City',
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: 'Country',
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: 'Profile Heading',
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //lookingforinapartner
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lookingForInapartnerTextEditingController,
                  labelText: 'Looking for Inapartner',
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // appearance
              const Center(
                child: Text(
                  'Appearance',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: 'Height',
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: 'Body type',
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  labelText: 'weight',
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Life Style

              const Center(
                child: Text(
                  'Life Style',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: 'Drink',
                  iconData: Icons.local_drink_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: smokeTextEditingController,
                  labelText: 'Smoke',
                  iconData: Icons.smoking_rooms_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: martialStatusTextEditingController,
                  labelText: 'Marital Status',
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: haveChildrenTextEditingController,
                  labelText: 'Do you have Have children?',
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: haveChildrenTextEditingController,
                  labelText: 'Do You have Children ?',
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: noOfChildrenTextEditingController,
                  labelText: 'No of children',
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: professionTextEditingController,
                  labelText: 'Profession',
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: employmentStatusTextEditingController,
                  labelText: 'Employment Status',
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: incomeTextEditingController,
                  labelText: ' Income',
                  iconData: CupertinoIcons.money_dollar_circle,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: livingSituationTextEditingController,
                  labelText: 'Living Situation ',
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: willingToRelocateTextEditingController,
                  labelText: 'Are You willing To Relocate',
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:
                      relationshipYouAreLookingForTextEditingController,
                  labelText: 'Are YouLooking For Relationship?',
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Background

              const Center(
                child: Text(
                  'Background - Culture Value',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  labelText: 'Nationality',
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  labelText: 'Education',
                  iconData: Icons.history_edu_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: languageSpokenTextEditingController,
                  labelText: 'Languages Spoken',
                  iconData: CupertinoIcons.person_badge_plus,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: religionTextEditingController,
                  labelText: 'Religions Spoken',
                  iconData: CupertinoIcons.checkmark_seal_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ethnicityTextEditingController,
                  labelText: 'Ethnicity',
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: InkWell(
                  onTap: () {
                    if (authenticationController.profileImage != null) {
                      if (nameTextEditingController.text.trim().isEmpty &&
                          emailTextEditingController.text.trim().isEmpty &&
                          passwordTextEditingController.text.trim().isEmpty &&
                          ageTextEditingController.text.trim().isEmpty &&
                          phoneNoTextEditingController.text.trim().isEmpty &&
                          cityTextEditingController.text.trim().isEmpty &&
                          countryTextEditingController.text.trim().isEmpty &&
                          profileHeadingTextEditingController.text
                              .trim()
                              .isEmpty &&
                          lookingForInapartnerTextEditingController.text
                              .trim()
                              .isEmpty &&
                          heightTextEditingController.text.trim().isEmpty &&
                          bodyTypeTextEditingController.text.trim().isEmpty &&
                          weightTextEditingController.text.trim().isEmpty &&
                          drinkTextEditingController.text.trim().isEmpty &&
                          smokeTextEditingController.text.trim().isEmpty &&
                          martialStatusTextEditingController.text
                              .trim()
                              .isEmpty &&
                          haveChildrenTextEditingController.text
                              .trim()
                              .isEmpty &&
                          noOfChildrenTextEditingController.text
                              .trim()
                              .isEmpty &&
                          professionTextEditingController.text.trim().isEmpty &&
                          employmentStatusTextEditingController.text
                              .trim()
                              .isEmpty &&
                          incomeTextEditingController.text.trim().isEmpty &&
                          livingSituationTextEditingController.text
                              .trim()
                              .isEmpty &&
                          willingToRelocateTextEditingController.text
                              .trim()
                              .isEmpty &&
                          relationshipYouAreLookingForTextEditingController.text
                              .trim()
                              .isEmpty &&
                          nationalityTextEditingController.text
                              .trim()
                              .isEmpty &&
                          educationTextEditingController.text.trim().isEmpty &&
                          languageSpokenTextEditingController.text
                              .trim()
                              .isEmpty &&
                          religionTextEditingController.text.trim().isEmpty &&
                          ethnicityTextEditingController.text.trim().isEmpty)
                          {
                           //
                          } 
                      else {
                        Get.snackbar('A Field is Empty',
                            'Please fill out all field in text fields');
                      }
                    } else {
                      Get.snackbar('Image File Missing ',
                          'Please Pick from Gallery or capture with camera');
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already  have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      'Login Here',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
              showProgressBar == true
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container(),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
