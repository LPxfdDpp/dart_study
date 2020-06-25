part of 'colb_page_bloc.dart';

@immutable
abstract class ColbPageEvent {}

///添加的事件一
class ConvertToHexEvent extends ColbPageEvent {

  final String decimalText;
  ConvertToHexEvent(this.decimalText);

  List<Object> get props => [decimalText];

}

///添加的事件二
class ConvertToBinaryEvent extends ColbPageEvent {

  final String decimalText;
  ConvertToBinaryEvent(this.decimalText);

  List<Object> get props => [decimalText];

}