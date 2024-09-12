import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicare/screens/main/main_dashboard.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/uitls/image_utils.dart';
import 'package:medicare/widgets/save_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController customerFullNameContoller = TextEditingController();
  TextEditingController customerPhoneNumberController = TextEditingController();

  bool _isLoading = false;
  Uint8List? _image;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: white,
              )),
          title: Text(
            "Edit Profile",
            style: GoogleFonts.workSans(
                color: white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => selectImage(),
                  child: _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : imageUrl != null
                          ? CircleAvatar(
                              radius: 59,
                              backgroundImage: NetworkImage(imageUrl!))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/person.png",
                                height: 100,
                              ),
                            ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: customerFullNameContoller,
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
                      hintText: "Enter Full Name",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: black, fontSize: 12)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: TextFormField(
                  controller: customerPhoneNumberController,
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
                      hintText: "Enter Phone Number",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: black, fontSize: 12)),
                ),
              ),
              Center(
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: mainColor,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SaveButton(
                            title: "Confirm",
                            onTap: () async {
                              Navigator.pop(context);
                            }),
                      ),
              ),
            ],
          ),
        ));
  }

  selectImage() {}
}
