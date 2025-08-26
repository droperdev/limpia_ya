import 'package:flutter/material.dart';

class PriceRangePicker extends StatefulWidget {
  const PriceRangePicker({super.key});

  @override
  State<PriceRangePicker> createState() => _PriceRangePickerState();
}

class _PriceRangePickerState extends State<PriceRangePicker> {
  static const double kMin = 0;
  static const double kMax = 1000;

  RangeValues values = const RangeValues(120, 500);

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF38B000);
    const trackBg = Color(0xFFEDEFF6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 72,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                top: 22,
                bottom: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(24, (i) {
                    final h = (i % 5 == 0) ? 20.0 : (8.0 + (i % 3) * 4);
                    return Container(
                      width: 3,
                      height: h,
                      decoration: BoxDecoration(
                        color: trackBg,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }),
                ),
              ),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(height: 3, color: trackBg),
                ),
              ),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 3,
                  activeTrackColor: green,
                  inactiveTrackColor: Colors.transparent,

                  rangeThumbShape: _OutlinedThumb(
                    radius: 14,
                    borderColor: green,
                  ),
                  thumbColor: Colors.white,

                  showValueIndicator: ShowValueIndicator.never,
                ),
                child: RangeSlider(
                  min: kMin,
                  max: kMax,
                  values: values,
                  onChanged: (v) => setState(() => values = v),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _PriceBox(label: 'Precio minimo', value: values.start),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _PriceBox(label: 'Precio maximo', value: values.end),
            ),
          ],
        ),
      ],
    );
  }
}

class _OutlinedThumb extends RangeSliderThumbShape {
  final double radius;
  final Color borderColor;
  const _OutlinedThumb({required this.radius, required this.borderColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(radius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = true,
    bool? isOnTop,
    bool? isPressed,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
  }) {
    final canvas = context.canvas;
    final paintFill = Paint()..color = Colors.white;
    final paintBorder = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = borderColor;

    canvas.drawCircle(center, radius, paintFill);
    canvas.drawCircle(center, radius, paintBorder);
  }
}

class _PriceBox extends StatelessWidget {
  final String label;
  final double value;
  const _PriceBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '\S/ ${value.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
