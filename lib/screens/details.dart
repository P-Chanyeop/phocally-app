import 'package:flutter/material.dart';

class Details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsState();
  }
  
}
class DetailsState extends State<Details>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: Text("hello"),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
        leading: IconButton(
        icon: Icon(Icons.menu), // 햄버거버튼 아이콘 생성
        onPressed: () {
        // 아이콘 버튼 실행
        print('menu button is clicked');
        },
        ),
        actions: <Widget>[
        // IconButton(
        //   icon: Icon(Icons.search), // 검색 아이콘 생성
        //   onPressed: () {
        //     // 아이콘 버튼 실행
        //     print('Search button is clicked');
        //   },
        // ),
          ],
        ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 250,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    Icons.calendar_month_rounded,
                  color: Colors.redAccent,
                  size: 30.0,
                ),
                SizedBox(width: 10,),
                Text(
                    "예정된 일정",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}