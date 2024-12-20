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
  TextEditingController   publishedDateTime = TextEditingController();
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
              // SizedBox(
              //   width: MediaQuery.of(context).size.width - 36,
              //   height: 55,
              //   child: CustomTextFieldWidget(
              //     editingController: haveChildrenTextEditingController,
              //     labelText: 'Do you have Have children?',
              //     iconData: CupertinoIcons.person_2,
              //     isObscure: false,
              //   ),
              // ),
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
             

         const SizedBox(height: 20,),

Container(
  width: MediaQuery.of(context).size.width - 36,
  height: 55,
  decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  child: InkWell(
    onTap: ()   async {
      if (authenticationController.profileImage != null) 
      {
        if (nameTextEditingController.text.trim().isNotEmpty &&
            emailTextEditingController.text.trim().isNotEmpty &&
            passwordTextEditingController.text.trim().isNotEmpty &&
            ageTextEditingController.text.trim().isNotEmpty &&
            phoneNoTextEditingController.text.trim().isNotEmpty &&
            cityTextEditingController.text.trim().isNotEmpty &&
            countryTextEditingController.text.trim().isNotEmpty &&
            profileHeadingTextEditingController.text.trim().isNotEmpty &&
            lookingForInapartnerTextEditingController.text.trim().isNotEmpty &&
            heightTextEditingController.text.trim().isNotEmpty &&
            bodyTypeTextEditingController.text.trim().isNotEmpty &&
            weightTextEditingController.text.trim().isNotEmpty &&
            drinkTextEditingController.text.trim().isNotEmpty &&
            smokeTextEditingController.text.trim().isNotEmpty &&
            martialStatusTextEditingController.text.trim().isNotEmpty &&
            haveChildrenTextEditingController.text.trim().isNotEmpty &&
            noOfChildrenTextEditingController.text.trim().isNotEmpty &&
            professionTextEditingController.text.trim().isNotEmpty &&
            employmentStatusTextEditingController.text.trim().isNotEmpty &&
            incomeTextEditingController.text.trim().isNotEmpty &&
            livingSituationTextEditingController.text.trim().isNotEmpty &&
            willingToRelocateTextEditingController.text.trim().isNotEmpty &&
            relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty &&
            nationalityTextEditingController.text.trim().isNotEmpty &&
            educationTextEditingController.text.trim().isNotEmpty &&
            languageSpokenTextEditingController.text.trim().isNotEmpty &&
            religionTextEditingController.text.trim().isNotEmpty &&
            ethnicityTextEditingController.text.trim().isNotEmpty) {
              setState(() {
                showProgressBar= true;
              });
            await   authenticationController.createNewUserAccount(
            authenticationController.profileImage!, // 1st argument
            nameTextEditingController.text.trim(), // 2nd
            emailTextEditingController.text.trim(), // 3rd
            passwordTextEditingController.text.trim(), // 4th
            ageTextEditingController.text.trim(), // 5th
            phoneNoTextEditingController.text.trim(), // 6th
            cityTextEditingController.text.trim(), // 7th
            countryTextEditingController.text.trim(), // 8th
            profileHeadingTextEditingController.text.trim(), // 9th
            lookingForInapartnerTextEditingController.text.trim(), // 10th
            heightTextEditingController.text.trim(), // 11th
            bodyTypeTextEditingController.text.trim(), // 12th
            weightTextEditingController.text.trim(), // 13th
            drinkTextEditingController.text.trim(), // 14th
            smokeTextEditingController.text.trim(), // 15th
            martialStatusTextEditingController.text.trim(), // 16th
            haveChildrenTextEditingController.text.trim(), // 17th
            noOfChildrenTextEditingController.text.trim(), // 18th
            professionTextEditingController.text.trim(), // 19th
            employmentStatusTextEditingController.text.trim(), // 20th
            incomeTextEditingController.text.trim(), // 21st
            livingSituationTextEditingController.text.trim(), // 22nd
            willingToRelocateTextEditingController.text.trim(), // 23rd
            relationshipYouAreLookingForTextEditingController.text.trim(), // 24th
            nationalityTextEditingController.text.trim(), // 25th
            educationTextEditingController.text.trim(), // 26th
            languageSpokenTextEditingController.text.trim(), // 27th
            religionTextEditingController.text.trim(), // 28th
            ethnicityTextEditingController.text.trim() // 29th
          );
             setState(() {
               showProgressBar = false;
             });
             



        } else {
          Get.snackbar(
            'A Field is Empty',
            'Please fill out all fields in text fields',
          );
        }
      } else {
        Get.snackbar(
          'Image File Missing',
          'Please pick from gallery or capture with camera',
        );
      }
    },
    child: const Center(
      child: Text(
        'Create Account',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
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
