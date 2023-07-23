import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Main()
    );
  }
}


class Main extends StatefulWidget {
  const Main({super.key});


  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
          appBar: AppBar(backgroundColor: Colors.cyan[300],),
          body: ListView.separated(
              padding: EdgeInsets.all(8),
              itemCount: 31,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.cyan, width: 3),
                    ),
                    height: 300,
                    child: Text('$index')
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 10,
              )
          )
      ),
    );
  }
}

