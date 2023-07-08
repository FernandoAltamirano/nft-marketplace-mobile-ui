import 'package:flutter/material.dart';
import 'package:nft_app_ui/providers/categories_provider.dart';
import 'package:provider/provider.dart';

class CarouselCategories extends StatelessWidget {
  const CarouselCategories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoriesProvider>(context);

    return Container(
      height: 40,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...[
            "All",
            "Trending",
            "Art Work",
            "Collectibles"
          ].map((e) => GestureDetector(
                onTap: () {
                  categoryProvider.setActiveCategory(e);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: categoryProvider.activeCategory == e
                          ? Colors.black
                          : const Color.fromRGBO(241, 241, 241, 1)),
                  child: Text(e,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: categoryProvider.activeCategory == e
                              ? Colors.white
                              : Colors.black)),
                ),
              )),
        ],
      ),
    );
  }
}
