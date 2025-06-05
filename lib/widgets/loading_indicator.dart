import 'package:flutter/material.dart';

import '../core/utils/util.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
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
