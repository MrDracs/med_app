import 'dart:ffi';

import 'package:flutter/material.dart';

class HeartAttackPredictor extends StatefulWidget {
  const HeartAttackPredictor({super.key});

  @override
  State<HeartAttackPredictor> createState() => _HeartAttackPredictorState();
}

class _HeartAttackPredictorState extends State<HeartAttackPredictor> {
  int age = 0;
  int sex = 0; // male or female
  int cp = 0;
  int trestbps = 0;
  int chol = 0;
  int fbs = 0;
  int restecg = 0;
  int thalach = 0;
  int exang = 0;
  int oldpeak = 0;
  int slope = 0;
  int ca = 0;
  int thal = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: const Column(
        children: <Widget>[],
      ),
    );
  }
}
