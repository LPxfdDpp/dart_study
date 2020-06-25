class Read {

  String _pp;


  read () async {


    for(int i=0;i<5;i++){

      print(i);

      await Future.delayed(Duration(milliseconds: 4500));

    }


  }

}