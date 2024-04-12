import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../data/psychologist_model.dart';

class ExpertCounsellors extends StatelessWidget {
  const ExpertCounsellors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(expertCounsellors.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 30),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(expertCounsellors[index].profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dr. ${expertCounsellors[index].name}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(expertCounsellors[index].position),
                  const SizedBox(height: 16),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
