import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare/uitls/colors.dart';
import 'package:medicare/widgets/service_widget.dart';

class NeroDep extends StatefulWidget {
  const NeroDep({super.key});

  @override
  State<NeroDep> createState() => _NeroDepState();
}

class _NeroDepState extends State<NeroDep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
        title: Text(
          "Neurology Department",
          style: GoogleFonts.workSans(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: mainColor,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("doctorServices")
              .where("department", isEqualTo: "Neurology")
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
                  "No Service Available",
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
                  return ServiceWidget(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) => MyServiceDetail(
                      //               description: data['description'],
                      //               providerName: data['providerName'],
                      //               serviceCategory: data['serviceCategory'],
                      //               serviceDiscount:
                      //                   data['serviceDiscount'].toString(),
                      //               serviceImage: data['serviceImage'],
                      //               serviceLocation: data['serviceLocation'],
                      //               serviceName: data['serviceName'],
                      //               servicePrice: data['servicePrice'],
                      //               uid: data['uid'],
                      //               uuid: data['uuid'],
                      //             )));
                    },
                    department: data['department'],
                    doctorName: data['doctorName'],
                    doctorPhoto: data['doctorPhoto'],
                    titleText: data['serviceName'],
                    descTitle: data['description'],
                    priceTitle: "\$" + data['servicePrice'].toString(),
                  );
                });
          }),
    );
  }
}
