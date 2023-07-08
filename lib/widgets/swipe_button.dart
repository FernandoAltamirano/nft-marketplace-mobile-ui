import 'dart:ui';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SwipeButton extends StatefulWidget {
  const SwipeButton({
    Key? key,
    required this.buttonStyle,
  }) : super(key: key);

  final ButtonStyle buttonStyle;

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double positionX = 0.0;
  double localPosition = 0.0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              child: Row(
                children: [
                  GestureDetector(
                      onHorizontalDragEnd: (DragEndDetails details) {
                        if (localPosition >=
                            MediaQuery.of(context).size.width - 170) {
                          Navigator.pushReplacementNamed(context, "Home");
                          return;
                        }
                        setState(() {
                          positionX = 0.0;
                        });
                      },
                      onHorizontalDragUpdate: (DragUpdateDetails details) {
                        if (details.localPosition.dx <
                            MediaQuery.of(context).size.width - 90 + 30) {
                          setState(() {
                            positionX += details.delta.dx;
                            localPosition = details.localPosition.dx;
                          });
                        }
                      },
                      child: Transform.translate(
                          offset: Offset(positionX, 0.0),
                          child: Draggablebutton())),
                  Container(
                    width: MediaQuery.of(context).size.width - 128,
                    child: const Center(
                      child: Text(
                        "Swipe to get started",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Draggablebutton extends StatelessWidget {
  const Draggablebutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(1000)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: SvgPicture.asset(
          "assets/icons/next.svg",
          width: 1,
        ),
      ),
    );
  }
}

class SwipeButton2 extends StatelessWidget {
  const SwipeButton2({
    Key? key,
    required this.width,
    required this.backgroundColor,
    required this.child,
  }) : super(key: key);
  final double width;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
        width: width,
        backgroundColor: backgroundColor,
        reverseSlideAnimationCurve: Curves.easeInOut,
        reverseSlideAnimationDuration: const Duration(milliseconds: 200),
        toggleColor: Colors.white,
        icon: SvgPicture.asset(
          "assets/icons/next.svg",
          width: 20,
        ),
        action: (controller) async {
          controller.loading(); //starts loading animation
          await Future.delayed(const Duration(seconds: 1));
          controller.success(); //starts success animation
          await Future.delayed(const Duration(milliseconds: 500));
          Navigator.pushReplacementNamed(context, "Home");
        },
        child: child);
  }
}
