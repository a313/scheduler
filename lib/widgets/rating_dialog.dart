// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:gimo/api/api_manager.dart';
// import 'package:gimo/widgets/rating_dialog.dart';
// import 'package:in_app_review/in_app_review.dart';
//
// import '../utils/constants.dart';
//
// export 'package:flutter_rating_bar/src/rating_bar.dart';
//
// @Deprecated('Remove on refactor version')
// Future showRatingDialog(BuildContext context) {
//   return showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context) => const RatingDialog(),
//   );
// }
//
// class RatingDialog extends StatefulWidget {
//   const RatingDialog({Key? key}) : super(key: key);
//
//   @override
//   State<RatingDialog> createState() => _RatingDialogState();
// }
//
// class _RatingDialogState extends State<RatingDialog>
//     with TickerProviderStateMixin {
//   double point = 5;
//   final InAppReview inAppReview = InAppReview.instance;
//   late AnimationController _animationController;
//   TextEditingController textController = TextEditingController();
//   String comment = "";
//
//   List<String> option = ["Phí giao dịch cao", "App khó sử dụng"];
//   int selectionValue = 0;
//
//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 50),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(
//                   "Bạn đánh giá trải nghiệm nhận lương với GIMO như thế nào?",
//                   textAlign: TextAlign.center,
//                   style: body.copyWith(color: black1),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               RatingBar.builder(
//                 initialRating: point,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: false,
//                 itemCount: 5,
//                 itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star,
//                   color: colorSecondary01,
//                 ),
//                 updateOnDrag: true,
//                 onRatingUpdate: (rating) {
//                   setState(() {
//                     point = rating;
//                     if (point <= 3) {
//                       _animationController.forward();
//                     }
//                   });
//                 },
//               ),
//               const SizedBox(height: 10),
//               // Text(
//               //   "Chấm điểm: $point",
//               //   textAlign: TextAlign.center,
//               //   style: body.copyWith(color: black1),
//               // ),
//               _buildReviewOption(),
//               Container(
//                 constraints: const BoxConstraints.expand(
//                     height: 1, width: double.infinity),
//                 color: const Color(0xFF697182).withOpacity(0.2),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Text(
//                           "str_cancel".tr(),
//                           style: buttonStyle1,
//                           textAlign: TextAlign.center,
//                         )),
//                   ),
//                   Container(
//                     constraints:
//                         const BoxConstraints.expand(height: 50, width: 1),
//                     color: const Color(0xFF697182).withOpacity(0.2),
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                         onTap: () {
//                           ///Call api gửi lại thông tin đánh giá về server
//                           if (point <= 3) {
//                             comment = selectionValue == 2
//                                 ? textController.text
//                                 : option[selectionValue];
//                           } else {
//                             comment = "";
//                           }
//                           ApiManager().sendRatingData(point, comment);
//
//                           Navigator.of(context).pop();
//                           if (point >= 4) {
//                             openInAppReview();
//                           }
//                         },
//                         child: Text(
//                           "Gửi",
//                           textAlign: TextAlign.center,
//                           style: buttonStyle1,
//                         )),
//                   ),
//                 ],
//               ),
//               // InkWell(
//               //   onTap: () {
//               //     ///Call api gửi lại thông tin đánh giá về server
//               //     if (point <= 3) {
//               //       comment = selectionValue == 2
//               //           ? textController.text
//               //           : option[selectionValue];
//               //     } else {
//               //       comment = "";
//               //     }
//               //     ApiManager().sendRatingData(point, comment);
//               //
//               //     Navigator.of(context).pop();
//               //     if (point >= 4) {
//               //       openInAppReview();
//               //     }
//               //   },
//               //   child: Container(
//               //     constraints:
//               //         BoxConstraints.expand(height: 50, width: double.infinity),
//               //     child: Center(
//               //       child: Text(
//               //         "Gửi đánh giá",
//               //         style: buttonStyle1,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReviewOption() {
//     return AnimatedSize(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.fastOutSlowIn,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: point > 3
//             ? null
//             : FadeTransition(
//                 opacity: _animationController,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: primaryColor,
//                           visualDensity:
//                               const VisualDensity(horizontal: 0, vertical: -3),
//                           value: 0,
//                           groupValue: selectionValue,
//                           onChanged: (value) {
//                             setState(() {
//                               selectionValue = 0;
//                               comment = option[0];
//                             });
//                           },
//                         ),
//                         Text(option[0])
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: primaryColor,
//                           visualDensity:
//                               const VisualDensity(horizontal: 0, vertical: -3),
//                           value: 1,
//                           groupValue: selectionValue,
//                           onChanged: (value) {
//                             setState(() {
//                               selectionValue = 1;
//                               comment = option[1];
//                             });
//                           },
//                         ),
//                         Text(option[1])
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: primaryColor,
//                           visualDensity:
//                               const VisualDensity(horizontal: 0, vertical: -3),
//                           value: 2,
//                           groupValue: selectionValue,
//                           onChanged: (value) {
//                             setState(() {
//                               selectionValue = 2;
//                               comment = "";
//                             });
//                           },
//                         ),
//                         const Text("Khác")
//                       ],
//                     ),
//                     if (selectionValue == 2)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8),
//                         child: TextFormField(
//                           controller: textController,
//                           autofocus: selectionValue == 2,
//                           cursorColor: primaryColor.withOpacity(0.5),
//                           maxLines: 2,
//                           maxLength: 100,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(
//                                 width: 1.5,
//                                 color: primaryColor,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(
//                                 width: 1.5,
//                                 color: primaryColor,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(
//                                 width: 1.5,
//                                 color: primaryColor,
//                               ),
//                             ),
//                             floatingLabelBehavior: FloatingLabelBehavior.auto,
//                             label: Text(
//                               "Đánh giá",
//                               style: body.copyWith(
//                                 color: primaryColor,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             labelStyle: body.copyWith(
//                               color: primaryColor,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             alignLabelWithHint: true,
//                             hintText: "Hãy cho GIMO biết suy nghĩ của bạn",
//                             hintStyle: const TextStyle(
//                                 color: hintInputColor, fontSize: 14),
//                           ),
//                           textAlign: TextAlign.start,
//                           keyboardType: TextInputType.text,
//                         ),
//                       ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
//
//   void openInAppReview() async {
//     if (await inAppReview.isAvailable()) {
//       inAppReview.requestReview();
//     }
//   }
// }
