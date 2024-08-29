import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medicare/uitls/colors.dart';
import 'package:medicare/website_medicare/image_select.dart';

class AppointmentDetailWeb extends StatefulWidget {
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
  AppointmentDetailWeb({
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
  State<AppointmentDetailWeb> createState() => _AppointmentDetailWebState();
}

class _AppointmentDetailWebState extends State<AppointmentDetailWeb> {
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
  @override
  Widget build(BuildContext context) {
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          widget.doctorPhoto,
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.paitientName,
                              style: GoogleFonts.poppins(
                                  color: appColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget
                                      .appointmentDate, // Display the formatted date
                                  style: GoogleFonts.poppins(
                                    color: textColor,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.appointmentTime,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text("")
                    ],
                  ),
                ),
              ),
            ),
            //Appointment Schedule
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 360,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Appointment Schedule",
                          style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8),
                        child: Row(
                          children: [
                            Text(
                              "Date:     ", // Display the formatted date
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              widget.appointmentDate,
                              style: GoogleFonts.poppins(
                                color: dateColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8),
                        child: Row(
                          children: [
                            Text(
                              "Time:     ", // Display the formatted date
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              widget.appointmentTime,
                              style: GoogleFonts.poppins(
                                color: dateColor,
                                fontSize: 14,
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 360,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Patient Details",
                          style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8),
                        child: Row(
                          children: [
                            Text(
                              "Name:     ", // Display the formatted date
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              widget.paitientName,
                              style: GoogleFonts.poppins(
                                color: dateColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8),
                        child: Row(
                          children: [
                            Text(
                              "Gender:     ", // Display the formatted date
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              widget.patientGender,
                              style: GoogleFonts.poppins(
                                color: dateColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8),
                        child: Row(
                          children: [
                            Text(
                              "Patient Problem:     ", // Display the formatted date
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              widget.patientProblem,
                              style: GoogleFonts.poppins(
                                color: dateColor,
                                fontSize: 14,
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
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/gen.png"),
            )
          ],
        ),
      ),
    );
  }
}
