import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/service/service_methods.dart';

class CategoryLeftNav extends StatefulWidget {
  @override
  _CategoryLeftNavState createState() => _CategoryLeftNavState();
}

class _CategoryLeftNavState extends State<CategoryLeftNav> {
  List list = [];
  @override
  void initState() {
    _getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1,color: Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
      )
    );
  }

  Widget _leftInkWell(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
          ),
        ),
        child: Text(list[index].mallCategoryName, style: TextStyle(fontSize: ScreenUtil().setSp(26)),),
      ),
    );
  }
  void _getCategory() async{
    await request('getCategory').then((val) {
      // var data = json.decode(val.toString());
      var data = val;
      CategoryListModel category =  CategoryListModel.fromJson(data['data']);
      setState(() {
        list = category.data;
      });
      // list.data.forEach((element) => print(element.mallCategoryName));
    });
  }
}