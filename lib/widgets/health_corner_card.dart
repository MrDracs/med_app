import 'package:flutter/material.dart';

import '../theme/color_constants.dart';

class HealthCornerCard extends StatelessWidget {
  final String imagePath, description;
  final VoidCallback onTap;
  const HealthCornerCard({
    super.key,
    required this.imagePath,
    required this.description,
    required this.onTap,
  });
  final double cardWidth = 250;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.shadowColor,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        width: cardWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: cardWidth,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 3, color: ColorConstant.whiteBackground),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitHeight,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset("assets/bot.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "One Piece Docs",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Sep 9, 2022",
                          style: TextStyle(
                            color: ColorConstant.gray,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/health_care.png",
                    scale: cardWidth / 10,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
