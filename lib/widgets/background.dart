import 'dart:async';
import 'dart:math';

import 'package:festifocus_relais_website/managers/theme_manager.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  final List<(String, double)> _images = const [
    ('leaf1', 50),
    ('leaf1', 60),
    ('leaf2', 60),
    ('leaf2', 80),
    ('leaf3', 85),
    ('leaf3', 105),
    ('leaf3', 120),
    ('leaf4', 135),
    ('leaf4', 150),
    ('leaf5', 110),
    ('leaf5', 140),
    ('leaf6', 100),
    ('leaf7', 110),
    ('leaf8', 90),
    ('leaf9', 110),
    ('leaf9', 130),
    ('leaf10', 60),
    ('leaf10', 90),
    ('small_nut', 35),
    ('small_nut', 50),
    ('big_nut', 70),
    ('big_nut', 80),
    ('small_green', 50),
    ('small_green', 70),
    ('small_green', 90),
    ('big_green', 110),
    ('big_green', 130),
    ('big_red', 130),
    ('big_red', 150),
    ('big_red', 170),
    ('small_pink', 90),
    ('small_pink', 110),
    ('small_pink', 130),
    ('big_pink', 110),
    ('big_pink', 130),
    ('big_pink', 150),
    ('small_yellow', 80),
    ('small_yellow', 100),
    ('small_yellow', 120),
    ('big_yellow', 90),
    ('big_yellow', 110),
    ('big_yellow', 130),
  ];

  @override
  Widget build(BuildContext context) {
    return _GradientRotatingBackground(
      child: Center(
        child:
            Stack(alignment: Alignment.center, fit: StackFit.loose, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          ..._images.map((e) => _MovingImage(e.$1, width: e.$2)),
          child,
          Positioned(
            top: 30,
            child: SizedBox(
              width: min(650, MediaQuery.of(context).size.width * 0.8),
              child: Image.asset('assets/images/title.png'),
            ),
          ),
        ]),
      ),
    );
  }
}

class _GradientRotatingBackground extends StatefulWidget {
  const _GradientRotatingBackground({this.child});

  final Widget? child;

  @override
  State<_GradientRotatingBackground> createState() =>
      _GradientRotatingBackgroundState();
}

class _GradientRotatingBackgroundState
    extends State<_GradientRotatingBackground> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 60), vsync: this)
        ..repeat(reverse: true);
  late final Animation<Decoration> _animation = DecorationTween(
    begin: BoxDecoration(
        gradient: LinearGradient(
      //stops: const [0, 0.5, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomLeft,
      colors: [
        ThemeManager.instance.primaryColor,
        ThemeManager.instance.primaryColor,
        ThemeManager.instance.secondaryColor,
      ],
    )),
    end: BoxDecoration(
        gradient: LinearGradient(
      //stops: const [0, 0.5, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [
        ThemeManager.instance.primaryColor,
        ThemeManager.instance.primaryColor,
        ThemeManager.instance.secondaryColor,
      ],
    )),
  ).animate(_controller)
    ..addListener(() {
      setState(() {});
    });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _animation.value,
      width: MediaQuery.of(context).size.width,
      child: widget.child,
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
        duration: Duration(seconds: _duration), vsync: this);

    _animation = Tween<double>(
            begin: _direction > 0 ? -0.3 : 1.3,
            end: _direction > 0 ? 1.3 : -0.3)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
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
          left: (_horizontalStart +
                  _animation.value * (_horizontalEnd - _horizontalStart)) *
              MediaQuery.of(context).size.width,
          child: child!),
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
