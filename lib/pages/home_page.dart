import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _buttonRadius = 100;

  final Tween<double> _backgroundScale = Tween<double>(begin: 0.1, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _pageBackground(),
              _circularAnimation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      duration: Duration(seconds: 2),
      builder: (_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.red,
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
          curve: Curves.easeInOutCubicEmphasized,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_buttonRadius),
            color: Colors.purple,
          ),
          duration: const Duration(seconds: 1),
          child: const Center(
            child: Text(
              'Tap Me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
