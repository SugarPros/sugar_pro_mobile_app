// ignore_for_file: deprecated_member_use

import 'package:sugar_pros/core/utils/exports.dart';

class RemoveGlow extends StatelessWidget {
  final Widget child;

  const RemoveGlow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
