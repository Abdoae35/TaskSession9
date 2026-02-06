// < 18.5	Underweight
// 18.5 - 24.9	Healthy Weight
// 25.0 - 29.9	Overweight
// ≥ 30.0	Obese

import 'package:counter_app/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;

  String getClassification() {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result <= 24.9) {
      return 'Healthy Weight';
    } else if (result <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color getColor() {
    if (result < 18.5) {
      return Colors.amberAccent;
    } else if (result <= 24.9) {
      return Colors.green;
    } else if (result <= 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Result Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Your Result",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 40),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.cardColor,
                ),

                width: double.infinity,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Text(
                        getClassification(),
                        style: TextStyle(
                          color: getColor(),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(color: Colors.white, fontSize: 80),
                    ),
                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Text(
                        'your body is absolutely ${getClassification()},\n Good job!',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    minimumSize: Size(double.infinity, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(3),
                    ),
                  ),
                  child: Text(
                    "Recalculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
