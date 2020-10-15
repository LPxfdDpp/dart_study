import 'package:flutter/material.dart';
import 'package:phone_study/basic_use_of_flutter/flutter_hero_widget/hero_play_01_next_page.dart';


class HeroPlay01 extends StatefulWidget {
  @override
  _HeroPlay01State createState() => _HeroPlay01State();
}

class _HeroPlay01State extends State<HeroPlay01> {
  @override
  Widget build(BuildContext context) {

   // Hero


    return Scaffold(
      appBar: AppBar(
        title: Text("hero控件"),
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    border:  const Border.fromBorderSide(BorderSide(
                      color: Colors.lightBlue,
                      width: 2
                    )),
                ),
                child: index == 1 ?GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HeroPlay01NextPage()));
                  },
                  child: Row(
                    children: <Widget>[
                      Hero(
                          tag: "guineaPig",
                          child: Image.asset("assets/images/guineaPig.jpeg")),
                      Text("这个是hero测试用的")
                    ],
                  ),
                ):Image.asset("assets/images/guineaPig.jpeg"),

              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: 9),
      ),
    );
  }
}
