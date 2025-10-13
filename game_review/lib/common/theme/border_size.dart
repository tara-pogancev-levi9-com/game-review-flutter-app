import 'package:flutter/material.dart';

enum BorderSize {
  xs(4),
  s(8),
  m(12),
  l(16),
  xl(20),
  xxl(24),
  infinite(999);

  final double value;
  const BorderSize(this.value);

  BorderSide get borderSide => BorderSide(width: value);
  BorderRadius get radius => BorderRadius.circular(value);
}
