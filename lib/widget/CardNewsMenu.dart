import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardNewMenu extends StatefulWidget {
  CardNewMenu({
    this.name
  });
  final String name;
  @override
  _CardNewMenuState createState() => _CardNewMenuState();
}

class _CardNewMenuState extends State<CardNewMenu> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 10,right:10,left: 10),
      child:  Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        decoration: BoxDecoration(
           color: Colors.grey[200],
           borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        height: ScreenUtil().setHeight(300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.name.toUpperCase(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40)
              ),
            ),
            
          ],
        ),
      ),
    
    );
  }
}