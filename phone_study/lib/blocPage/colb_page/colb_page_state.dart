part of 'colb_page_bloc.dart';

@immutable
abstract class ColbPageState {
  var value;
}

class InitialColbPageState extends ColbPageState {
  InitialColbPageState(){
    this.value = "初始值";
  }
}

class ColbPageNState extends ColbPageState {
  ColbPageNState(String val){
    this.value = val;
  }
}