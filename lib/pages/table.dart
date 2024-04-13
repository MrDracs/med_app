import 'package:flutter/material.dart';
import 'package:med_app/widgets/my_button.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          "Medication Time",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(onTap: () {}, text: "ABC at 6:00AM"),
          MyButton(onTap: () {}, text: "ABCD at 12:00PM"),
          MyButton(onTap: () {}, text: "ABC at 8:00PM"),
          MyButton(onTap: () {}, text: "Milk at 9:00PM"),
        ],
      ),
    );
  }
}
