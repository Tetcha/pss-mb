import 'package:flutter/material.dart';
import 'package:pss_m/core/constants/style.dart';
import 'package:pss_m/core/form/title.dart';
import 'package:pss_m/interface/form/radio/radio_data.dart';

class RadioC<T> extends StatefulWidget {
  final String label;
  final List<IRadioData<T>> options;
  Function(T value)? onInputChange;
  final T? defaultValue;
  RadioC({
    super.key,
    this.label = '',
    this.options = const [],
    this.onInputChange,
    this.defaultValue,
  });

  @override
  _RadioCState<T> createState() => _RadioCState<T>(radioValue: defaultValue);
}

class _RadioCState<T> extends State<RadioC<T>> {
  T? radioValue;

  _RadioCState({this.radioValue});

  void _handleRadioValueChange(dynamic newValue) {
    widget.onInputChange!(newValue);
    setState(() {
      radioValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 5),
        FieldTitle(label: widget.label),
        const SizedBox(height: 5),
        Column(
          children: widget.options
              .map(
                (element) => Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: Radio(
                        value: element.value,
                        groupValue: radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                    ),
                    Text(
                      element.label,
                      style: TextStyle(
                        fontSize: StyleTheme.textSize,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
