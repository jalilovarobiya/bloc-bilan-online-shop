import 'package:flutter/material.dart';

class CatergoryWidget extends StatelessWidget {
  final String name;
  final Icon icon;
  final Color color;
  const CatergoryWidget({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
          child: icon,
        ),
        Text(name),
      ],
    );
  }
}
