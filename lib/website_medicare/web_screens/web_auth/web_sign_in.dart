import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare/services/auth_methods.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/uitls/message_utils.dart';
import 'package:medicare/website_medicare/web_screens/web_auth/chose_function_web.dart';
import 'package:medicare/website_medicare/web_screens/web_auth/web_forgot_password.dart';
import 'package:medicare/website_medicare/web_screens/web_auth/web_signup.dart';
import 'package:medicare/widgets/save_button.dart';

class WebSignInPage extends StatelessWidget {
  const WebSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                _FormSection(),
                _ImageSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FormSection extends StatefulWidget {
  const _FormSection({Key? key}) : super(key: key);

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  bool passwordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool isGoogle = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 448,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Log in",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.63),
          ),
          const SizedBox(height: 41),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          const SizedBox(height: 9),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _emailController,
              style: GoogleFonts.plusJakartaSans(color: black),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  hintText: "Enter Email Address",
                  hintStyle:
                      GoogleFonts.plusJakartaSans(color: black, fontSize: 12)),
            ),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          const SizedBox(height: 9),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              obscureText: passwordVisible,
              controller: _passwordController,
              style: GoogleFonts.plusJakartaSans(color: black),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  hintText: "Enter Password",
                  hintStyle:
                      GoogleFonts.plusJakartaSans(color: black, fontSize: 12)),
            ),
          ),
          const SizedBox(height: 30),
          _isLoading
              ? CircularProgressIndicator()
              : SaveButton(
                  title: "Login",
                  onTap: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      showMessageBar("Email and Password is Required", context);
                    } else {
                      setState(() {
                        _isLoading = true;
                      });
                      await AuthMethods().loginUpUser(
                        email: _emailController.text.trim(),
                        pass: _emailController.text.trim(),
                      );

                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => ChoseFunctionWeb()));
                    }
                  },
                ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 25),
              child: SizedBox(
                width: 154,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => WebForgotPassword()));
                  },
                  child: Text(
                    "Forgot Password",
                    style: GoogleFonts.dmSans(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 25),
              child: SizedBox(
                width: 154,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => WebSignup()));
                  },
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.dmSans(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logos.png",
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
