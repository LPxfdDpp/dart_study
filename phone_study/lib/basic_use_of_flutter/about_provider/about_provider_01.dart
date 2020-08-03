import 'package:flutter/material.dart';
import 'package:phone_study/basic_use_of_flutter/about_provider/provider_logic_01.dart';
import 'package:provider/provider.dart';

import 'about_provider_02.dart';


class AboutProvider01 extends StatefulWidget {
  @override
  _AboutProvider01State createState() => _AboutProvider01State();
}

class _AboutProvider01State extends State<AboutProvider01> {
  @override
  Widget build(BuildContext context) {
    print("AboutProvider01");
    print(context.hashCode);
    return
      Center(
        child: GestureDetector(
          onTap: (){
//            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutProvider02()));
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AboutProvider02(con:context)));
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.pink,
          ),
        ),
      );



//    Provider<ProviderLogic01>(
//        create: (context)=>ProviderLogic01(),
//        child: SizedBox.expand(
//          child: Center(
//            child: GestureDetector(
//              onTap: (){
//                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutProvider02()));
//              },
//              child: Container(
//                width: 200,
//                height: 200,
//                color: Colors.pink,
//              ),
//            ),
//          ),
//        )
//    );

  }
}
