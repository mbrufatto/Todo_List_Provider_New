import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static get theme => ThemeData(
        textTheme: GoogleFonts.mandaliTextTheme(),
        appBarTheme: AppBarTheme(
          color: const Color(0xff5C77CE),
          titleTextStyle: GoogleFonts.mandaliTextTheme()
              .copyWith(
                titleLarge: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
              .titleLarge,
        ),
        primaryColor: const Color(0xff5C77CE),
        primaryColorLight: const Color(0xffABC8F7),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff5C77CE),
          ),
        ),
      );
}
