// // ss = "data手动阀手动阀data手动阀手动阀data手动阀手动阀datadata手动阀手动阀data手动阀手动阀data手动阀手动阀data手动阀手动阀data手动阀手动阀手动阀手动阀data手动阀手动阀";
// ss = "手";
//
// TextPainter painter = TextPainter(
//   text: TextSpan(text:ss),
//   textDirection:TextDirection.ltr,
//   maxLines:3,
//   textWidthBasis :TextWidthBasis.parent,
// );
//
// painter.layout(maxWidth:_width);
// size = painter.size;//这里就可以获取到段落的宽高了


// getInputSize(String input,double maxWidth){
//   TextPainter painter = TextPainter(
//     text: TextSpan(text:input),
//     textDirection:TextDirection.ltr,
//     maxLines:3,
//     textWidthBasis :TextWidthBasis.parent,
//   );
//   painter.layout(maxWidth:maxWidth);
//   return painter.size;
// }

//光标自动聚焦到某个位置
// _textFocusNode = FocusNode();
// _controller = new TextEditingController.fromValue(
// TextEditingValue(
// text: "k卡啥的积分inputText",
// selection:
// TextSelection.fromPosition(
// TextPosition(
// affinity: TextAffinity.downstream,
// offset: 5)),
// composing: TextRange(start:0,end:3)
//
// ));
//
// Timer(Duration(seconds: 1), (){
// _textFocusNode.requestFocus();
// });