import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:phocally/screens/settings.dart';
import 'package:phocally/screens/test.dart';
import 'package:provider/provider.dart';
import 'package:phocally/providers/row_option.dart';
import 'package:permission_handler/permission_handler.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Row_option()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Row_option(),
      child: MaterialApp(
          home: Main()
      ),
    );
  }
}


class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Asset> images = <Asset>[];
  String _error = 'No Error Detected';

  // getmediaPermission() async{
  //   var status = await Permission.storage.status;
  //   if (status.isGranted){
  //     print('허락됨');
  //   } else if (status.isDenied) {
  //     print('거절됨');
  //     Permission.storage.request();
  //   }
  // }
  // getcameraPermission() async{
  //   var status1 = await Permission.camera.status;
  //   if (status1.isGranted){
  //     print('허락됨');
  //   } else if (status1.isDenied) {
  //     print('거절됨');
  //     Permission.camera.request();
  //   }
  // }

  Future<void> _getStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      print('저장소 권한이 승인되었습니다.');
    } else if (status.isDenied || status.isPermanentlyDenied) {
      var result = await Permission.storage.request();
      if (result.isGranted) {
        print('저장소 권한이 승인되었습니다.');
      } else if (result.isPermanentlyDenied) {
        print('저장소 권한이 영구적으로 거부되었습니다.');
        await openAppSettings();
      } else {
        print('저장소 권한이 거부되었습니다.');
      }
    }
  }


  @override
  void initState(){
    super.initState();
    _getStoragePermission();
  }

  Widget build(BuildContext context) {

    return SafeArea(
      child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan[300],
            actions: [IconButton(onPressed: loadAssets,
                icon: Icon(Icons.arrow_forward))],),
          drawer: Drawer(
            child: ListView(
              children: [ListTile(
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('설정'),
                trailing: Icon(Icons.settings),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Settings_Main()));
                },
              ),
                //ListTile(onTap: getmediaPermission,title: Text('getpermission'),)
              ],
            ),
          ),
          body: GridView.builder(
            itemCount: 31,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.watch<Row_option>().row_option,   //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0//item 의 가로 1, 세로 2 의 비율
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration:BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 3),
                    ),child: GridTile(
                  header: Container(height:20,decoration:BoxDecoration(color: Colors.orange),
                    child: Text('$index',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),
                  ),
                  child: Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                      decoration:BoxDecoration(),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [Image.asset('assets/images/ddd.jpg'),Image.asset('assets/images/aaa.png')
                          //Image.asset('assets/images/green_button.png'), Image.asset('assets/images/red_button.png')
                        ],
                      )
                  ),
                )
                ),
              );
            },   //item 의 반목문 항목 형성
          )
      ),
    );
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }
}

// return Container(color: Colors.yellow,
// child: Column(children:[
// Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Row(children: [SizedBox(width: 50,),Text('$index'),SizedBox(width: 50), IconButton(onPressed: (){}, icon: Icon(Icons.search))],) ),
// Container( height: 100, width: 100, color: Colors.blue,
// child: ListView(scrollDirection: Axis.horizontal, children: [Image.asset('assets/images/green_button.png'), Image.asset('assets/images/red_button.png')],),
// )
// ]
// )
// );


