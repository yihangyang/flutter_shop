import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/detail/detail_content.dart';
import 'package:flutter_shop/viewmodel/detail_view_model.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String itemId;
  const DetailPage({Key key, this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail'),
        centerTitle: true,
      ),
      body: DetailContent(itemId: itemId,),
    );
  }
}