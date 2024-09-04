import 'dart:async';
import 'package:flutter/cupertino.dart';

typedef CustomLibraryLoader = Future<void> Function();
typedef CustomDeferredWidgetBuilder = Widget Function();

class CustomDeferredWidgt extends StatefulWidget {
  final CustomLibraryLoader loader;
  final CustomDeferredWidgetBuilder build;
  const CustomDeferredWidgt({super.key, required this.loader, required this.build});

  @override
  State<CustomDeferredWidgt> createState() => _CustomDeferredWidgtState();
}

class _CustomDeferredWidgtState extends State<CustomDeferredWidgt> {
  Widget? targetWidget;

  @override
  void initState() {
    loadBuild();
    super.initState();
  }

  loadBuild() async {
    var completer = Completer();
    widget.loader().then((_) {
      completer.complete(true);
    }).catchError((e) {
      completer.complete(false);
    });

    var loaded = await completer.future;
    if (loaded) {
      setState(() {
        targetWidget = widget.build();
      });
    } else {
      loadBuild();
    }
  }

  @override
  Widget build(BuildContext context) {
    return targetWidget ?? placeholderWidget();
  }

  Widget placeholderWidget() {
    return Container(alignment: Alignment.center, child: const CupertinoActivityIndicator());
  }
}
