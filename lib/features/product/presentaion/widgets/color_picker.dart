import 'package:crafy_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChanged});

  final List<String> colors;
  final Function(String) onChanged;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String color in widget.colors)
          GestureDetector(
            onTap: () {
              _selectedColor = color;
              widget.onChanged(_selectedColor!);
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                color: _selectedColor == color ? AppColors.themeColor : null,
              ),
              child: Text(
                color,
                style: TextStyle(
                  color: _selectedColor == color ? Colors.white : null,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
