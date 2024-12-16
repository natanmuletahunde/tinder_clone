import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
   
   final TextEditingController? editingController;
   final IconData?iconData;
   final String? assetRef;
   final String? labelText;
   final bool? isObscure;

  CustomTextFieldWidget({super.key,
  this.editingController,
  this.iconData,
  this.assetRef,
  this.labelText,
  this.isObscure = false
  });
     
  @override
  Widget build(BuildContext context) {
    return TextField(
     controller: editingController,
     decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: iconData!=null? Icon(iconData):Padding(padding: EdgeInsets.all(8),
      child: Image.asset(assetRef.toString()
      ),
      )
     ),

    );
  }
}