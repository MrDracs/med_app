// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_app/pages/main_nav_page.dart';
import 'package:med_app/widgets/graph.dart';
import 'package:med_app/widgets/my_button.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import '../theme/color_constants.dart';
import '../widgets/activity_card.dart';
import '../widgets/app_routes.dart';
import '../widgets/health_corner_card.dart';
import '../widgets/preferred_doctors.dart';
import '../widgets/upcoming_card.dart';
import 'home.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
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
          Text(
            "Contact Your Doctor",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          const PreferredDoctors(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
