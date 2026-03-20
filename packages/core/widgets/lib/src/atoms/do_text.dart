import 'package:flutter/material.dart';

enum DoTextVariant { h1, h2, h3, body, caption, overline }

class DoText extends StatelessWidget {
  final String text;
  final DoTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const DoText(
    this.text, {
    super.key,
    this.variant = DoTextVariant.body,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
  });

  TextStyle _getStyle(BuildContext context) {
    final theme = Theme.of(context);

    switch (variant) {
      case DoTextVariant.h1:
        return theme.textTheme.headlineLarge?.copyWith(
              fontWeight: fontWeight ?? FontWeight.bold,
              color: color ?? theme.colorScheme.onSurface,
            ) ??
            TextStyle(
              fontSize: 32,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: color ?? theme.colorScheme.onSurface,
            );
      case DoTextVariant.h2:
        return theme.textTheme.headlineMedium?.copyWith(
              fontWeight: fontWeight ?? FontWeight.bold,
              color: color ?? theme.colorScheme.onSurface,
            ) ??
            TextStyle(
              fontSize: 24,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: color ?? theme.colorScheme.onSurface,
            );
      case DoTextVariant.h3:
        return theme.textTheme.titleLarge?.copyWith(
              fontWeight: fontWeight ?? FontWeight.w600,
              color: color ?? theme.colorScheme.onSurface,
            ) ??
            TextStyle(
              fontSize: 18,
              fontWeight: fontWeight ?? FontWeight.w600,
              color: color ?? theme.colorScheme.onSurface,
            );
      case DoTextVariant.body:
        return theme.textTheme.bodyMedium?.copyWith(
              fontWeight: fontWeight,
              color: color ?? theme.colorScheme.onSurface,
            ) ??
            TextStyle(
              fontSize: 14,
              fontWeight: fontWeight,
              color: color ?? theme.colorScheme.onSurface,
            );
      case DoTextVariant.caption:
        return theme.textTheme.bodySmall?.copyWith(
              fontWeight: fontWeight,
              color:
                  color ?? theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ) ??
            TextStyle(
              fontSize: 12,
              fontWeight: fontWeight,
              color:
                  color ?? theme.colorScheme.onSurface.withValues(alpha: 0.7),
            );
      case DoTextVariant.overline:
        return theme.textTheme.labelSmall?.copyWith(
              fontWeight: fontWeight ?? FontWeight.bold,
              letterSpacing: 1.5,
              color:
                  color ?? theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ) ??
            TextStyle(
              fontSize: 10,
              fontWeight: fontWeight ?? FontWeight.bold,
              letterSpacing: 1.5,
              color:
                  color ?? theme.colorScheme.onSurface.withValues(alpha: 0.5),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getStyle(context),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
