import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/theme_provider.dart';
import 'package:portfolio_website/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: HomeScreen(),
            );
          },
          title: 'Soe Than',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentThemeData,
        );
      }),
    );
  }
}
