import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key, this.type = 0}) : super(key: key);

  final int type;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      value: 100,
      duration: const Duration(milliseconds: 1000),
      upperBound: 10.0,
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // icon
      Visibility(visible: widget.type == 0, child: _buildLoadingTwo()),
    ]);
  }

  Widget _buildLoadingTwo() {
    return Center(
      child: Stack(alignment: Alignment.center, children: [
        Image.asset(
          "assets/images/loading.gif",
          height: 300,
          width: 100,
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
