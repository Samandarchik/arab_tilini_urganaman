// import 'package:flutter/material.dart';

// class FontSizeInherited extends InheritedWidget {
//   final double fontSize;
//   final Function(double) onFontSizeChanged;

//   const FontSizeInherited({
//     Key? key,
//     required this.fontSize,
//     required this.onFontSizeChanged,
//     required Widget child,
//   }) : super(key: key, child: child);

//   static FontSizeInherited of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<FontSizeInherited>()!;
//   }

//   @override
//   bool updateShouldNotify(covariant FontSizeInherited oldWidget) {
//     return oldWidget.fontSize != fontSize;
//   }
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double _fontSize = 24.0;

//   void _updateFontSize(double newSize) {
//     setState(() {
//       _fontSize = newSize;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FontSizeInherited(
//       fontSize: _fontSize,
//       onFontSizeChanged: _updateFontSize,
//       child: Scaffold(
//         appBar: AppBar(title: Text('Text Size Changer')),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(child: PageOne()),
//             Expanded(child: PageTwo()),
//             Expanded(child: PageThree()),
//             Slider(
//               min: 10,
//               max: 50,
//               value: _fontSize,
//               onChanged: _updateFontSize,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final fontSize = FontSizeInherited.of(context).fontSize;
//     return Center(child: Text('Page One', style: fontSize.bold));
//   }
// }

// class PageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final fontSize = FontSizeInherited.of(context).fontSize;
//     return Center(child: Text('Page Two', style: fontSize.blue));
//   }
// }

// class PageThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final fontSize = FontSizeInherited.of(context).fontSize;
//     return Center(child: Text('Page Three', style: fontSize.redItalic));
//   }
// }
