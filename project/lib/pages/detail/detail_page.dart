import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodel/detail_view_model.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  const DetailPage({Key key, this.goodsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Container(
      child: Center(
        child: Text("Product ID: ${goodsId}"),
      ),
    );
  }

  void _getBackInfo(BuildContext context) async {
    await Provider.of<DetailViewModel>(context).getDetailinfo(goodsId);
    print("finished...");
  }
}