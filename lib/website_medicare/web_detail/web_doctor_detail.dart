import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare/screens/appointments/appointment_begin.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/website_medicare/image_select.dart';
import 'package:medicare/website_medicare/web_appointments/appointment_begin_web.dart';
import 'package:medicare/widgets/save_button.dart';

class WebDoctorDetail extends StatefulWidget {
  final fullName;
  final experience;
  final about;
  final photoURL;
  final rate;
  final review;
  final hospitalName;
  final numberreviews;
  final consultantFees;
  final doctorId;
  final price;
  final department;
  WebDoctorDetail({
    super.key,
    required this.fullName,
    required this.experience,
    required this.rate,
    required this.review,
    required this.hospitalName,
    required this.about,
    required this.numberreviews,
    required this.department,
    required this.doctorId,
    required this.price,
    required this.consultantFees,
    required this.photoURL,
  });

  @override
  State<WebDoctorDetail> createState() => _WebDoctorDetailState();
}

class _WebDoctorDetailState extends State<WebDoctorDetail> {
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

class FormSection extends StatelessWidget {
  final fullName;
  final experience;
  final about;
  final photoURL;
  final rate;
  final review;
  final hospitalName;
  final numberreviews;
  final consultantFees;
  final doctorId;
  final price;
  final department;
  const FormSection({
    super.key,
    required this.fullName,
    required this.experience,
    required this.rate,
    required this.review,
    required this.hospitalName,
    required this.about,
    required this.numberreviews,
    required this.department,
    required this.doctorId,
    required this.price,
    required this.consultantFees,
    required this.photoURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 448,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(photoURL),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 17),
                    child: Text(
                      fullName,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: appColor),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: Text(
                      hospitalName,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circle,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  size: 20,
                                  Icons.badge,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            experience.toString() + " " + "Years",
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: appColor),
                          ),
                          Text(
                            "Experience",
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circle,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  size: 20,
                                  Icons.star,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            rate.toString(),
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: appColor),
                          ),
                          Text(
                            "Rating",
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circle,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  size: 20,
                                  Icons.reviews,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            numberreviews.toString(),
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: appColor),
                          ),
                          Text(
                            "Reviews",
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "About Doctor",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: appColor),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
                    child: Text(
                      about,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: dateColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Consultation fee",
                                style: GoogleFonts.poppins(
                                  color: dateColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$",
                                    style: GoogleFonts.poppins(
                                        color: appColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    consultantFees.toString(),
                                    style: GoogleFonts.poppins(
                                        color: appColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "/Consultation fee",
                                    style: GoogleFonts.poppins(
                                      color: dateColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Follow-up fee",
                                style: GoogleFonts.poppins(
                                  color: dateColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$",
                                    style: GoogleFonts.poppins(
                                        color: appColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    price.toString(),
                                    style: GoogleFonts.poppins(
                                        color: appColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "(within 15 Days)",
                                    style: GoogleFonts.poppins(
                                      color: dateColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SaveButton(
                      title: "Make Appointment",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => AppointmentBeginWeb(
                                      photoURL: photoURL,
                                      fullName: fullName,
                                      rate: rate,
                                      hospitalName: hospitalName,
                                      experience: experience,
                                      review: review,
                                      about: about,
                                      department: department,
                                      doctorId: doctorId,
                                      price: price.toString(),
                                      consultantFees: consultantFees.toString(),
                                      numberreviews: numberreviews.toString(),
                                    )));
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
