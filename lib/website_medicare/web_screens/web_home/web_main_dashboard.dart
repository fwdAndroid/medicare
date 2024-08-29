import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare/screens/departments/cardiolgoy_dep.dart';
import 'package:medicare/screens/departments/gynalogy_dep.dart';
import 'package:medicare/screens/departments/nero_dep.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/website_medicare/web_detail/web_doctor_detail.dart';
import 'package:medicare/website_medicare/web_widgets/header_widget.dart';

class MainDashboardWeb extends StatefulWidget {
  const MainDashboardWeb({super.key});

  @override
  State<MainDashboardWeb> createState() => _MainDashboardWebState();
}

class _MainDashboardWebState extends State<MainDashboardWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0, top: 8, left: 8, right: 8),
            child: Text(
              'Departments',
              style: GoogleFonts.poppins(
                  color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => NeroDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/neroweb.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Neurology",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => CardiolgoyDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/heart_web.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Cardiology",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => GynalogyDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/ss.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Gynecology",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => GynalogyDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/p_web.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Pediatrics",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => GynalogyDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/al_web.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Allergy",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => GynalogyDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/dentist_web.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Dentist",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => GynalogyDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/uro_web.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Urology",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => GynalogyDep()));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/uro_web.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          "Gestrology",
                          style: GoogleFonts.inter(color: black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0, top: 8, left: 8, right: 8),
            child: Text(
              'Top Doctors',
              style: GoogleFonts.poppins(
                  color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 236,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("doctors")
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
                                      builder: (builder) => WebDoctorDetail(
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 140,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(data['photoURL']),
                                            radius: 60,
                                          ),
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
          ),
        ],
      ),
    );
  }
}
