import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000), color: Colors.black),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 20, top: 5, bottom: 5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Colors.white),
                    child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Image(
                            image: AssetImage("assets/images/ethereum.png"))),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "42.80",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )
                ],
              ),
            )),
        Row(
          children: [
            SvgPicture.asset("assets/icons/notifications.svg"),
            const SizedBox(width: 10),
            SvgPicture.asset("assets/icons/settings.svg"),
            const SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: const Image(
                    image: NetworkImage(
                        "https://lh3.googleusercontent.com/ogw/AOLn63EsJEyM1jM6jNolDrcZ5C1wQMqPfYVhgrhq5IGxeQ=s64-c-mo")),
              ),
            )
          ],
        ),
      ],
    );
  }
}
