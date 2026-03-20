import 'package:flutter/material.dart';
import '../atoms/do_text.dart';

class DoDropdown<T> extends StatelessWidget {
  final String label;
  final T? initialValue;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? hint;
  final String? errorText;

  const DoDropdown({
    super.key,
    required this.label,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.hint,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoText(label, variant: DoTextVariant.body, fontWeight: FontWeight.w600),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          initialValue: initialValue,
          items: items,
          onChanged: onChanged,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            hintStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          dropdownColor: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}
