import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../pages/chat_screen.dart';

class UpcomingCard extends StatefulWidget {
  const UpcomingCard({super.key});

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  void clikie() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: double.maxFinite,
      height: 150,
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
              'assets/bot.png',
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Psych.AI",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(height: 5),
              Text(
                "Your mental health assistant",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 4),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  );
                },
                icon: const Icon(
                  Ionicons.chatbubble_ellipses_outline,
                ),
                label: const Text("Talk to me"),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  side: const BorderSide(color: Colors.white, width: 2),
                  fixedSize: Size(w / 2, 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
