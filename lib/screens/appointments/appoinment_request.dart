import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicare/screens/appointments/appointment_request_done.dart';
import 'package:medicare/services/storage_methods.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/uitls/message_utils.dart';
import 'package:medicare/widgets/save_button.dart';
import 'package:medicare/widgets/text_form_field.dart';
import 'package:uuid/uuid.dart';

class AppoinmentRequest extends StatefulWidget {
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
  final gender;
  AppoinmentRequest({
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
    required this.price,
    required this.problem,
    required this.rate,
    required this.review,
  });

  @override
  State<AppoinmentRequest> createState() => _AppoinmentRequestState();
}

class _AppoinmentRequestState extends State<AppoinmentRequest> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Confirm Appointment",
          style: GoogleFonts.poppins(fontSize: 17, color: appColor),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    size: 20,
                    Icons.arrow_back_ios_new,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                TextFormInputField(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      lastDate: DateTime(3000),
                      firstDate: DateTime(2015),
                      initialDate: DateTime.now(),
                    );
                    if (pickedDate == null) return;
                    _dateController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                  },
                  preFixICon: Icons.date_range,
                  controller: _dateController,
                  hintText: "Appointment Date",
                  textInputType: TextInputType.name,
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
                TextFormInputField(
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child!,
                        );
                      },
                    );

                    if (pickedTime != null) {
                      final now = DateTime.now();
                      final selectedTime = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );

                      setState(() {
                        _timeController.text =
                            DateFormat('hh:mm a').format(selectedTime);
                      });
                    }
                  },
                  preFixICon: Icons.time_to_leave,
                  controller: _timeController,
                  hintText: "Appointment Time",
                  textInputType: TextInputType.name,
                ),
              ],
            ),
          ),
          const Spacer(),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SaveButton(
                    title: "Confirm Appointment",
                    onTap: () async {
                      var uuid = Uuid().v4();
                      if (_dateController.text.isEmpty ||
                          _timeController.text.isEmpty) {
                        showMessageBar(
                            "Appointment Time and Date is Required ", context);
                      } else {
                        setState(() {
                          isLoading = true;
                        });
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
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => AppointmentRequestDone(
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
                                      patientId: FirebaseAuth
                                          .instance.currentUser!.uid,
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
    );
  }
}
