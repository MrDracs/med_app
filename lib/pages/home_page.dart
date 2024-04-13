// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:med_app/pages/main_nav_page.dart';
import 'package:med_app/widgets/my_button.dart';
import '../widgets/activity_card.dart';
import '../widgets/health_corner_card.dart';
import '../widgets/preferred_doctors.dart';
import '../widgets/upcoming_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAlertNotification = false;

  int heartRating = 82;

  int exerciseRating = 14;

  int walkingRating = 741;

  int sleepRating = 45;

  bool isRefreshed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const UpcomingCard(),
          const SizedBox(height: 25),
          DailyActivityRating(
            timeLine: isRefreshed ? "Just now" : "5 mins ago",
            onTapRefresh: () {
              setState(() {
                heartRating += 3;
                walkingRating += 40;
                isRefreshed = true;
              });
            },
            heartRating: heartRating,
            exerciseRating: exerciseRating,
            walkingRating: walkingRating,
            sleepRating: sleepRating,
          ),
          // Text(
          //   "Contact Your Doctor",
          //   style: Theme.of(context).textTheme.titleLarge,
          // ),
          // const SizedBox(height: 15),
          // const PreferredDoctors(),

          // const SizedBox(
          //   height: 60,
          // ),
          // MyButton(onTap: () {}, text: "EMERGENCY CRISIS"),
          const SizedBox(height: 20),
          Text(
            "Health Corner",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HealthCornerCard(
                    onTap: () {},
                    imagePath: "assets/doc_4.jpeg",
                    description: "10 Tips for a Healthy heart",
                  ),
                  HealthCornerCard(
                    onTap: () {},
                    imagePath: "assets/doctor_1.jpg",
                    description: "10 Tips for a Healthy heart",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
