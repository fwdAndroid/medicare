import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicare/services/storage_methods.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/uitls/message_utils.dart';
import 'package:medicare/website_medicare/image_select.dart';
import 'package:medicare/website_medicare/web_appointments/appointment_request_done_web.dart';
import 'package:medicare/widgets/save_button.dart';
import 'package:medicare/widgets/text_form_field.dart';
import 'package:uuid/uuid.dart';

class AppoinmentRequestWeb extends StatefulWidget {
  final fullName;
  final experience;
  final about;
  final department;
  final photoURL;
  int rate;
  final doctorId;
  final review;
  final hospitalName;
  final numberreviews;
  final consultantFees;
  final price;
  final paitientName;
  final problem;
  final dob;
  final file;
  final paitientId;
  final gender;
  AppoinmentRequestWeb({
    super.key,
    required this.file,
    required this.doctorId,
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
    required this.paitientId,
    required this.price,
    required this.problem,
    required this.rate,
    required this.review,
  });

  @override
  State<AppoinmentRequestWeb> createState() => _AppoinmentRequestWebState();
}

class _AppoinmentRequestWebState extends State<AppoinmentRequestWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                FormSection(
                  paitientId: widget.paitientId,
                  problem: widget.problem,
                  paitientName: widget.paitientName,
                  gender: widget.gender,
                  dob: widget.dob,
                  file: widget.file,
                  fullName: widget.fullName,
                  consultantFees: widget.consultantFees.toString(),
                  experience: widget.experience,
                  rate: widget.rate,
                  review: widget.review,
                  hospitalName: widget.hospitalName.toString(),
                  about: widget.about,
                  numberreviews: widget.numberreviews.toString(),
                  department: widget.department,
                  doctorId: widget.doctorId,
                  photoURL: widget.photoURL,
                  price: widget.price.toString(),
                ),
                ImageSelection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FormSection extends StatefulWidget {
  final fullName;
  final experience;
  final about;
  final department;
  final photoURL;
  int rate;
  final doctorId;
  final review;
  final hospitalName;
  final numberreviews;
  final consultantFees;
  final price;
  final paitientName;
  final problem;
  final paitientId;
  final dob;
  final file;
  final gender;
  FormSection({
    super.key,
    required this.file,
    required this.doctorId,
    required this.about,
    required this.consultantFees,
    required this.department,
    required this.dob,
    required this.experience,
    required this.paitientId,
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
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  String currentTime = '';
  String currentDate = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    final now = DateTime.now();
    final timeFormat = DateFormat('hh:mm a');
    final dateFormat = DateFormat('EEEE, d MMM, yyyy');

    setState(() {
      currentTime = timeFormat.format(now); // Format for time
      currentDate = dateFormat.format(now); // Format for date
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _timeController = TextEditingController();
    bool isLoading = false;
    return Container(
      width: 448,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 360,
                decoration: BoxDecoration(
                  color: circle,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: dividerColor,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.memory(
                        widget.file,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Patient Name: ",
                                  style: GoogleFonts.poppins(
                                      color: appColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.paitientName,
                                  style: GoogleFonts.poppins(
                                      color: appColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Date of Birth: ",
                                  style: GoogleFonts.poppins(
                                      color: appColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.dob,
                                  style: GoogleFonts.poppins(
                                      color: appColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Text(
                              widget.problem,
                              style: GoogleFonts.poppins(
                                color: dateColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Appointment Date",
                    style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: appColor),
                  ),
                  TextFormField(
                    controller: _dateController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Appointment Time",
                    style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: appColor),
                  ),
                  TextFormField(
                    controller: _timeController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SaveButton(
                title: "Confirm Appointment",
                onTap: () async {
                  print("button Clocked");
                  print(widget.paitientId);
                  var uuid = Uuid().v4();
                  if (_dateController.text.isEmpty ||
                      _timeController.text.isEmpty) {
                    showMessageBar(
                        "Appointment Time and Date is Required ", context);
                  } else {
                    String photoURL =
                        await StorageMethods().uploadImageToStorage(
                      'DoctorDocument',
                      widget.file,
                    );
                    await FirebaseFirestore.instance
                        .collection("appointments")
                        .doc(uuid)
                        .set({
                      //Time
                      "appointmentId": uuid,
                      "appointmentDate": _dateController.text,
                      "appointmentTime": _timeController.text,
                      //Patient
                      "patientId": FirebaseAuth.instance.currentUser!.uid,
                      "patientProblem": widget.problem,
                      "patientDocument": photoURL,
                      "patientGender": widget.gender,
                      "patientDob": widget.dob,
                      "paitientName": widget.paitientName,

                      //Doctors
                      "doctorName": widget.fullName,
                      "doctorFees": widget.price,
                      "doctorPhoto": widget.photoURL,
                      "doctorDepartment": widget.department,
                      "doctorExperience": widget.experience,
                      "doctorid": widget.doctorId,

                      //Status
                      "appointmentStatus": "send",

                      //Rate and Review
                      "rate": widget.rate,
                      "review": widget.review,
                      //UUid
                      "uuid": uuid
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => AppointmentRequestWebDone(
                                  appointmentDate: _dateController.text,
                                  appointmentId: uuid,
                                  appointmentStatus: "send",
                                  appointmentTime: _timeController.text,
                                  doctorDepartment: widget.department,
                                  doctorExperience: widget.experience,
                                  doctorFees: widget.price,
                                  doctorName: widget.fullName,
                                  doctorPhoto: widget.photoURL,
                                  doctorid: widget.doctorId,
                                  patientDob: widget.dob,
                                  patientDocument: photoURL,
                                  patientGender: widget.gender,
                                  paitientName: widget.paitientName,
                                  patientId:
                                      FirebaseAuth.instance.currentUser!.uid,
                                  patientProblem: widget.problem,
                                  rate: widget.rate,
                                  review: widget.review,
                                )));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
