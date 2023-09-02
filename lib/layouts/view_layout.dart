import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/space.dart';

class ViewLayout extends StatelessWidget {
  const ViewLayout({
    super.key,
    this.child,
    this.children,
    this.title,
    this.applyPadding,
  });

  final Widget? child;
  final List<Widget>? children;
  final String? title;
  final bool? applyPadding;

  EdgeInsets padding() {
    if (applyPadding != true) return EdgeInsets.zero;
    return const EdgeInsets.symmetric(vertical: 32, horizontal: 16);
  }

  AppBar? buildAppBar() {
    if (title == null) return null;
    return AppBar(
      title: Text(
        title!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: ColorResources.dark,
      elevation: 2,
      shape: const Border(
        bottom: BorderSide(
          width: 1,
          color: ColorResources.dark,
        ),
      ),
    );
  }

  Widget? buildBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorResources.backgroundGradient,
      ),
      child: ListView(
        padding: padding(),
        children: [
          //...

          Container(child: child),

          ...(children ?? []),

          const Space.vertical(120),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      backgroundColor: ColorResources.dark,
    );
  }
}
