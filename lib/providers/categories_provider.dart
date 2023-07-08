import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  String activeCategory = "All";
  Map<String, Object> selectedCard = {};

  void setActiveCategory(String category) {
    activeCategory = category;
    notifyListeners();
  }

  void setSelectedCard(Map<String, Object> card) {
    selectedCard = card;
    notifyListeners();
  }
}
