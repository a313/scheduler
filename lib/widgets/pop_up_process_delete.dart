// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:scheduler/core/utils/extensions/build_context.dart';
// import 'package:gimo/utils/constants.dart';
// import 'package:gimo/utils/preferences.dart';
// import 'package:gimo/utils/size_config.dart';

// import '../clean_architecture/core/utils/constants/sized_boxs.dart';
// import '../clean_architecture/theme/app_fonts.dart';

// @Deprecated('Remove on refactor version')
// Future showPopUpProcessDelete(BuildContext context) {
//   savePopupState(true);
//   return showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context) => const GalleryPermissionDialog(),
//   );
// }

// class GalleryPermissionDialog extends StatelessWidget {
//   const GalleryPermissionDialog({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 0.0,
//       backgroundColor: Colors.transparent,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [
//                 sizedBoxH20,
//                 SvgPicture.asset(
//                   "assets/svg/ic_di_waiting.svg",
//                   height: 88,
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(22)),
//                 const Text(
//                   "GIMO đang xử lý yêu cầu của bạn, bạn chờ chút nhé!",
//                   style: AppFonts.h500,
//                   textAlign: TextAlign.center,
//                 ),
//                 sizedBoxH32,
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     decoration: BoxDecoration(
//                       color: colorSecondary01,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "str_close".tr(),
//                         style:
//                             AppFonts.h400.copyWith(color: context.neutral100),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
