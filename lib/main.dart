import 'package:flutter/material.dart';

import 'package:ganme_of_thrones/ui/home_page.dart';

void main() {
  runApp(const GameOfThrones());
}

class GameOfThrones  extends StatelessWidget {
  const GameOfThrones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner:  false,
      home:  HomePage(),
    );
  }
}
