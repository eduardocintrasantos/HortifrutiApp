import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {

  final int value;
  final String suffixText;
  final Function(int quantity) result;

  const QuantityWidget({
    super.key, 
    required this.value, 
    required this.suffixText, 
    required this.result
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade300,
            spreadRadius: 1,
            blurRadius: 2
          )
        ]
      ),
      child: Row(
        children: [

          _Quantity_button(
            icon: Icons.remove,
            color: Colors.grey,
            onPressed: () {
              if(value == 1) return;

              int resultCount = value - 1;

              result(resultCount);
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text('${value} ${suffixText}' , style: 
              TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          _Quantity_button(
            icon: Icons.add,
            color: Colors.green,
            onPressed: () { 
              int resultCount = value + 1;

              result(resultCount);
            },
          )
        ],
      ),
    );
  }
}

class _Quantity_button extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  
  const _Quantity_button({
    super.key, 
    required this.color, 
    required this.icon, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
          child: Icon(icon, color: Colors.white, size: 16,),
        ),
      ),
    );
  }
}