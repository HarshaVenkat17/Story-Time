import 'package:flutter/material.dart';
import 'package:story_time/screens/welcome_screen.dart';
import 'package:story_time/screens/login_screen.dart';
import 'package:story_time/screens/registration_screen.dart';
import 'package:story_time/screens/chat_screen.dart';
import 'package:story_time/screens/story_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StoryTime());
}

class StoryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        StoryScreen.id: (context) => StoryScreen()
      },
    );
  }
}
