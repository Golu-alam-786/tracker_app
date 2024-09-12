import 'package:flutter/material.dart';
import 'package:tracker_app/views/screens/home_screen/home_screen.dart';
import 'package:tracker_app/views/utils/app_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var view = AppWidgets();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();

  void userLogin() {
    if (_formKey.currentState!.validate()) {
      view.screenPushReplacement(context: context, screen: HomeScreen(userName: userName.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              view.textFormFieldView(
                controller: userName,
                label: "Please Enter Your Username",
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter a Username";
                } else if (value != userName.text) {
                  return 'Invalid username';
                }
                return null;
              },),
              const SizedBox(height: 20),
              view.elevatedButtonView(onPressed: userLogin, data: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
