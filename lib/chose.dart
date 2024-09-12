import 'package:flutter/material.dart';
import 'package:medicare/screens/main/main_dashboard.dart';
import 'package:medicare/screens/main/pages/home_page.dart';
import 'package:medicare/uitls/colors.dart';

class ChoseFunction extends StatefulWidget {
  const ChoseFunction({super.key});

  @override
  State<ChoseFunction> createState() => _ChoseFunctionState();
}

class _ChoseFunctionState extends State<ChoseFunction> {
  void _navigateToServices(String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainDashboard(type: type),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/newlogo.png",
              height: 200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _navigateToServices('home'),
                child: Card(
                  color: Color(0xffFF2896),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.home,
                            size: 50,
                            color: white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Home \n Services",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _navigateToServices('clinic'),
                child: Card(
                  color: mainColor,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            color: white,
                            Icons.medical_services_outlined,
                            size: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Clinic \n Services",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
