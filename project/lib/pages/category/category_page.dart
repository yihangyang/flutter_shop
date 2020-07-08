import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/pages/category/category_content.dart';
import 'package:flutter_shop/service/service_methods.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Category'),
        ),
      ),
      body: CategoryContent(),
    );
  }
}