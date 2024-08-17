import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare/screens/departments/allergy_dep.dart';
import 'package:medicare/screens/departments/cardiolgoy_dep.dart';
import 'package:medicare/screens/departments/dent_dep.dart';
import 'package:medicare/screens/departments/gest_dep.dart';
import 'package:medicare/screens/departments/gynalogy_dep.dart';
import 'package:medicare/screens/departments/nero_dep.dart';
import 'package:medicare/screens/departments/pedro_dep.dart';
import 'package:medicare/screens/departments/uro_dep.dart';
import 'package:medicare/screens/details/doctor_detail.dart';
import 'package:medicare/uitls/colors.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Departments",
          style: GoogleFonts.poppins(fontSize: 18, color: appColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Departments",
                style: GoogleFonts.poppins(
                    color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 8, left: 8, right: 8),
                  child: Text(
                    'Departments',
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 8, left: 8, right: 8),
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => NeroDep()));
                  },
                  child: Image.asset(
                    "assets/nero.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => CardiolgoyDep()));
                  },
                  child: Image.asset(
                    "assets/card.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => GynalogyDep()));
                  },
                  child: Image.asset(
                    "assets/gyn.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => PedroDep()));
                  },
                  child: Image.asset(
                    "assets/ped.png",
                    height: 95,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => AllergyDep()));
                  },
                  child: Image.asset(
                    "assets/aller.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => DentistDep()));
                  },
                  child: Image.asset(
                    "assets/dent.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => UroDep()));
                  },
                  child: Image.asset(
                    "assets/uro.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => GestDep()));
                  },
                  child: Image.asset(
                    "assets/gestrology.png",
                    height: 95,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Common Symptoms",
                style: GoogleFonts.poppins(
                    color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Image.asset("assets/cs.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated Doctors",
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(color: mainColor),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 236,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("doctors")
                      .where("uid",
                          isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                          "No Doctor Available",
                          style: TextStyle(color: black),
                        ),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          final Map<String, dynamic> data =
                              documents[index].data() as Map<String, dynamic>;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => DoctorDetail(
                                            photoURL: data['photoURL'],
                                            fullName: data['fullName'],
                                            rate: data['rate'],
                                            hospitalName: data['hospitalName'],
                                            experience: data['experience'],
                                            review: data['review'],
                                            about: data['about'],
                                            price: data['price'].toString(),
                                            consultantFees:
                                                data['consultantFees']
                                                    .toString(),
                                            numberreviews: data['numberreviews']
                                                .toString(),
                                            department: data['department'],
                                            doctorId: data['uid'],
                                          )));
                            },
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          data['photoURL'],
                                          width: 100,
                                          height: 100,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.circle,
                                                color: mainColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, top: 8, right: 4),
                                    child: Text(
                                      data['fullName'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: appColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4),
                                    child: Text(
                                      data['department'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: textColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4, bottom: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "5.0",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: textColor),
                                            ),
                                            Text(
                                              "(150)",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: textColor),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 61,
                                        ),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(Icons.favorite_outline))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
