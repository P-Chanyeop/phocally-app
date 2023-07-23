import 'dart:io';

import 'package:flutter/material.dart';

class Diary extends StatefulWidget {


  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final textFieldController = TextEditingController();
  int maxlines = 30;
  @override
  void dispose(){
    textFieldController.dispose();
    super.dispose();
  }

  void decreaseTextField(){
    setState(() {
      maxlines = 5;
    });
  }

  void increaseTextField(){
    setState(() {
      maxlines = 30;
    });
  }
  @override
  Widget build(BuildContext context) {
    
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("★오늘의 일기★", style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600, color: Colors.orangeAccent))
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.all(10.0),
              child: SafeArea(
                child: TextField(
                  controller: textFieldController,
                    onTapOutside: (event){
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {
                        maxlines = 30;
                      });
                    },
                    onTap: (){
                        setState(() {
                          maxlines = 5;
                        });
                      },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2.0,
                        ),
                      ),
                    ),
                    maxLines: maxlines,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
              ),
              ),
        ],
      ),
    );
  }
}
