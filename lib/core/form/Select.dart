import 'package:flutter/material.dart';
import 'package:pss_m/interface/form/select/select_data.dart';

class SelectC extends StatefulWidget {
  late List<ISelectItem> selectData;
  late dynamic defaultValue;
  late Function? onChange;
  SelectC({
    super.key,
    this.selectData = const [],
    this.defaultValue,
    this.onChange,
  });

  @override
  State<SelectC> createState() => _SelectCState();
}

class _SelectCState extends State<SelectC> {
  dynamic selectedItem = null;
  @override
  Widget build(BuildContext context) {
    dynamic value;

    if (selectedItem != null) {
      value = selectedItem;
    } else if (widget.defaultValue != null) {
      value = widget.defaultValue;
    } else {
      value = widget.selectData[0].value;
    }

    return FormField(builder: (FormFieldState state) {
      return InputDecorator(
        decoration: InputDecoration(
          errorText: state.hasError ? state.errorText : null,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: value,
            isDense: true,
            onChanged: (dynamic newValue) {
              setState(() {
                selectedItem = newValue;
                widget.onChange!(newValue);
              });
            },
            items: widget.selectData.map((ISelectItem value) {
              return DropdownMenuItem(
                value: value.value,
                child: Text(value.label),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
