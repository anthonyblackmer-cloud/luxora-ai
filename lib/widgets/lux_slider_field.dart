import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Slider with visible min/max, live value, and direct numeric entry.
class LuxSliderField extends StatefulWidget {
  const LuxSliderField({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.divisions,
    this.prefix,
    this.suffix,
    this.isInteger = true,
    this.formatDisplay,
    this.inputWidth = 112,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final int? divisions;
  final String? prefix;
  final String? suffix;
  final bool isInteger;
  final String Function(double value)? formatDisplay;
  final double inputWidth;

  @override
  State<LuxSliderField> createState() => _LuxSliderFieldState();
}

class _LuxSliderFieldState extends State<LuxSliderField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController(text: _editableText(widget.value));
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(LuxSliderField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focusNode.hasFocus && oldWidget.value != widget.value) {
      _controller.text = _editableText(widget.value);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _commitText(_controller.text);
    }
  }

  String _editableText(double value) {
    final clamped = _clamp(value);
    if (widget.isInteger) {
      return clamped.round().toString();
    }
    return clamped.toStringAsFixed(1);
  }

  String _format(double value) {
    if (widget.formatDisplay != null) {
      return widget.formatDisplay!(value);
    }
    final core = widget.isInteger
        ? value.round().toString()
        : value.toStringAsFixed(0);
    return '${widget.prefix ?? ''}$core${widget.suffix ?? ''}';
  }

  double _clamp(double value) => value.clamp(widget.min, widget.max);

  void _commitText(String raw) {
    final parsed = _parse(raw);
    if (parsed == null) {
      _controller.text = _editableText(widget.value);
      return;
    }
    final next = _clamp(parsed);
    widget.onChanged(next);
    _controller.text = _editableText(next);
  }

  double? _parse(String raw) {
    final cleaned = raw
        .trim()
        .replaceAll(RegExp(r'[^\d.]'), '');
    if (cleaned.isEmpty) {
      return null;
    }
    return double.tryParse(cleaned);
  }

  @override
  Widget build(BuildContext context) {
    final clamped = _clamp(widget.value);
    final dec = _inputDecoration();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color: LuxColors.stone400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _format(clamped),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: widget.inputWidth,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
                  ],
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: dec.copyWith(
                    hintText: _editableText(clamped),
                    prefixText: widget.prefix,
                    suffixText: widget.suffix,
                  ),
                  onSubmitted: _commitText,
                  onEditingComplete: () => _commitText(_controller.text),
                ),
              ),
            ],
          ),
          Slider(
            value: clamped,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            activeColor: LuxColors.gold,
            inactiveColor: Colors.white.withValues(alpha: 0.12),
            onChanged: (v) {
              widget.onChanged(v);
              if (!_focusNode.hasFocus) {
                _controller.text = _editableText(v);
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _format(widget.min),
                style: TextStyle(
                  fontSize: 12,
                  color: LuxColors.stone500.withValues(alpha: 0.95),
                ),
              ),
              Text(
                _format(widget.max),
                style: TextStyle(
                  fontSize: 12,
                  color: LuxColors.stone500.withValues(alpha: 0.95),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.06),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: LuxColors.gold.withValues(alpha: 0.55)),
      ),
    );
  }
}

String luxFormatUsd(int amount) {
  final negative = amount < 0;
  final s = amount.abs().toString();
  final buf = StringBuffer(negative ? '-\$' : '\$');
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) {
      buf.write(',');
    }
    buf.write(s[i]);
  }
  return buf.toString();
}
