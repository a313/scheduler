import 'package:flutter/material.dart';

import '../core/utils/util.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: Colors.white, borderRadius: borRad08),
            child: const CircularProgressIndicator(
              color: Color(0xFF102693),
            )),
      ),
    );
  }
}
