import 'package:flutter/material.dart';
import 'package:phone_study/basic_use_of_flutter/about_provider/provider_logic_01.dart';
import 'package:provider/provider.dart';

import 'about_provider_01.dart';


class AboutProvider02 extends StatefulWidget {

  final con;

  const AboutProvider02({Key key, this.con}) : super(key: key);

  @override
  _AboutProvider02State createState() => _AboutProvider02State();
}

class _AboutProvider02State extends State<AboutProvider02> {
  @override
  Widget build(BuildContext context) {
    print("AboutProvider02");
    print(context.hashCode);

    return Center(
      child: GestureDetector(
        onTap: (){
          print("GestureDetector");
          print(widget.con.hashCode);
              ///不会获得 Provider （有范围保护）把父级的上下文传过来才可以
            print(Provider.of<ProviderLogic01>(context,listen:false).value);
//            print(Provider.of<ProviderLogic01>(widget.con,listen:false).value);
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.cyanAccent,
        ),
      ),
    );
  }
}
