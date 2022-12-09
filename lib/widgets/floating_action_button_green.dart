import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  FloatingActionButtonGreen({Key? key, this.isSelecte = false, this.size})
      : super(key: key);

  bool isSelecte;
  final double? size;

  @override
  State<FloatingActionButtonGreen> createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  void onPressedFav() {
    print("Hola me diste click");
    setState(() {
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
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
