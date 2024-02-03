import 'package:frontend/consts/consts.dart';

final GlobalKey<_LipSyncWidgetState> lipSyncWidgetKey =
    GlobalKey<_LipSyncWidgetState>();

class LipSyncWidget extends StatefulWidget {
  final List<int> imageIndices;
  final Duration totalDuration;
  final String devnagri;
  final double slowSpeed = 0.3;
  final double normalSpeed = 0.5;
  final double animationSpeed;

  const LipSyncWidget({
    Key? key,
    required this.imageIndices,
    required this.totalDuration,
    required this.devnagri,
    required this.animationSpeed,
  }) : super(key: key);

  @override
  _LipSyncWidgetState createState() => _LipSyncWidgetState();
}

class _LipSyncWidgetState extends State<LipSyncWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.totalDuration * widget.animationSpeed,
    );

    _animation = IntTween(begin: 0, end: widget.imageIndices.length - 1)
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // replayAnimation();
        // await TextToSpeech.speakText(widget.devnagri,
        //     rate: widget.animationSpeed);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          int currentIndex = _animation.value;
          int imageIndex = widget.imageIndices[currentIndex];

          return SizedBox(
              // child: SvgPicture.asset(
              //   'assets/images/lips/$imageIndex.svg',
              //   semanticsLabel: 'Lips SVG',
              //   width: 350,
              //   height: 350,
              // ),
              child: Image.asset(
            'assets/images/lips_upscaled/$imageIndex.png',
            width: 350,
            height: 350,
          ));
        },
      ),
    );
  }

  void replayAnimation() {
    _controller.reset();
    _controller.forward();
  }

  void updateAnimationSpeed(bool goSlow) {
    setState(() {
      double newSpeed = goSlow ? widget.slowSpeed : widget.normalSpeed;
      _controller.duration = widget.totalDuration * (1 / newSpeed);
      print(_controller.duration);
      _controller.forward();
    });
  }
}
