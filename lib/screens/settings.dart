import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phocally/providers/row_option.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Settings_Main());
  }
}

class Settings_Main extends StatefulWidget {
  const Settings_Main({super.key});

  @override
  State<Settings_Main> createState() => _Settings_MainState();
}

class _Settings_MainState extends State<Settings_Main> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Row(children: [
          ElevatedButton(onPressed: (){context.read<Row_option>().changeRow_2();
          Navigator.pop(context);}, child: Text('2줄')),
          ElevatedButton(onPressed: (){context.read<Row_option>().changeRow_1();
          Navigator.pop(context);}, child: Text('1줄'))],)
    ));
  }
}
