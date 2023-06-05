// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:gimo/utils/constants.dart';
// import 'package:gimo/utils/size_config.dart';

// @Deprecated('Remove on refactor version')
// Future showPopUpNotification(BuildContext context, String type, String message,
//     String? bio, VoidCallback onConfirm) {
//   return showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => ConfirmDialog(
//             type: type,
//             message: message,
//             bioType: bio,
//             onConfirm: onConfirm,
//           ));
// }

// class ConfirmDialog extends StatelessWidget {
//   final String? message, bioType;
//   final VoidCallback? onConfirm;
//   final String? type;

//   const ConfirmDialog({
//     Key? key,
//     this.message,
//     this.onConfirm,
//     this.type,
//     this.bioType,
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
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//             child: Image.asset(
//               type == DISBURSED
//                   ? "assets/pop_up_success.png"
//                   : type == CANCEL
//                       ? "assets/pop_up_denied.png"
//                       : "assets/pop_up_biometric.png",
//               height: getProportionateScreenHeight(105),
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(16),
//                   bottomRight: Radius.circular(16)),
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: getProportionateScreenHeight(22)),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: getProportionateScreenWidth(24)),
//                   child: Column(
//                     children: [
//                       Text(
//                         type == DISBURSED
//                             ? "str_disbursed_success".tr()
//                             : type == CANCEL
//                                 ? "str_disbursed_cancel".tr()
//                                 : "str_active_biometric"
//                                     .tr()
//                                     .replaceAll("replace_bio", bioType!),
//                         style: title3.copyWith(color: black),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: getProportionateScreenHeight(16)),
//                       Text(
//                         message!,
//                         textAlign: TextAlign.start,
//                         style: caption4.copyWith(fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(16)),
//                 Divider(
//                   color: bodyColorGray.withOpacity(0.2),
//                   thickness: 1.0,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     onConfirm!();
//                   },
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 5, bottom: 13),
//                       child: Text(
//                         "str_close".tr(),
//                         style: buttonStyle1,
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
