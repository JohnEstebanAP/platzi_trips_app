import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  FloatingActionButtonGreen(
      {Key? key,
      this.isSelecte = false,
      this.size,
      required this.iconNoSeletion,
      required this.iconSelection,
      this.onPressedFabIcon})
      : super(key: key);

  bool isSelecte;
  final double? size;
  final IconData iconNoSeletion;
  final IconData iconSelection;
  final VoidCallback? onPressedFabIcon;

  @override
  State<FloatingActionButtonGreen> createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  void onPressedFav() {
    setState(() {
      if (widget.onPressedFabIcon != null) widget.onPressedFabIcon!();
      (widget.isSelecte) ? widget.isSelecte = false : widget.isSelecte = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: FloatingActionButton(
        backgroundColor: const Color(0xFF11DA53),
        mini: true,
        tooltip: "Fav",
        onPressed: onPressedFav,
        child: (widget.isSelecte)
            ? Icon(widget.iconNoSeletion)
            : Icon(widget.iconSelection),
      ),
    );
  }
}
