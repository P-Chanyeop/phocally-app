import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
    );
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
          const SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () => getImage(ImageSource.gallery),
              child: const Text('개짜증나네ㅡㅡ'),
            ),
          ),
          const SizedBox(width: 20),
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
      height: 390,
      width: 370,
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
          Positioned(
            child: Image.file(
              File(e.path),
              fit: BoxFit.fill,
              width: 400,
              height: 370,
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
}
