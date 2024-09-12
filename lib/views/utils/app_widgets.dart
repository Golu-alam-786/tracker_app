import 'package:flutter/material.dart';

class AppWidgets{

  Widget textFormFieldView({required TextEditingController? controller,bool? enabled,String? Function(String?)? validator,required String label,String? hintText}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        validator: validator,
        decoration: InputDecoration(
            label: Text(label),
            hintText: hintText,
            border: const OutlineInputBorder()
        ),
      ),
    );
  }
  Widget elevatedButtonView({required void Function()? onPressed,required String data}){
    return ElevatedButton(
      onPressed: onPressed,style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: const Size(250, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    ), child: Text(data,style: const TextStyle(color: Colors.white),),);
  }
  Widget sizedBoxView({Widget? child,double? width,double? height}){
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }

  Future screenPushReplacement({required context,required screen}){
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen,));

  }

  Future screenPush({required context,required screen}){
    return Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));

  }
}