import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  const TextInputLocation(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.iconData})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15.0,
          offset: Offset(0.0, 7.0),
        )
      ]),
      child: TextField(
        controller: controller,
        style: const TextStyle(
            fontSize: 15.0,
            fontFamily: "Lato",
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData, color:  Colors.black45),
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
