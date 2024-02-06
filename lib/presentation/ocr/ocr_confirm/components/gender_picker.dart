import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_input.dart';

class GenderPicker extends StatefulWidget {
  const GenderPicker({
    super.key,
    required this.isRequired,
    required this.option,
    this.initIndex = 0,
    required this.title,
    this.enable = true,
    required this.onChanged,
  });
  final bool isRequired;
  final String title;
  final bool enable;
  final List<String> option;
  final int initIndex;
  final Function(String value) onChanged;

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  String? selected;
  @override
  void initState() {
    selected = widget.option[widget.initIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: Stack(
        children: [
          IgnorePointer(
            ignoring: true,
            child: BaseTextField(
              key: UniqueKey(),
              labelText: 'Giới tính',
              enabled: widget.enable,
              initialValue: selected,
              suffix: const IconButton(
                  onPressed: null, icon: Icon(Icons.arrow_drop_down)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
            child: DropdownButton<String>(
                isExpanded: true,
                icon: const Icon(Icons.nat),
                iconSize: 0,
                iconDisabledColor: Colors.black,
                iconEnabledColor: Colors.green,
                underline: const SizedBox(),
                value: selected,
                selectedItemBuilder: (context) =>
                    widget.option.map<Widget>((e) => const SizedBox()).toList(),
                items: widget.option.map((val) {
                  return DropdownMenuItem(
                      value: val,
                      child: Text(val,
                          style: widget.enable && val == selected
                              ? AppFonts.pMedium
                                  .copyWith(color: context.neutral1100)
                              : AppFonts.pMedium
                                  .copyWith(color: context.neutral700)));
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    selected = value;
                    widget.onChanged(value);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
