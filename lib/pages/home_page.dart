import 'package:flutter/material.dart';

import '../widgets/recommended_psychologists.dart';
import '../widgets/upcoming_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const UpcomingCard(),
          const SizedBox(height: 20),
          Text(
            "Contact Your Doctor",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          const ExpertCounsellors(),
        ],
      ),
    );
  }
}
