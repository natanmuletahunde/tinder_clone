import 'package:flutter/material.dart';

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
    TextEditingController profileHeadingTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}