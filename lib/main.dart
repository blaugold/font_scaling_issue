import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

const double scale = 15;
const double fontSize = 120;
const String fontFamily = 'Ahem';
// const String fontFamily = 'Roboto_regular';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          const Center(
            // Paints text with font size 120 unscaled.
            child: DemoText(
              color: Colors.green,
              scale: 1,
            ),
          ),
          Center(
            // Paints text with font size 120 / 15 = 8 but scaled up by 15.
            child: Transform.scale(
              scale: scale,
              child: const DemoText(
                color: Colors.red,
                scale: 1 / scale,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DemoText extends StatelessWidget {
  const DemoText({
    super.key,
    required this.color,
    required this.scale,
  });

  final Color color;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final color = this.color.withOpacity(.5);
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 1 * scale,
        ),
      ),
      child: Text(
        'Test',
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize * scale,
          height: 1,
          color: color,
        ),
      ),
    );
  }
}
