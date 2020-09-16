import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodel/detail_view_model.dart';
import 'package:provider/provider.dart';

class DetailContent extends StatelessWidget {
  final String itemId;
  const DetailContent({Key key, this.itemId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getBackInfo(context),
      builder: (ctx, snapshot) {
        if(snapshot.hasData) {
          return Container(
            child: Column(
              children: [
                Text('Itemsid: $itemId')
              ],
            ),
          );
        } else {
          return Text('Loading...');
        }
      },
    );
  }
  Future _getBackInfo(BuildContext context) async {
    await Provider.of<DetailViewModel>(context).getDetailinfo(itemId);
    return 'finish to reload';
  }
}