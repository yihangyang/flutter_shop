import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index/index_page.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routers.dart';
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


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // import fluro router
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;
    return MaterialApp(
      title: 'Flutter Shop',
      // fluro
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IndexPage()
    );
  }
}

