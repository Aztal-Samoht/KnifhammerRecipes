// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:knifehammer_recipes/widgets/screen_base.dart';
// import 'package:path_provider/path_provider.dart';
//
// class SaveTestsScreen extends StatelessWidget {
//   static String id = 'save';
//   const SaveTestsScreen({super.key});
//
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//
//     return directory.path;
//   }
//
//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/counter.txt');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenBase(
//       appbar: AppBar(),
//       body: Column(
//         children: [],
//       ),
//     );
//   }
// }
