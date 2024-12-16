import 'package:flutter/material.dart';
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
                height: 22,
              ),
              const Text(
                'to get started Now',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 22,
              ),
              //  upload the images
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/profile_avatar.jpg'),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // Registration

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
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
