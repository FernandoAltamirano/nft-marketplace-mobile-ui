import 'package:flutter/material.dart';
import 'package:nft_app_ui/widgets/widgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(204, 204, 204, 1)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 132, left: 35, right: 35),
              child: Text(
                "Collect Your\n Rare Digital Art",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                  "A credible and excellent marketplace for\n non-fungible tokens",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 290,
                  child: ClipRect(
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: Image.asset(
                        'assets/images/start.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BgBlur(
          padding: 0,
          child: SwipeButton2(
            width: MediaQuery.of(context).size.width * 0.8,
            backgroundColor: const Color.fromARGB(157, 0, 0, 0),
            child: const Text('Swipe to get started',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          )),
    );
  }
}
