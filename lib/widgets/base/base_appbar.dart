// import 'dart:io';

// import 'package:flutter/material.dart';

// class BaseDesktopAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final Color? backgroundColor;
//   final double? elevation;
//   final List<Widget>? actions;
//   final bool? centerTitle;
//   final Widget title;
//   final Widget? leading;
//   final double? height;

//   const BaseDesktopAppbar({
//     super.key,
//     this.backgroundColor,
//     this.elevation,
//     this.actions,
//     required this.title,
//     this.centerTitle,
//     this.leading,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isWindows) {
//       return WindowTitleBarBox(
//         child: MoveWindow(
//           child: Row(
//             children: [
//               leading ??
//                   (Navigator.of(context).canPop()
//                       ? const BackButton()
//                       : const SizedBox()),
//               Expanded(child: title),
//               MinimizeWindowButton(animate: true),
//               MaxOrRestoreWindowButton(animate: true),
//               CloseWindowButton(animate: true),
//             ],
//           ),
//         ),
//       );
//     } else if (Platform.isMacOS) {
//       return const SizedBox();
//     }
//     return const SizedBox();
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
// }

// class MaxOrRestoreWindowButton extends WindowButton {
//   MaxOrRestoreWindowButton(
//       {super.key, super.colors, VoidCallback? onPressed, bool? animate})
//       : super(
//             animate: animate ?? false,
//             iconBuilder: (buttonContext) => appWindow.isMaximized
//                 ? RestoreIcon(color: buttonContext.iconColor)
//                 : MaximizeIcon(color: buttonContext.iconColor),
//             onPressed: onPressed ?? () => appWindow.maximizeOrRestore());
// }
