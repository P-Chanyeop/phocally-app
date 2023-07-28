import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final String JAN = "assets/images/JAN.png";
  final String FEB = "assets/images/FEB.png";
  final String MAR = "assets/images/MAR.png";
  final String APR = "assets/images/APR.png";
  final String MAY = "assets/images/MAY.png";
  final String JUN = "assets/images/JUN.png";
  final String JUL = "assets/images/JUL.png";
  final String AUG = "assets/images/AUG.png";
  final String SEP = "assets/images/SEP.png";
  final String OCT = "assets/images/OCT.png";
  final String NOV = "assets/images/NOV.png";
  final String DEC = "assets/images/DEC.png";
  final double scale = 16;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Image.asset("assets/images/library.png", width: 500, height: 500,),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 230,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      print("JAN is clicked");
                    },
                      child: Image.asset(JAN, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){
                      print("JAN is clicked");

                    },
                      child: Image.asset(FEB, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(MAR, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(APR, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(MAY, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(JUN, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(JUL, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(AUG, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(SEP, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(OCT, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(NOV, scale: scale,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(onPressed: (){},
                      child: Image.asset(DEC, scale: scale),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
