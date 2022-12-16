import 'package:auto_size_text/auto_size_text.dart';
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
    var size = MediaQuery.of(context).size;
    return ClipRRect(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AutoSizeText("G",
                      textAlign: TextAlign.center,
                      presetFontSizes: [80, 40],
                      style: TextStyle(
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                      )),
                  const SizedBox(width: 20),
                  AutoSizeText(
                    text,
                    maxLines: 1,
                    maxFontSize: 40,
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontFamily: "Lato",
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
