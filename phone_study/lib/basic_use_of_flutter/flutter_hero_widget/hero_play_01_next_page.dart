import 'package:flutter/material.dart';

class HeroPlay01NextPage extends StatefulWidget {
  @override
  _HeroPlay01NextPageState createState() => _HeroPlay01NextPageState();
}

class _HeroPlay01NextPageState extends State<HeroPlay01NextPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
          tag: "guineaPig", child: Image.asset("assets/images/guineaPig.jpeg")),
    );
  }
}
