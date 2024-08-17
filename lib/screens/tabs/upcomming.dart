import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare/screens/details/appointment_detail.dart';
import 'package:medicare/uitls/colors.dart';

class Upcomming extends StatefulWidget {
  const Upcomming({super.key});

  @override
  State<Upcomming> createState() => _UpcommingState();
}

class _UpcommingState extends State<Upcomming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("appointments")
              .where("patientId",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where("appointmentStatus", isEqualTo: "send")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  "No Appointment Available",
                  style: TextStyle(color: black),
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  final Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => AppointmentDetail(
                                    appointmentDate: data['appointmentDate'],
                                    appointmentId: data['appointmentId'],
                                    appointmentStatus:
                                        data['appointmentStatus'],
                                    appointmentTime: data['appointmentTime'],
                                    doctorDepartment: data['doctorDepartment'],
                                    doctorExperience: data['doctorExperience'],
                                    doctorFees: data['doctorFees'],
                                    doctorName: data['doctorName'],
                                    doctorPhoto: data['doctorPhoto'],
                                    doctorid: data['doctorid'],
                                    paitientName: data['paitientName'],
                                    patientDob: data['patientDob'],
                                    patientDocument: data['patientDocument'],
                                    patientGender: data['patientGender'],
                                    patientId: data['patientId'],
                                    patientProblem: data['patientProblem'],
                                    rate: data['rate'],
                                    review: data['review'],
                                  )));
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      data['doctorPhoto'],
                                      height: 90,
                                      width: 90,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              data['doctorName'],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: appColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              width: 80,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: contColor),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "Upcoming",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: mainColor),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "+82312412414424",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: appColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              data['appointmentDate'],
                                              style: GoogleFonts.poppins(
                                                  color: dateColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "|",
                                              style: GoogleFonts.poppins(
                                                  color: dateColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              data['appointmentTime'],
                                              style: GoogleFonts.poppins(
                                                  color: dateColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: dividerColor,
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
