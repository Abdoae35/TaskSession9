import 'package:counter_app/bmi/page/result_screen.dart';
import 'package:counter_app/bmi/widgets/counter_card.dart';
import 'package:counter_app/bmi/widgets/gender_card.dart';
import 'package:counter_app/colors.dart';
import 'package:flutter/material.dart';

class bmiCalculatorScreen extends StatefulWidget {
  const bmiCalculatorScreen({super.key});

  @override
  State<bmiCalculatorScreen> createState() => _bmiCalculatorScreenState();
}

class _bmiCalculatorScreenState extends State<bmiCalculatorScreen> {
  int weight = 60;
  int age = 25;
  int height = 180;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.backgroundColor,
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //male famale card
            _genderSection(),

            const SizedBox(height: 16),

            //height slider
            _heightSelection(),
            SizedBox(height: 16),

            //weight & age
            _weightAndAge(),

            SizedBox(height: 16),
            //calculator
            ElevatedButton(
              onPressed: () {
                // Calculate BMI and navigate to ResultScreen
                // BMI = 	weight (kg) /height2 (m)
                double result = (weight / ((height / 100) * (height / 100)));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Calculate', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _genderSection() {
    return Expanded(
      child: Row(
        children: [
          GenderCard(
            gender: "Male",
            genderIcon: Icons.male,
            isSelected: isMale,
            onPressed: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          SizedBox(width: 16),
          GenderCard(
            gender: "Female",
            genderIcon: Icons.female,
            isSelected: !isMale,
            onPressed: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded _weightAndAge() {
    return Expanded(
      child: Row(
        children: [
          CounterCard(
            text: "Weight",
            value: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              setState(() {
                if (weight > 0) {
                  weight--;
                }
              });
            },
          ),

          SizedBox(width: 8),
          CounterCard(
            text: "Age",
            value: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              setState(() {
                if (age > 0) {
                  age--;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded _heightSelection() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Height", style: TextStyle(color: Colors.white, fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '$height',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 4),
                Text('cm', style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 80,
              max: 220,
              activeColor: AppColor.primaryColor,
              inactiveColor: Colors.grey,
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
