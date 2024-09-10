import 'package:flutter/material.dart';
import 'package:medicare/screens/tab/clinic_tab.dart';
import 'package:medicare/screens/tab/home_care_tab.dart';
import 'package:medicare/uitls/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Home Page',
            style: TextStyle(color: white),
          ),
          bottom: TabBar(
            unselectedLabelColor: black,
            labelColor: white,
            tabs: [
              Tab(icon: Icon(Icons.home_max), text: "Home Services"),
              Tab(
                  icon: Icon(Icons.cloud_circle_rounded),
                  text: "Clincic Services")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeCareTab(),
            ClinicTab(),
          ],
        ),
      ),
    );
  }
}
