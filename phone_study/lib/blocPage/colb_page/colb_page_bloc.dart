import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'colb_page_event.dart';

part 'colb_page_state.dart';

class ColbPageBloc extends Bloc<ColbPageEvent, ColbPageState> {
  @override
  ColbPageState get initialState => InitialColbPageState();

  @override
  Stream<ColbPageState> mapEventToState(ColbPageEvent event) async* {
    // TODO: Add your event logic

    print("asdf");

    if(event is ConvertToHexEvent){
      print(event.runtimeType);
      print(event);

      yield ColbPageNState(int.parse(event.decimalText).toRadixString(16).toUpperCase());
    }
    else if(event is ConvertToBinaryEvent){
      yield ColbPageNState(int.parse(event.decimalText).toRadixString(2).toUpperCase());
    }
    else{
      print(event.runtimeType);
      print(event);

      yield initialState;
    }
  }
}
