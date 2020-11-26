import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';

class MidAnimationController extends AnimationController {
  Duration duration;
  Duration reverseDuration;
  final double lowerBound;
  final double upperBound;

  MidAnimationController({
    double value,
    this.duration,
    this.reverseDuration,
    this.lowerBound = 0.0,
    this.upperBound = 1.0,
    TickerProvider vsync,
  }) : super(
    value: value,
    duration: duration,
    reverseDuration:reverseDuration,
    lowerBound: lowerBound,
    upperBound: upperBound,
    vsync: vsync
  );

  MidAnimationController.unbounded({
    this.duration,
    this.reverseDuration,
    TickerProvider vsync,
  }) : lowerBound = double.negativeInfinity,
        upperBound = double.infinity,
        super(
      duration: duration,
      reverseDuration:reverseDuration,
      vsync: vsync
  );


  @override
  void reset() {
    value = (lowerBound+upperBound)/2;
  }
}