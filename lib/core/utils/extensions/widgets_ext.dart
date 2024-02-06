import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  ColoredBox coloredBox({Color? color}) {
    return ColoredBox(
      color: color ?? Colors.red.withOpacity(0.5),
      child: this,
    );
  }

  Expanded expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  SizedBox size({double? w, double? h}) {
    return SizedBox(width: w, height: h, child: this);
  }

  Widget disable({bool isDisable = true}) {
    if (isDisable) {
      return ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.color),
          child: this);
    } else {
      return this;
    }
  }

  DebugSizeWidget debugSize() => DebugSizeWidget(child: this);
}

extension ListExt on List {
  void addSeparated({required Function(int index) separated}) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, separated(i - 1));
    }
  }
}

class DebugSizeWidget extends StatefulWidget {
  const DebugSizeWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<DebugSizeWidget> createState() => _DebugSizeWidgetState();
}

class _DebugSizeWidgetState extends State<DebugSizeWidget> {
  final GlobalKey _key = GlobalKey();
  Size size = Size.zero;

  @override
  void initState() {
    super.initState();
  }

  getSizeAndPosition() {
    final cardBox = _key.currentContext?.findRenderObject();
    size = (cardBox as RenderBox).size;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
    return Stack(
      key: UniqueKey(),
      alignment: Alignment.bottomRight,
      children: [
        Container(
          key: _key,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.red,
            strokeAlign: BorderSide.strokeAlignOutside,
          )),
          child: widget.child,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'w:${size.width}\nh:${size.height}\nar:${size.width / size.height}',
            style: const TextStyle(fontSize: 10, color: Colors.white),
            textAlign: TextAlign.right,
          ),
        ).coloredBox(color: Colors.black),
      ],
    );
  }
}
