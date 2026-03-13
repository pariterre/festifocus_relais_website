import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  final List<(String, double)> _images = const [
    ('coin1', 50),
    ('coin1', 70),
    ('coin1', 130),
    ('coin2', 50),
    ('coin2', 90),
    ('coin2', 130),
    ('coin2', 130),
    ('coin3', 70),
    ('coin3', 90),
    ('coin3', 110),
    ('coin4', 50),
    ('coin4', 70),
    ('coin4', 90),
    ('coin4', 110),
    ('coin4', 130),
    ('coin4', 130),
    ('coin5', 70),
    ('coin5', 110),
    ('coin6', 50),
    ('coin6', 70),
    ('coin6', 90),
    ('coin6', 110),
    ('elf1', 50),
    ('elf1', 70),
    ('elf1', 90),
    ('elf1', 110),
    ('elf2', 50),
    ('elf2', 70),
    ('elf2', 90),
    ('elf2', 110),
    ('clover1', 50),
    ('clover1', 70),
    ('clover1', 90),
    ('clover2', 70),
    ('clover2', 90),
    ('clover2', 130),
    ('clover3', 50),
    ('clover3', 90),
    ('clover3', 130),
    ('pot1', 200),
    ('pot1', 200),
    ('pot2', 200),
    ('pot2', 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          Image.asset(
            'assets/images/background.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.7),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          ..._images.map((e) => _MovingImage(e.$1, width: e.$2)),
          child,
          Positioned(
            top: 30,
            child: LayoutBuilder(
              builder: (context, constraints) => Center(
                child: SizedBox(
                  width: min(650, MediaQuery.of(context).size.width * 0.8),
                  height: 90,
                  child: Image.asset('assets/images/title.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovingImage extends StatefulWidget {
  const _MovingImage(this.name, {required this.width});

  final String name;
  final double width;

  @override
  State<_MovingImage> createState() => _MovingImageState();
}

class _MovingImageState extends State<_MovingImage>
    with TickerProviderStateMixin {
  final _random = Random();
  bool _firstTime = true;

  late AnimationController _controller;
  late Animation<double> _animation;

  final maxWaitingTime = 120;
  final maxFirstWaitingTime = 15;
  final minTime = 60;
  final randomTime = 120;

  late int _duration;
  late double _direction;
  late double _horizontalStart;
  late double _horizontalEnd;
  late double _opacity;

  Future<void> _resetAnimation() async {
    _duration = _random.nextInt(randomTime) + minTime;
    _direction = _random.nextBool() ? 1 : -1;

    _horizontalStart = _random.nextDouble();
    _horizontalEnd = _random.nextDouble();
    _opacity = _random.nextDouble() * 0.3 + 0.1;

    _controller = AnimationController(
      duration: Duration(seconds: _duration),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: _direction > 0 ? -0.3 : 1.3,
      end: _direction > 0 ? 1.3 : -0.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    setState(() {});

    if (_firstTime && _random.nextBool()) {
      _controller.value = _random.nextDouble();
    } else {
      await Future.delayed(Duration(seconds: _random.nextInt(maxWaitingTime)));
    }
    _firstTime = false;

    _controller.forward();
    await Future.delayed(Duration(seconds: _duration));
    _resetAnimation();
  }

  @override
  void initState() {
    super.initState();

    _resetAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Positioned(
        top: _animation.value * MediaQuery.of(context).size.height,
        left:
            (_horizontalStart +
                _animation.value * (_horizontalEnd - _horizontalStart)) *
            MediaQuery.of(context).size.width,
        child: child!,
      ),
      child: Opacity(
        opacity: _opacity,
        child: SizedBox(
          width: widget.width,
          child: Image.asset('assets/images/${widget.name}.png'),
        ),
      ),
    );
  }
}
