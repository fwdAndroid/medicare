import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicare/screens/details/appointment_detail.dart';

import 'package:medicare/uitls/colors.dart';
import 'package:medicare/website_medicare/image_select.dart';
import 'package:medicare/website_medicare/web_appointments/appointment_detail_web.dart';
import 'package:medicare/website_medicare/web_screens/web_home/web_main_dashboard.dart';

class AppointmentRequestWebDone extends StatefulWidget {
  final appointmentDate;
  final appointmentId;
  final appointmentTime;
  final doctorDepartment;
  final doctorExperience;
  final doctorFees;
  final doctorName;
  final doctorPhoto;
  final paitientName;
  final doctorid;
  final patientId;
  final patientDob;
  final patientDocument;
  final patientGender;
  final patientProblem;
  final rate;
  final review;
  final appointmentStatus;
  AppointmentRequestWebDone({
    super.key,
    required this.appointmentDate,
    required this.appointmentId,
    required this.appointmentStatus,
    required this.appointmentTime,
    required this.doctorDepartment,
    required this.doctorExperience,
    required this.doctorFees,
    required this.doctorName,
    required this.doctorPhoto,
    required this.doctorid,
    required this.paitientName,
    required this.patientDob,
    required this.patientDocument,
    required this.patientGender,
    required this.patientId,
    required this.patientProblem,
    required this.rate,
    required this.review,
  });

  @override
  State<AppointmentRequestWebDone> createState() =>
      _AppointmentRequestWebDoneState();
}

class _AppointmentRequestWebDoneState extends State<AppointmentRequestWebDone> {
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
                  appointmentDate: widget.appointmentDate,
                  appointmentId: widget.appointmentId,
                  appointmentStatus: widget.appointmentStatus,
                  appointmentTime: widget.appointmentTime,
                  doctorDepartment: widget.doctorDepartment,
                  doctorExperience: widget.doctorExperience,
                  doctorFees: widget.doctorFees.toString(),
                  doctorName: widget.doctorName,
                  doctorPhoto: widget.doctorPhoto,
                  doctorid: widget.doctorid,
                  paitientName: widget.paitientName,
                  patientDob: widget.patientDob,
                  patientDocument: widget.patientDocument,
                  patientGender: widget.patientGender,
                  patientId: widget.patientId,
                  patientProblem: widget.patientProblem,
                  rate: widget.rate,
                  review: widget.review,
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
  final appointmentDate;
  final appointmentId;
  final appointmentTime;
  final doctorDepartment;
  final doctorExperience;
  final doctorFees;
  final doctorName;
  final doctorPhoto;
  final paitientName;
  final doctorid;
  final patientId;
  final patientDob;
  final patientDocument;
  final patientGender;
  final patientProblem;
  final rate;
  final review;
  final appointmentStatus;
  FormSection({
    super.key,
    required this.appointmentDate,
    required this.appointmentId,
    required this.appointmentStatus,
    required this.appointmentTime,
    required this.doctorDepartment,
    required this.doctorExperience,
    required this.doctorFees,
    required this.doctorName,
    required this.doctorPhoto,
    required this.doctorid,
    required this.paitientName,
    required this.patientDob,
    required this.patientDocument,
    required this.patientGender,
    required this.patientId,
    required this.patientProblem,
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
    return Container(
      width: 448,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/success icon.png",
                width: 150,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Appointment Success!",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: appColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 60,
                  child: Text(
                    "Your appointment has been successfully scheduled. You can see details from your  Appointments Tab.",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MainDashboardWeb()));
                    },
                    child: Image.asset(
                      "assets/home.png",
                      height: 48,
                      width: 160,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => AppointmentDetailWeb(
                                  doctorDepartment: widget.doctorDepartment,
                                  appointmentDate: widget.appointmentDate,
                                  appointmentId: widget.appointmentId,
                                  doctorExperience: widget.doctorExperience,
                                  doctorFees: widget.doctorFees,
                                  appointmentTime: widget.appointmentTime,
                                  doctorName: widget.doctorName,
                                  doctorPhoto: widget.doctorPhoto,
                                  doctorid: widget.doctorid,
                                  paitientName: widget.paitientName,
                                  patientDob: widget.patientDob,
                                  patientDocument: widget.patientDocument,
                                  patientGender: widget.patientGender,
                                  patientId: widget.patientId,
                                  patientProblem: widget.patientProblem,
                                  rate: widget.rate,
                                  review: widget.review,
                                  appointmentStatus:
                                      widget.appointmentStatus)));
                    },
                    child: Image.asset(
                      "assets/view.png",
                      height: 48,
                      width: 160,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
