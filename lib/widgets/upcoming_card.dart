import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:med_app/pages/table.dart';

class UpcomingCard extends StatefulWidget {
  const UpcomingCard({super.key});

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  void clikie() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const TimeTable()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: double.maxFinite,
      height: 200,
      padding:
          const EdgeInsets.symmetric(vertical: 22).copyWith(left: 5, right: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/pill2.png',
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Medication Alert",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Next Medicine Time",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TimeTable()),
                  );
                },
                icon: const Icon(
                  Ionicons.heart_circle,
                ),
                label: const Text(
                  "12:00PM Today",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  side: const BorderSide(color: Colors.white, width: 4),
                  fixedSize: Size(w / 2, 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
