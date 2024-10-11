import 'package:flutter/material.dart';

class AnimatedGradBorder extends StatefulWidget {
  const AnimatedGradBorder({Key? key}) : super(key: key);

  @override
  State<AnimatedGradBorder> createState() => _AnimatedGradBorderState();
}

class _AnimatedGradBorderState extends State<AnimatedGradBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _tlAlignAnim;
  late Animation<Alignment> _brAlignAnim;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _tlAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1)
    ]).animate(_controller);
    _brAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1)
    ]).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CenterCutPath(radius: 20, thickness: 2),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _tlAlignAnim.value,
                end: _brAlignAnim.value,
                colors: [
                  Colors.red,
                  Colors.blue,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CenterCutPath extends CustomClipper<Path> {
  final double radius;
  final double thickness;

  _CenterCutPath({required this.radius, required this.thickness});

  @override
  getClip(Size size) {
    final rect =
        Rect.fromLTRB(size.width, size.width, size.width * 2, size.height * 2);
    final double width = size.width - thickness * 2;
    final double height = size.height - thickness * 2;
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(thickness, thickness, width, height),
          Radius.circular(radius - thickness),
        ),
      )
      ..addRect(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
