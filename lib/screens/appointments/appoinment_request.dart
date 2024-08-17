import 'package:flutter/material.dart';

class AppoinmentRequest extends StatefulWidget {
  final fullName;
  final experience;
  final about;
  final department;
  final photoURL;
  int rate;
  final review;
  final hospitalName;
  final numberreviews;
  final consultantFees;
  final price;
  final paitientName;
  final problem;
  final dob;
  final file;
  final gender;
  AppoinmentRequest({
    super.key,
    required this.file,
    required this.about,
    required this.consultantFees,
    required this.department,
    required this.dob,
    required this.experience,
    required this.fullName,
    required this.gender,
    required this.hospitalName,
    required this.numberreviews,
    required this.paitientName,
    required this.photoURL,
    required this.price,
    required this.problem,
    required this.rate,
    required this.review,
  });

  @override
  State<AppoinmentRequest> createState() => _AppoinmentRequestState();
}

class _AppoinmentRequestState extends State<AppoinmentRequest> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
