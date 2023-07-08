import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_app_ui/providers/providers.dart';
import 'package:nft_app_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.volume,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);
  final String volume;
  final String image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Image(
              image: AssetImage(image),
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BgBlur(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: const Image(
                                    image: AssetImage(
                                        "assets/images/ethereum.png")),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    volume,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  const Text(
                                    "Volume",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                        BgBlur(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(
                              "assets/icons/heart.svg",
                              width: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BgBlur(
                                child: Container(
                              width: 140,
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Current price",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Text(
                                        price,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            )),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<CategoriesProvider>(context,
                                    listen: false)
                                .setSelectedCard({
                              "image": image,
                              "name": name,
                              "price": price,
                              "volume": volume
                            });
                            Navigator.pushNamed(context, "Details");
                          },
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(17),
                              child: SvgPicture.asset(
                                "assets/icons/arrow-right.svg",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
