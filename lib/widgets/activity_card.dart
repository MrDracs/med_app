import 'package:flutter/material.dart';

import '../theme/app_decoration.dart';
import '../theme/app_styles.dart';
import '../theme/color_constants.dart';

class DailyActivityRating extends StatefulWidget {
  final String timeLine;
  final int heartRating, exerciseRating, walkingRating, sleepRating;
  final VoidCallback onTapRefresh;

  const DailyActivityRating(
      {super.key,
      required this.timeLine,
      required this.onTapRefresh,
      required this.heartRating,
      required this.exerciseRating,
      required this.walkingRating,
      required this.sleepRating});

  @override
  State<DailyActivityRating> createState() => _DailyActivityRatingState();
}

class _DailyActivityRatingState extends State<DailyActivityRating> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.timeLine,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
            ),
            IconButton(
              onPressed: widget.onTapRefresh,
              icon: Icon(
                Icons.refresh_rounded,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(120),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingShowCaseCard(
              cardColor: ColorConstant.lightRed,
              icon: Icon(
                Icons.monitor_heart_outlined,
                color: ColorConstant.lightRed,
              ),
              title: "heartRate",
              measure: "bpm",
              rating: widget.heartRating,
            ),
            RatingShowCaseCard(
              cardColor: ColorConstant.pupuleColor,
              icon: Icon(
                Icons.speed_outlined,
                color: ColorConstant.pupuleColor,
              ),
              title: "exercise",
              measure: "min",
              rating: widget.exerciseRating,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingShowCaseCard(
              cardColor: ColorConstant.greenColor,
              icon: Icon(
                Icons.flag_outlined,
                color: ColorConstant.greenColor,
              ),
              title: "walking",
              measure: "steps",
              rating: widget.walkingRating,
            ),
            RatingShowCaseCard(
              cardColor: ColorConstant.blueColor,
              icon: Icon(
                Icons.night_shelter_sharp,
                color: ColorConstant.blueColor,
              ),
              title: "sleep",
              measure: "mins",
              rating: widget.sleepRating,
            )
          ],
        )
      ],
    );
  }
}

class RatingShowCaseCard extends StatelessWidget {
  final Color cardColor;
  final Widget icon;
  final String title, measure;
  final int rating;
  const RatingShowCaseCard(
      {super.key,
      required this.cardColor,
      required this.icon,
      required this.title,
      required this.measure,
      required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: cardColor.withOpacity(0.2),
          borderRadius: BorderRadiusStyle.roundedBorder15,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              offset: const Offset(0, 1),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Wrap(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: cardColor,
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  rating.toString(),
                  style: TextStyle(
                    color: cardColor,
                    fontFamily: "Poppins",
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 4),
                child: Text(
                  measure,
                  style: TextStyle(
                    color: cardColor,
                    fontSize: 18,
                    fontFamily: "Poppins",
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
