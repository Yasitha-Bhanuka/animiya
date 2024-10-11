import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _buttonRadius = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              _pageBackground(),
              _circularAnimation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E1E1E),
            Colors.blue,
          ],
        ),
      ),
    );
  }

  Widget _circularAnimation() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRadius = _buttonRadius == 100 ? 200 : 100;
          });
        },
        child: AnimatedContainer(
          width: _buttonRadius,
          height: _buttonRadius,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_buttonRadius),
            color: Colors.purple,
          ),
          duration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
