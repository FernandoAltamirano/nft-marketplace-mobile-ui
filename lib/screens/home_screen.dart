import 'package:flutter/material.dart';
import 'package:nft_app_ui/mocks/cards_data.dart';
import 'package:nft_app_ui/providers/providers.dart';
import 'package:nft_app_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoriesProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: HomeHeader(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  child: Text(
                    "EXPLORE THE MOST POPULAR NFT 🔥",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: CustomInput(),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: CarouselCategories(),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 369,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ...cardsData
                            .where((element) => (element['category'] as List)
                                .contains(categoryProvider.activeCategory))
                            .map((e) => CardItem(
                                  image: e['image'] as String,
                                  volume: e['volume'] as String,
                                  name: e['name'] as String,
                                  price: e['price'] as String,
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
