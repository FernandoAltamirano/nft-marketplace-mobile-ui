import 'package:flutter/material.dart';
import 'package:nft_app_ui/providers/categories_provider.dart';
import 'package:nft_app_ui/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "Start",
      routes: {
        "Start": (context) => const StartScreen(),
        "Home": (context) => const HomeScreen(),
        "Details": (context) => const DetailsScreen(),
      },
    );
  }
}
