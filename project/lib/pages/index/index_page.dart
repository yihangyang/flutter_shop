import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/cart/cart_page.dart';
import 'package:flutter_shop/pages/category/category_page.dart';
import 'package:flutter_shop/pages/home/home_page.dart';
import 'package:flutter_shop/pages/me/me_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('Category'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('Cart'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('Me'),
    ),
  ];
  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MePage()
  ];
  int curIndex = 0;
  var curPage;

  @override
  void initState() {
    curPage = tabBodies[curIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334); 
    // final sneaker = ModalRoute.of(context).settings.arguments as SneakerModel;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 255, 246),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            curIndex = index;
            curPage = tabBodies[curIndex];
          });
        },
      ),
      body: curPage,
    );
  }
}