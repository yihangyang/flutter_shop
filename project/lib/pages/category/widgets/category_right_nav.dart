import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryRightNav extends StatefulWidget {
  @override
  _CategoryRightNavState createState() => _CategoryRightNavState();
}

class _CategoryRightNavState extends State<CategoryRightNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
      ),
      child: Consumer<CategoryViewModel>(
        builder: (ctx, catVM, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catVM.getCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(catVM.getCategoryList[index]);
            }
          );
        }
      )
    );
  }

  Widget _rightInkWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {
        print(item.mallSubName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28)
          ),
        ),
      ),
    );
  }
}