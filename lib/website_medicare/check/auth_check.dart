import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/website_medicare/web_screens/web_auth/web_sign_in.dart';
import 'package:medicare/website_medicare/web_screens/web_home/web_main_dashboard.dart';

class WebAuthCheck extends StatefulWidget {
  const WebAuthCheck({super.key});

  @override
  State<WebAuthCheck> createState() => _WebAuthCheckState();
}

class _WebAuthCheckState extends State<WebAuthCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // If user is logged in, navigate to MainDashboard
          return MainDashboardWeb();
        } else {
          // If not logged in, navigate to LoginScreen
          return WebSignInPage();
        }
      },
    );
  }
}
