import 'package:flutter/material.dart';
import 'package:tracker_app/controllers/inactivity_controller.dart';
import 'package:tracker_app/views/screens/home_screen/widgets/home_screen_body_widget.dart';
import 'package:tracker_app/views/screens/login_screen.dart';
import 'package:tracker_app/views/utils/app_widgets.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var view = AppWidgets();

  late InActivityController _inActivityController;
  int countdown = 30;
  bool isCountdownActive = false;

  @override
  void initState() {
    super.initState();
    _inActivityController = InActivityController(
      onLogout: _logout,
      onCountDownUpdate: _updateCountDown,
    );
    _inActivityController.startInactivityTimer();
  }

  void _logout() {
    view.screenPushReplacement(context: context, screen: const LoginScreen());
  }

  void _updateCountDown(int countdown) {
    setState(() {
      this.countdown = countdown;
      isCountdownActive = countdown < 30;
    });
  }

  @override
  void dispose() {
    _inActivityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _inActivityController.resetInactivityTimer,
      onPanUpdate: (details) => _inActivityController.resetInactivityTimer(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          actions: [
            IconButton(
              onPressed: _logout,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: HomeScreenBodyWidget(
              userName: widget.userName,
              isCountdownActive: isCountdownActive,
              countdown: countdown
          )
        ),
      ),
    );
  }
}
