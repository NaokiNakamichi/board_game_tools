import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/cupertino.dart';

const double kCoinRadius = 50.0;
class CoinTossScreen extends StatelessWidget {

  static const id = 'coin_toss_screen';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _CoinToss(),
    );
  }
}

class _CoinToss extends StatefulWidget {
  const _CoinToss();

  @override
  _CoinTossState createState() => _CoinTossState();
}

class _CoinTossState extends State<_CoinToss> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _toss;
  Animation<Matrix4> _turn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _toss = _TossTween(
      height: MediaQuery.of(context).size.height,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.slowMiddle,
      ),
    );

    _turn = _TurnTween().animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget child) => Transform.translate(
          offset: Offset(size.width / 2 - kCoinRadius, _toss.value),
          child: Transform(
            child: child,
            transform: _turn.value,
            alignment: Alignment.center,
          ),
        ),
        child: SizedBox(
          width: kCoinRadius * 2,
          height: kCoinRadius * 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () => _controller.forward(),
      ),
    );
  }
}

class _TossTween extends Tween<double> {
  _TossTween({@required this.height})
      : super(begin: _lerp(height, 0.0), end: _lerp(height, 1.0));

  final double height;

  @override
  double lerp(double t) => _lerp(height, t);

  static double _lerp(double height, double t) {
    final double top = height / 6;
    final double rad = t * pi * 2 + pi / 2;
    return (height - top) / 2 + (height - top) / 2 * sin(rad) + top;
  }
}

class _TurnTween extends Tween<Matrix4> {
  _TurnTween() : super(begin: _lerp(0.0), end: _lerp(1.0));

  @override
  Matrix4 lerp(double t) => _lerp(t);

  static Matrix4 _lerp(double t) {
    return Matrix4.rotationY(t * pi * 20);
  }
}