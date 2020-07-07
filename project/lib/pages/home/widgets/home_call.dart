import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
// to c
class HomeCall extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  const HomeCall({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(305),
      width: ScreenUtil().setWidth(750),
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage,fit: BoxFit.fill,),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:'+ leaderPhone;
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw "url cannot be abtained";
    }
  }
}