import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  
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
        onTap: () {},
        child: AnimatedContainer(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.purple,
          ),
          duration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
