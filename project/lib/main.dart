import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index/index_page.dart';
import 'package:flutter_shop/viewmodel/initialize_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:  providers,
      child: MyApp(),
    )
  );
}

class FilterViewModel {
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IndexPage()
    );
  }
}

