import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key, 
    required this.category, 
    required this.isSelected, 
    required this.onPressed
});

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.green : Colors.transparent
          ),
          child: Text(category, style: TextStyle(
            color: isSelected ? Colors.white : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: isSelected ? 16 : 14
          ),),
        ),
      ),
    );
  }
}