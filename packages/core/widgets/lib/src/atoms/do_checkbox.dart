import 'package:flutter/material.dart';

class DoCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final Widget? labelWidget;

  const DoCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.labelWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget checkbox = Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: theme.colorScheme.primary,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );

    if (label == null && labelWidget == null) {
      return checkbox;
    }

    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkbox,
          const SizedBox(width: 8),
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
