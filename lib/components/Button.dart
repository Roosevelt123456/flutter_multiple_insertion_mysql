

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(onPressed: onTap,
          child: Center(child: Text("Isert",
            style: TextStyle(color: Colors.white24,
                fontSize:16,fontWeight: FontWeight.bold ) ,),)),
    );
  }
}
