import 'package:flutter/material.dart';

class ButtonGreen extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  VoidCallback onPressed;

  ButtonGreen(
      {Key? key,
      required this.width,
      required this.height,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Material(
          child: InkWell(
            //GestureDetector(
            splashColor: Colors.deepPurpleAccent,
            onTap: onPressed,
            child: Ink(
              width: width,
              height: height,
              //margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: const LinearGradient(colors: [
                  Color(0xFFa7ff84), //arriba
                  Color(0xFF1cbb78), //abajo
                ]),
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
