import 'package:flutter/material.dart';

class Theme01 extends StatefulWidget {
  @override
  _Theme01State createState() => _Theme01State();
}

class _Theme01State extends State<Theme01> {
  @override
  Widget build(BuildContext context) {
    
    



    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        canvasColor: Colors.blueGrey,
        textTheme: Theme.of(context).textTheme.copyWith(
            caption:TextStyle(
              color: Colors.white54
            )
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("theme"),
        ),
        body: Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    border:  const Border.fromBorderSide(BorderSide(
                        width: 2
                    )),
                  ),
                  child: index == 1 ?Row(
                    children: <Widget>[
                      Transform(
                          transform: Matrix4(
                            0.2,0,0,0,
                            0,0.5,0,0,
                            0,0,1,0,
                            5,10,0,1,
                          ),
                          child: Image.asset("assets/images/guineaPig.jpeg")),
                      Text("这个是hero测试用的")
                    ],
                  ):Image.asset("assets/images/guineaPig.jpeg"),

                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 9),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar),title: Text("data")),
          BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar),title: Text("data")),
        ]),
      ),
    );
  }
}
