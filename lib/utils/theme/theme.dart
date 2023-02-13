import 'package:flutter/material.dart';

class DIAppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      // primarySwatch: MaterialColor(0xFF215cd4, <int, Color>{
      //   50: Color(0xFFe8effc),
      //   100: Color(0xFFd1e0fa),
      //   200: Color(0xFFbbd0f6),
      //   300: Color(0xFFa4c0f2),
      //   400: Color(0xFF8eb0ee),
      //   500: Color(0xFF79a0ea),
      //   600: Color(0xFF6390e5),
      //   700: Color(0xFF4e7fe0),
      //   800: Color(0xFF386eda),
      //   900: Color(0xFF215cd4),
      // })
      );
  static ThemeData darkTheme = ThemeData(
     brightness: Brightness.dark,
  );
}
