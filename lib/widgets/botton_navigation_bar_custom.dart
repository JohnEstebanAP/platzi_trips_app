import 'package:flutter/material.dart';

class BottonNavigationBarCustom extends StatefulWidget {
  const BottonNavigationBarCustom({Key? key}) : super(key: key);

  @override
  State<BottonNavigationBarCustom> createState() =>
      _BottonNavigationBarCustomState();
}

class _BottonNavigationBarCustomState extends State<BottonNavigationBarCustom> {
  int indexTap = 2;

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listItems = [
      (indexTap == 0)
          ? BottomNavigationBarItem(
              icon: _iconCustom(
                  50, Colors.white, Icons.bookmark_outline_outlined),
              label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(
                  35, Colors.white60, Icons.bookmark_outline_outlined),
              label: ""),
      (indexTap == 1)
          ? BottomNavigationBarItem(
              icon: _iconCustom(50, Colors.white, Icons.live_tv_outlined),
              label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(35, Colors.white60, Icons.live_tv_outlined),
              label: ""),
      (indexTap == 2)
          ? BottomNavigationBarItem(
              icon: _iconCustom(50, Colors.white, Icons.add), label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(35, Colors.white60, Icons.add), label: ""),
      (indexTap == 3)
          ? BottomNavigationBarItem(
              icon: _iconCustom(50, Colors.white, Icons.email_outlined),
              label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(35, Colors.white60, Icons.email_outlined),
              label: ""),
      (indexTap == 4)
          ? BottomNavigationBarItem(
              icon: _iconCustom(50, Colors.white, Icons.person), label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(35, Colors.white60, Icons.person), label: ""),
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
        primaryColor: Colors.purple,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: indexTap,
        selectedFontSize: 0,
        onTap: onTapTapped,
        items: listItems,
      ),
    );
  }

  Container _iconCustom(double size, Color color, IconData icon) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.blue),
    );
  }
}
