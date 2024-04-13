import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:med_app/theme/app_styles.dart';

import 'package:twilio_flutter/twilio_flutter.dart';

import '../theme/app_decoration.dart';
import '../theme/color_constants.dart';

class StrokeEmergencyScreen extends StatefulWidget {
  const StrokeEmergencyScreen({super.key});

  @override
  State<StrokeEmergencyScreen> createState() => _StrokeEmergencyScreenState();
}

class _StrokeEmergencyScreenState extends State<StrokeEmergencyScreen> {
  List listOfWhatToDo = [
    {
      "title": "Stay Calm, and wait for Ambulance. ",
      "description":
          "Do not panic. If you have called an ambulance, wait for help to arrive. Do not attempt to drive.",
    },
    {
      "title": "Do not lose conciousness",
      "description":
          "Try to stay awake. If you believe you are losing consciousness, take an aspirin. Try keeping your eyes open.",
    },
    {
      "title": "Importance of CPR ",
      "description":
          "If you are not alone and there is someone to assist you, ask them to perform CPR if your vitals are dropping.",
    },
    {
      "title": "Check for Symprtoms: ",
      "description":
          "Face: If your face is drooping.\n Arm: If your arms feel weak.\nSpeech: Speech difficulties. Then it is Time to call an Ambulance",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          "stroke",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: ColorConstant.bluedark,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(
            left: 22,
            right: 22,
            bottom: 40,
          ),
          child: Column(
            children: [
              _dailyActivityNotification(
                false,
                "An alert has been sent to your emergency contact.",
              ),
              CallAnAmbulance(onTap: () {}),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                  bottom: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "what To Do",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      "4 Steps",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              WhatToDoWidget(
                title: listOfWhatToDo[0]["title"],
                index: "01",
                description: listOfWhatToDo[0]["description"],
              ),
              WhatToDoWidget(
                title: listOfWhatToDo[1]["title"],
                index: "02",
                description: listOfWhatToDo[1]["description"],
              ),
              WhatToDoWidget(
                title: listOfWhatToDo[2]["title"],
                index: "03",
                description: listOfWhatToDo[2]["description"],
              ),
              WhatToDoWidget(
                title: listOfWhatToDo[3]["title"],
                index: "04",
                description: listOfWhatToDo[3]["description"],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dailyActivityNotification(bool isAlertNotification, String message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 22),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Icon(
            Icons.info_rounded,
            color: isAlertNotification
                ? ColorConstant.lightRed
                : ColorConstant.warningColor,
            size: 26,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallAnAmbulance extends StatelessWidget {
  final VoidCallback onTap;
  const CallAnAmbulance({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/health_care.png",
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 22,
            ),
            Text(
              "Call Ambulance",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhatToDoWidget extends StatelessWidget {
  final String title, description, index;
  const WhatToDoWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.index});

  Widget _dotline() {
    return Container(
      margin: const EdgeInsets.only(left: 14, top: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 157, 157, 157),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        index,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.adjust_sharp,
                        color: Color.fromARGB(255, 157, 157, 157),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                  _dotline(),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
