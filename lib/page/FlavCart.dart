import 'package:flutter/material.dart';

class AnimaPositioned extends StatefulWidget {
  final Widget child;
  final bool show;
  final Offset offset;
  final Size size;
  final double defferentX;
  final double defferentY;
  final double yOffset;
  final AnimationFinshCallBack callBack;

  AnimaPositioned({
    this.child,
    this.defferentX,
    this.defferentY,
    this.offset,
    this.show,
    this.size,
    this.yOffset,
    this.callBack,
  });

  @override
  State<StatefulWidget> createState() => AnimaPositionedState();
}

class AnimaPositionedState extends State<AnimaPositioned>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  Widget build(BuildContext context) => _getRootWidget();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          widget.callBack(widget);
        }
      });
    var widgetsbinding = WidgetsBinding.instance;
    widgetsbinding.addPostFrameCallback((callback) {
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(AnimaPositioned oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget _getRootWidget() {
    return Positioned(
      top: _getOffset().dy -
          widget.yOffset +
          widget.defferentY * (1 - _animation.value),
      // top: _getOffset().dy + widget.defferentY * (1 - _animation.value),
      left: _getOffset().dx + widget.defferentX * (1 - _animation.value),
      height: _getSize().height * _animation.value,
      width: _getSize().width * _animation.value,
      child: Opacity(
        opacity: _animation.value,
        child: widget.child,
      ),
    );
  }

  Offset _getOffset() {
    if (widget.offset != null) {
      // print(widget.offset.dy);
      return widget.offset;
    } else {
      return Offset(0, 0);
    }
  }

  Size _getSize() {
    if (widget.size != null) {
      return widget.size;
    } else {
      return Size(0, 0);
    }
  }
}

class ItemChildWidget<T> extends StatelessWidget {
  final int position;
  final Widget child;
  final ItemClickCallBack callBack;

  ItemChildWidget({this.position, this.child, this.callBack});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getItemChildWidget(context);
  }

  Widget _getItemChildWidget(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        RenderBox box = context.findRenderObject();
        callBack(box);
      },
    );
  }
}

typedef ItemClickCallBack = void Function(RenderBox box);
typedef AnimationFinshCallBack = void Function(Widget parent);
