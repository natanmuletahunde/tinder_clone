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
                height:20,
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
              //  upload the images
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/profile_avatar.jpg'),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // Registration  personal information
                 const Center(
                  child: Text('Personal Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),),
                ),
             const SizedBox(height: 20,),
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
               const SizedBox(height: 20,),
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
               const SizedBox(height: 20,),
              // age
               
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: 'Age',
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20,),
              // phoneNo
          SizedBox(
            width: MediaQuery.of(context).size.width -36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: phoneNoTextEditingController,
              labelText: 'Phone',
              iconData: Icons.phone,
              isObscure: false,
            ),
          ),
      const SizedBox(height: 20,),
              // city
               SizedBox(
                width: MediaQuery.of(context).size.width  -36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: 'City',
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
               ),

            const SizedBox(height: 20,),
              //country
               SizedBox(
                width: MediaQuery.of(context).size.width -36,
                 height: 55,
                 child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: 'Country',
                  iconData:Icons.location_city,
                  isObscure: false,
                 ),
                 ),
            const SizedBox(height: 20,),
              //profileHeading 
               SizedBox(
               width: MediaQuery.of(context).size.width -36,
               height: 55,
               child:CustomTextFieldWidget(
                editingController: profileHeadingTextEditingController,
                labelText: 'Profile Heading',
                iconData: Icons.text_fields,
                isObscure: false,
               ),
               ),
              const SizedBox(height: 20,),
              //lookingforinapartner
               SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:lookingForInapartnerTextEditingController,
                  labelText: 'Looking for Inapartner',
                  iconData: Icons.face,
                  isObscure: false,
                  
                ),
               ),
               const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
