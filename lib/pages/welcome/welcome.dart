import 'package:flutter/material.dart';
import 'widget.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: [
            appOnboardingPage(
              _controller,
              imgPath: "assets/images/reading.png",
              title: "First See Learning",
              subtitle:
                  "Forget about the paper, now learning in all in one place 123",
              index: 1,
            ),
            appOnboardingPage(
              _controller,
              imgPath: "assets/images/man.png",
              title: "Connect With Everyone",
              subtitle:
                  "Always keep in touch with your tutor and friends. Let's get connected",
              index: 2,
            ),
            appOnboardingPage(
              _controller,
              imgPath: "assets/images/boy.png",
              title: "Always Facinated Learning",
              subtitle:
                  "Anywhere, anytime. The time is at your discreation. So study wherever you can",
              index: 3,
            ),
          ],
        ),
      ],
    ));
  }
}
