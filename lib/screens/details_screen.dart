import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_app_ui/providers/categories_provider.dart';
import 'package:nft_app_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CategoriesProvider>(context).selectedCard;

    if (data.isEmpty) {
      Navigator.pop(context);
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(
              children: [
                Image(
                  image: AssetImage(data["image"] as String),
                  height: MediaQuery.of(context).size.height * 0.67,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
                  child: Row(children: [
                    BgBlur(
                      padding: 0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Transform.rotate(
                            angle: 3.1416,
                            child: SvgPicture.asset(
                                "assets/icons/arrow-right.svg",
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn)),
                          )),
                    ),
                    const Spacer(),
                    BgBlur(
                      padding: 0,
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/heart.svg",
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn))),
                    ),
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  child: BadgesDetails(),
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              height: 200,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  Text(
                    (data["name"] as String).replaceAll("\n", ""),
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300, height: 1.5),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Positioned(
        bottom: 60,
        left: MediaQuery.of(context).size.width * 0.2,
        child: BgBlur(
            padding: 0,
            child: SwipeButton2(
              width: MediaQuery.of(context).size.width * 0.6,
              backgroundColor: Colors.black,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/ethereum.png"),
                    width: 30,
                  ),
                  SizedBox(width: 5),
                  Text('8.34 ETH',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white))
                ],
              ),
            )),
      ),
    );
  }
}

class BadgesDetails extends StatelessWidget {
  const BadgesDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          child: Column(
            children: [
              Text(
                "10k",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Items",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(color: Colors.white, width: 1, height: 25),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          child: Column(
            children: [
              Text(
                "420",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Owners",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(color: Colors.white, width: 1, height: 25),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          child: Column(
            children: [
              Text(
                "140",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Floor",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
