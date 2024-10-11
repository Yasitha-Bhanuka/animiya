import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _buttonRadius = 100;

  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);

  late AnimationController _starIconAnimationController;

  @override
  void initState() {
    super.initState();
    _starIconAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _starIconAnimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _pageBackground(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _circularAnimation(),
                  _startIcon(),
                ],
              ),
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
            _starIconAnimationController.toggle();
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

  Widget _startIcon() {
    return AnimatedBuilder(
      animation: _starIconAnimationController,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: _starIconAnimationController.value * 2 * 3.14,
          child: _child,
        );
      },
      child: const Icon(
        Icons.star,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
