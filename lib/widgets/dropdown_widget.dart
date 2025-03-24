import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/image_constant.dart';

class DropDownWidget<T> extends StatefulWidget {
  final List<T> itemList;
  final Function(T) onChanged;
  final T? selectedItem;
  final Color? borderColor;

  const DropDownWidget(
      {super.key,
      required this.itemList,
      required this.onChanged,
      this.selectedItem,
      this.borderColor});

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(24)),
        child: DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
          isExpanded: true,
          isDense: true,
          hint: widget.selectedItem != null
              ? Text(
                  _itemDisplay(widget.selectedItem ?? ""),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                )
              : null,
          items: widget.itemList.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  _itemDisplay(item),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
          value: widget.selectedItem,
          style: const TextStyle(color: Colors.black, fontSize: 15),
          onChanged: (T? value) {
            if (value != null) {
              widget.onChanged(value);
            }
          },
          buttonStyleData: const ButtonStyleData(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 0, right: 0),
          ),
          iconStyleData:
              IconStyleData(icon: SvgPicture.asset(ImageConstant.arrowDownImg)),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        )));
  }
}

String _itemDisplay(item) {
  switch (item.runtimeType) {
    case const (int):
      return (item as int).toString();

    default:
      return item.toString();
  }
}
