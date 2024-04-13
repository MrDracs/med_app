import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:med_app/pages/analytics_page.dart';
import 'package:med_app/pages/home.dart';
import 'package:med_app/pages/stroke_emergency_screen.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../theme/color_constants.dart';
import '../widgets/app_routes.dart';
import '../widgets/my_app_bar.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const AnalyticsPage(),
    ProfilePage(),
    const StrokeEmergencyScreen(),
  ];
  String userName = "Rohit";

  TwilioFlutter twilioFlutter = TwilioFlutter(
    accountSid: "SK6daff88f2d918f085d08886c853730dc",
    authToken: "5FYN1cHS2VHKTIxAvmQGx1MEOionlS29",
    twilioNumber: "+917982224789",
  );

  void signUserOut() {}

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userName = "Rohit";
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton.extended(
          label: const Text("EMERGENCY!"),
          backgroundColor: const Color.fromARGB(255, 200, 16, 16),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add_alert),
          onPressed: showCustomDialog,
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, $userName"),
              Text(
                "How are you feeling today?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: [
            const toggle(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.notifications_outline),
            ),
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Ionicons.log_out_outline),
            ),
          ],
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 32,
          backgroundColor: Theme.of(context).colorScheme.background,
          onTap: onTap,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedItemColor: Theme.of(context).highlightColor,
          unselectedItemColor: Theme.of(context).colorScheme.onBackground,
          items: const [
            // home
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              activeIcon: Icon(Ionicons.home),
              label: "Home",
            ),
            // chatbot
            // BottomNavigationBarItem(
            //   backgroundColor: Color.fromARGB(255, 255, 0, 0),
            //   icon: Icon(Ionicons.heart_circle_outline),
            //   activeIcon: Icon(Ionicons.heart_circle),
            //   label: "Emergency",
            // ),
            // Self-Help Features
            BottomNavigationBarItem(
              icon: Icon(Ionicons.pie_chart_outline),
              activeIcon: Icon(Ionicons.pie_chart),
              label: "Analytics",
            ),
            // profile & about
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              activeIcon: Icon(Ionicons.person),
              label: "Profile",
            ),
          ],
        ));
  }

  void sendSoS() async {
    String emergencyContactNumber1 = "+917982224789";

    twilioFlutter.sendSMS(
        toNumber: emergencyContactNumber1,
        messageBody:
            'SOS! Emergency alert from team healthify.\n$userName might be suffering from a heart Stroke.');
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        color: Colors.transparent,
                      ),
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        bottom: -10,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: ColorConstant.whiteBackground,
                        ),
                      ),
                      Center(
                        child: Container(
                            padding: const EdgeInsets.only(
                              left: 22,
                              right: 22,
                              bottom: 22,
                              top: 30,
                            ),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: ColorConstant.lightRed,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.monitor_heart_rounded,
                              size: 48,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteBackground,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 35,
                          ),
                          child: Text(
                            "Experiencing a Heart Stroke?",
                            style: TextStyle(
                              color: ColorConstant.bluedark,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SosButton(
                                title: "Yes",
                                onTap: () {
                                  sendSoS();
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.pop(context); // close all pop-up
                                    Future.delayed(const Duration(seconds: 5));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StrokeEmergencyScreen()),
                                    );
                                  }
                                },
                              ),
                              SosButton(
                                title: "NO",
                                enableOutlineButton: true,
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                  ;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
