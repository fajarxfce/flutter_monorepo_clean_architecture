import 'package:flutter/material.dart';

class DoRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String? label;
  final Widget? labelWidget;

  const DoRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.labelWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget radio = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: theme.colorScheme.primary,
    );

    if (label == null && labelWidget == null) {
      return radio;
    }

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          radio,
          if (labelWidget != null)
            labelWidget!
          else if (label != null)
            Text(label!),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
