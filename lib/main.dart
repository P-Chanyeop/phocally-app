import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:phocally/screens/settings.dart';
import 'package:phocally/screens/test.dart';
import 'package:provider/provider.dart';
import 'package:phocally/providers/row_option.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phocally/screens/diary.dart';
import 'package:phocally/screens/library.dart';
import 'imagePicker.dart' as imagePicker;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
          // home:
        // ImagePickerScreen(),
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
  final imagePicker.ImagePickerScreen imagepicker = imagePicker.ImagePickerScreen();
  final ImagePicker _picker = ImagePicker();
  final List<XFile?> _pickedImages = [];

  // 카메라, 갤러리에서 이미지 1개 불러오기
  // ImageSource.galley , ImageSource.camera
  void getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    setState(() {
      _pickedImages.add(image);
    });
  }

  // 이미지 여러개 불러오기
  void getMultiImage() async {
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null) {
      setState(() {
        _pickedImages.addAll(images);
      });
    }
  }
  // 화면 상단 버튼
  Widget _imageLoadButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: ElevatedButton(
              onPressed: () => getImage(ImageSource.camera),
              child: const Text('Camera'),
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            child: ElevatedButton(
              onPressed: () => getImage(ImageSource.gallery),
              child: const Text('개짜증나네ㅡㅡ'),
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            child: ElevatedButton(
              onPressed: () => getMultiImage(),
              child: const Text('Multi Image'),
            ),
          ),
        ],
      ),
    );
  }

  // 불러온 이미지 gridView
  Widget _gridPhoto() {
    return SizedBox(
      width: 260,
      height: 260,
      child: _pickedImages.isNotEmpty
          ? GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // crossAxisCount: 3,
          crossAxisCount: 1,
        ),
        children: _pickedImages
            .where((element) => element != null)
            .map((e) => _gridPhotoItem(e!))
            .toList(),
      )
          : const SizedBox(),
    );
  }

  Widget _gridPhotoItem(XFile e) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              File(e.path),
              fit: BoxFit.fill,
              width: 250,
              height: 260,
            ),
          ),
          Positioned(
            top: 1,
            right: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pickedImages.remove(e);
                });
              },
              child: const Icon(
                Icons.cancel_rounded,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }
  // final _ImagePickerScreenState imagespick = _ImagePickerScreenState();
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

  // Future<void> _getStoragePermission() async {
  //   var status = await Permission.storage.status;
  //   if (status.isGranted) {
  //     print('저장소 권한이 승인되었습니다.');
  //   } else if ( status.isDenied ||  status.isPermanentlyDenied) {
  //     var result = await Permission.storage.request();
  //     if ( result.isGranted) {
  //       print('저장소 권한이 승인되었습니다.');
  //     } else if ( result.isPermanentlyDenied) {
  //       print('저장소 권한이 영구적으로 거부되었습니다.');
  //       await openAppSettings();
  //     } else {
  //       print('저장소 권한이 거부되었습니다.');
  //     }
  //   }
  // }

  //
  // @override
  // void initState(){
  //   super.initState();
  //   _getStoragePermission();
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan[300],
            actions: [IconButton(onPressed: (){},
                icon: Icon(Icons.arrow_forward))
            ],),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_forward_ios),
                  title: Text('설정'),
                  trailing: Icon(Icons.settings),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Settings_Main()));
                  },
                ),
                //ListTile(onTap: getmediaPermission,title: Text('getpermission'),)
              ],
            ),
          ),
          body: GridView.builder(
            itemCount: 31,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context
                    .watch<Row_option>()
                    .row_option, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0 //item 의 가로 1, 세로 2 의 비율
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 3),
                    ), child: GridTile(
                  header: Container(
                    height: 20, decoration: BoxDecoration(color: Colors.orange),
                    child: Text('$index',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Column(
                        children: [
                          _imageLoadButtons(),
                          const SizedBox(height: 20),
                          _gridPhoto(),
                        ],
                      ),
                    ),
                  ),
                )
                ),
              );
            }, //item 의 반목문 항목 형성
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


// class ImagePickerScreen extends StatefulWidget {
//   const ImagePickerScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ImagePickerScreen> createState() => _ImagePickerScreenState();
// }
//
// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   final ImagePicker _picker = ImagePicker();
//   final List<XFile?> _pickedImages = [];
//
//   List<XFile?> getList(){
//     return _pickedImages;
//   }
//
//   // 카메라, 갤러리에서 이미지 1개 불러오기
//   // ImageSource.galley , ImageSource.camera
//   void getImage(ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);
//
//     setState(() {
//       _pickedImages.add(image);
//     });
//   }
//
//   // 이미지 여러개 불러오기
//   void getMultiImage() async {
//     final List<XFile>? images = await _picker.pickMultiImage();
//
//     if (images != null) {
//       setState(() {
//         _pickedImages.addAll(images);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//           child: Column(
//             children: [
//               _imageLoadButtons(),
//               const SizedBox(height: 20),
//               _gridPhoto(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 화면 상단 버튼
//   Widget _imageLoadButtons() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             child: ElevatedButton(
//               onPressed: () => getImage(ImageSource.camera),
//               child: const Text('Camera'),
//             ),
//           ),
//           const SizedBox(width: 20),
//           SizedBox(
//             child: ElevatedButton(
//               onPressed: () => getImage(ImageSource.gallery),
//               child: const Text('Image'),
//             ),
//           ),
//           const SizedBox(width: 20),
//           SizedBox(
//             child: ElevatedButton(
//               onPressed: () => getMultiImage(),
//               child: const Text('Multi Image'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 불러온 이미지 gridView
//   Widget _gridPhoto() {
//     return Expanded(
//       child: _pickedImages.isNotEmpty
//           ? GridView(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//         ),
//         children: _pickedImages
//             .where((element) => element != null)
//             .map((e) => _gridPhotoItem(e!))
//             .toList(),
//       )
//           : const SizedBox(),
//     );
//   }
//
//   Widget _gridPhotoItem(XFile e) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.file(
//               File(e.path),
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: 5,
//             right: 5,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _pickedImages.remove(e);
//                 });
//               },
//               child: const Icon(
//                 Icons.cancel_rounded,
//                 color: Colors.black87,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


