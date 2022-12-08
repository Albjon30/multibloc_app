import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_bloc_provider/views/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

// void main() {
//   // final String? original = stdin.readLineSync();

//   // final String reverse = original!.split('').reversed.join('');
//   // // then we will compare
//   // if (original == reverse) {
//   //   print('Its A Palindrome');
//   // } else {
//   //   print('Its A Not Palindrome');
//   // }

//   // List<int> a = [1, 2, 3, 4, 5, 6, 7, 8];

//   // final Iterable<int> b = a.reversed;

//   // print(a.reversed);
// }
