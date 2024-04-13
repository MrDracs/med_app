import 'dart:ffi';

import 'package:flutter/material.dart';

class HeartAttackPredictor extends StatefulWidget {
  const HeartAttackPredictor({super.key});

  @override
  State<HeartAttackPredictor> createState() => _HeartAttackPredictorState();
}

class _HeartAttackPredictorState extends State<HeartAttackPredictor> {
  final age = TextEditingController();
  final sex = TextEditingController(); // male or female
  final cp = TextEditingController();
  final trestbps = TextEditingController();
  final chol = TextEditingController();
  final fbs = TextEditingController();
  final restecg = TextEditingController();
  final thalach = TextEditingController();
  final exang = TextEditingController();
  final oldpeak = TextEditingController();
  final slope = TextEditingController();
  final ca = TextEditingController();
  final thal = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          "Prediction Data",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Form(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Age'),
            controller: age,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration:
                const InputDecoration(labelText: '1 for Male, 0 for Female'),
            controller: sex,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText:
                    'chest pain, 1: typical angina, 2: atypical angina, 3: non-anginal pain, 4: asymptomatic'),
            controller: cp,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'resting blood pressure'),
            controller: trestbps,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'serum cholestoral in mg/dl'),
            controller: chol,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'fasting blood sugar > 120 mg/dl'),
            controller: fbs,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText:
                    'resting electrocardiographic results (values 0,1,2)'),
            controller: restecg,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'maximum heart rate achieved'),
            controller: thalach,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'exercise induced angina'),
            controller: exang,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText:
                    'oldpeak = ST depression induced by exercise relative to rest'),
            controller: oldpeak,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'The slope of the peak exercise ST segment'),
            controller: slope,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText:
                    'Naumber of major vessels (0-3) colored by flourosopy'),
            controller: ca,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText:
                    'thal: 3 = normal; 6 = fixed defect; 7 = reversable defect'),
            controller: thal,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      )),
    );
  }
}
