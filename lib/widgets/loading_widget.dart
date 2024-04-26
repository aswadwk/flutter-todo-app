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
      // smile
      //(visible: widget.type == 0, child: _buildLoadingOne()),

      // icon
      Visibility(visible: widget.type == 0, child: _buildLoadingTwo()),

      // normal
      //Visibility(visible: widget.type == 0, child: _buildLoadingThree()),
    ]);
  }

  // Widget _buildLoadingOne() {
  //   return Stack(alignment: Alignment.center, children: [
  //     RotationTransition(
  //       alignment: Alignment.center,
  //       turns: _controller,
  //       child: Image.network(
  //         'https://raw.githubusercontent.com/xdd666t/MyData/master/pic/flutter/blog/20211101174606.png',
  //         height: 110,
  //         width: 110,
  //       ),
  //     ),
  //     Image.network(
  //       'https://raw.githubusercontent.com/xdd666t/MyData/master/pic/flutter/blog/20211101181404.png',
  //       height: 60,
  //       width: 60,
  //     ),
  //   ]);
  // }

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

  // Widget _buildLoadingThree() {
  //   return Center(
  //     child: Container(
  //       height: 120,
  //       width: 180,
  //       decoration: BoxDecoration(
  //         color: Colors.transparent,
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       alignment: Alignment.center,
  //       child: Column(mainAxisSize: MainAxisSize.min, children: [
  //         RotationTransition(
  //           alignment: Alignment.center,
  //           turns: _controller,
  //           child: Image.network(
  //             'https://raw.githubusercontent.com/xdd666t/MyData/master/pic/flutter/blog/20211101163010.png',
  //             height: 50,
  //             width: 50,
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(top: 20),
  //           child: Text('loading...'),
  //         ),
  //       ]),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
