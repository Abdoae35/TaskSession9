import 'package:counter_app/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.gender,
    required this.genderIcon,
    required this.isSelected,
    required this.onPressed,
  });

  final String gender;
  final IconData genderIcon;
  final bool isSelected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: (isSelected) ? AppColor.primaryColor : AppColor.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(genderIcon, color: Colors.white, size: 80),
              SizedBox(height: 8),
              Text(gender, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
