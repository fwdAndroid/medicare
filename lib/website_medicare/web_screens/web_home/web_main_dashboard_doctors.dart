import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/website_medicare/web_detail/web_doctor_detail.dart';
import 'package:medicare/website_medicare/web_widgets/header_widget.dart';

class WebMainDashboardDoctors extends StatefulWidget {
  const WebMainDashboardDoctors({super.key});

  @override
  State<WebMainDashboardDoctors> createState() =>
      _WebMainDashboardDoctorsState();
}

class _WebMainDashboardDoctorsState extends State<WebMainDashboardDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
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
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _getCrossAxisCount(
                              context), // Adjust the number of columns based on screen size
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio:
                              1.0, // Adjust child aspect ratio as needed
                        ),
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

  // Adjust the crossAxisCount based on the screen width
  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 6; // 6 columns for large screens
    } else if (screenWidth > 800) {
      return 4; // 4 columns for medium screens
    } else {
      return 2; // 2 columns for small screens
    }
  }
}
