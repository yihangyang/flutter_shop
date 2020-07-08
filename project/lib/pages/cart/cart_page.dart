import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // Number(),
            // MyButton()
          ],
        )
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Selector<CategoryViewModel,List<CategoryModel>>(
      selector: (ctx, categoryVM) {
        return categoryVM.categorys;
      },
      // shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, categorys, child) {
        return ListView.builder(
          itemCount: categorys.length,
          itemBuilder: (ctx, index) {
            return Text(categorys.length.toString());
          }
        );
      },
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Container(
      child: RaisedButton(
        onPressed:  (){},
        child: Text(
          'count'
        )
      ),
    );
  }
}

