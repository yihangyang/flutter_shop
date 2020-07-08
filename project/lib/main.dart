import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index/index_page.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CategoryViewModel()),
        // ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
        //   create: (ctx) => MealViewModel(),
        //   update: (ctx, filterVM, mealVM) {
        //     mealVM.updateFilters(filterVM);
        //     return mealVM;
        //   }
        // ),
        // ChangeNotifierProxyProvider<FilterViewModel, FavorViewModel>(
        //   create: (ctx) => FavorViewModel(),
        //   update: (ctx, filterVM, favorVM) {
        //     favorVM.updateFilters(filterVM);
        //     return favorVM;
        //   }
        // ),
        // // ChangeNotifierProvider(create: (ctx) => FavorViewModel()),
      ],
      child: MyApp(),
    )
  );
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

