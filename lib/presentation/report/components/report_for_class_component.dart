// import 'package:flutter/material.dart';
// import 'package:flutter_sticky_header/flutter_sticky_header.dart';
// import 'package:get/get.dart';
// import 'package:scheduler/core/utils/util.dart';
// import 'package:scheduler/data/models/report_for_class.dart';
// import 'package:scheduler/data/models/student.dart';
// import 'package:scheduler/presentation/report/group_by_student/report_for_class_header.dart';
// import 'package:scheduler/theme/app_fonts.dart';
// import 'package:scheduler/widgets/custom_divider.dart';

// import '../../../data/models/event.dart';
// import '../../../widgets/local_avatar.dart';

// class ReportForClassComponent extends StatefulWidget {
//   const ReportForClassComponent({
//     super.key,
//     required this.data,
//     this.onTapped,
//   });
//   final ReportForClass data;
//   final Function(ReportForClass data)? onTapped;

//   @override
//   State<ReportForClassComponent> createState() =>
//       _ReportForClassComponentState();
// }

// class _ReportForClassComponentState extends State<ReportForClassComponent> {
//   bool isShowChildren = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = widget.data;
//     return SliverStickyHeader.builder(
//       builder: (context, state) => ReportForClassHeader(
//         data: data,
//         isShowChildren: isShowChildren,
//         onToggle: (isShow) {
//           setState(() {
//             isShowChildren = isShow;
//           });
//         },
//       ),
//       sliver: isShowChildren
//           ? SliverList.separated(
//               itemCount: data.data.keys.length,
//               itemBuilder: (context, index) {
//                 final key = data.data.keys.elementAt(index);
//                 final events = data.data[key]!;
//                 return _ReportStudentComponent(student: key, data: events);
//               },
//               separatorBuilder: (context, index) => const CustomDivider(),
//             )
//           : const SliverToBoxAdapter(
//               child: SizedBox(height: 1),
//             ),
//     );
//   }
// }

// class _ReportStudentComponent extends StatelessWidget {
//   const _ReportStudentComponent({
//     required this.data,
//     required this.student,
//   });
//   final Student student;
//   final List<Event> data;

//   @override
//   Widget build(BuildContext context) {
//     final children = List<Widget>.generate(
//         data.length, (index) => _ReportForStudent(student: student, data: data))
//       ..addSeparated(
//           separated: (index) => const CustomDivider().paddingOnly(left: 80));

//     return Column(children: children);
//   }
// }

// class _ReportForStudent extends StatefulWidget {
//   const _ReportForStudent({
//     required this.student,
//     required this.data,
//     // ignore: unused_element
//     this.onTapped,
//   });
//   final Student student;
//   final List<Event> data;
//   final Function(Student student)? onTapped;

//   @override
//   State<_ReportForStudent> createState() => __ReportForStudentState();
// }

// class __ReportForStudentState extends State<_ReportForStudent> {
//   bool isShowChildren = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(widget.student.name);
//   }
// }

// class StudentHeader extends StatelessWidget {
//   final Student student;
//   final List<Event> data;
//   final bool isShowChildren;
//   final Function(bool isShow)? onToggle;

//   const StudentHeader(
//       {super.key,
//       required this.data,
//       required this.isShowChildren,
//       this.onToggle,
//       required this.student});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       // onTap: () => onTapped?.call(data),
//       child: Container(
//         padding: padSymHor12,
//         decoration: BoxDecoration(
//             border: Border(bottom: BorderSide(color: context.neutral500)),
//             color: context.neutral100),
//         child: Row(
//           children: [
//             LocalAvatar(
//               path: student.image,
//               size: 32,
//               name: student.name,
//             ),
//             sizedBoxW12,
//             Expanded(
//               child: Text(
//                 student.name,
//                 style: AppFonts.h500,
//               ),
//             ),
//             const Text(
//               'data.getFormula',
//               style: AppFonts.bMedium,
//             ),
//             IconButton(
//                 onPressed: () => onToggle?.call(!isShowChildren),
//                 icon: isShowChildren
//                     ? const Icon(Icons.keyboard_double_arrow_up)
//                     : const Icon(Icons.keyboard_double_arrow_down)),
//           ],
//         ),
//       ),
//     );
//   }
// }
