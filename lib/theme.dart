import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff644abc),
      surfaceTint: Color(0xff644abc),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffad97ff),
      onPrimaryContainer: Color(0xff1f0060),
      secondary: Color(0xff625885),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdcd1ff),
      onSecondaryContainer: Color(0xff443b66),
      tertiary: Color(0xff9c377d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff27fca),
      onTertiaryContainer: Color(0xff3b002d),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffdf7ff),
      onSurface: Color(0xff1c1b22),
      onSurfaceVariant: Color(0xff484552),
      outline: Color(0xff797584),
      outlineVariant: Color(0xffcac4d5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff312f37),
      inversePrimary: Color(0xffccbeff),
      primaryFixed: Color(0xffe7deff),
      onPrimaryFixed: Color(0xff1f0060),
      primaryFixedDim: Color(0xffccbeff),
      onPrimaryFixedVariant: Color(0xff4c2fa3),
      secondaryFixed: Color(0xffe7deff),
      onSecondaryFixed: Color(0xff1e143e),
      secondaryFixedDim: Color(0xffcbbff3),
      onSecondaryFixedVariant: Color(0xff4a406c),
      tertiaryFixed: Color(0xffffd8ec),
      onTertiaryFixed: Color(0xff3b002d),
      tertiaryFixedDim: Color(0xffffaede),
      onTertiaryFixedVariant: Color(0xff7e1c64),
      surfaceDim: Color(0xffddd8e2),
      surfaceBright: Color(0xfffdf7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fc),
      surfaceContainer: Color(0xfff2ecf6),
      surfaceContainerHigh: Color(0xffece6f0),
      surfaceContainerHighest: Color(0xffe6e0eb),
    );
  }

  ThemeData light(BuildContext context) {
    return theme(context,lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff482b9f),
      surfaceTint: Color(0xff644abc),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7b61d4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff463d68),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff786e9d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff791760),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb74d95),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf7ff),
      onSurface: Color(0xff1c1b22),
      onSurfaceVariant: Color(0xff44414e),
      outline: Color(0xff615d6b),
      outlineVariant: Color(0xff7d7888),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff312f37),
      inversePrimary: Color(0xffccbeff),
      primaryFixed: Color(0xff7b61d4),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6147ba),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff786e9d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5f5683),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffb74d95),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff99347b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd8e2),
      surfaceBright: Color(0xfffdf7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fc),
      surfaceContainer: Color(0xfff2ecf6),
      surfaceContainerHigh: Color(0xffece6f0),
      surfaceContainerHighest: Color(0xffe6e0eb),
    );
  }

  ThemeData lightMediumContrast(BuildContext context) {
    return theme(context,lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff260071),
      surfaceTint: Color(0xff644abc),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff482b9f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff241b45),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff463d68),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff470036),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff791760),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf7ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff25222f),
      outline: Color(0xff44414e),
      outlineVariant: Color(0xff44414e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff312f37),
      inversePrimary: Color(0xfff0e9ff),
      primaryFixed: Color(0xff482b9f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff310689),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff463d68),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2f2650),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff791760),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff590045),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd8e2),
      surfaceBright: Color(0xfffdf7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fc),
      surfaceContainer: Color(0xfff2ecf6),
      surfaceContainerHigh: Color(0xffece6f0),
      surfaceContainerHighest: Color(0xffe6e0eb),
    );
  }

  ThemeData lightHighContrast(BuildContext context) {
    return theme(context,lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffccbeff),
      surfaceTint: Color(0xffccbeff),
      onPrimary: Color(0xff350f8c),
      primaryContainer: Color(0xff9a81f7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcbbff3),
      onSecondary: Color(0xff332a54),
      secondaryContainer: Color(0xff403762),
      onSecondaryContainer: Color(0xffd6cafe),
      tertiary: Color(0xffffaede),
      onTertiary: Color(0xff60004b),
      tertiaryContainer: Color(0xffdc6db6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141219),
      onSurface: Color(0xffe6e0eb),
      onSurfaceVariant: Color(0xffcac4d5),
      outline: Color(0xff938e9e),
      outlineVariant: Color(0xff484552),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0eb),
      inversePrimary: Color(0xff644abc),
      primaryFixed: Color(0xffe7deff),
      onPrimaryFixed: Color(0xff1f0060),
      primaryFixedDim: Color(0xffccbeff),
      onPrimaryFixedVariant: Color(0xff4c2fa3),
      secondaryFixed: Color(0xffe7deff),
      onSecondaryFixed: Color(0xff1e143e),
      secondaryFixedDim: Color(0xffcbbff3),
      onSecondaryFixedVariant: Color(0xff4a406c),
      tertiaryFixed: Color(0xffffd8ec),
      onTertiaryFixed: Color(0xff3b002d),
      tertiaryFixedDim: Color(0xffffaede),
      onTertiaryFixedVariant: Color(0xff7e1c64),
      surfaceDim: Color(0xff141219),
      surfaceBright: Color(0xff3a3840),
      surfaceContainerLowest: Color(0xff0f0d14),
      surfaceContainerLow: Color(0xff1c1b22),
      surfaceContainer: Color(0xff201f26),
      surfaceContainerHigh: Color(0xff2b2930),
      surfaceContainerHighest: Color(0xff36343b),
    );
  }

  ThemeData dark(BuildContext context) {
    return theme(context,darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd0c2ff),
      surfaceTint: Color(0xffccbeff),
      onPrimary: Color(0xff190052),
      primaryContainer: Color(0xff9a81f7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd0c4f8),
      onSecondary: Color(0xff180f38),
      secondaryContainer: Color(0xff958abb),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffb4e0),
      onTertiary: Color(0xff320026),
      tertiaryContainer: Color(0xffdc6db6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141219),
      onSurface: Color(0xfffef9ff),
      onSurfaceVariant: Color(0xffcec8d9),
      outline: Color(0xffa6a0b0),
      outlineVariant: Color(0xff868190),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0eb),
      inversePrimary: Color(0xff4d31a4),
      primaryFixed: Color(0xffe7deff),
      onPrimaryFixed: Color(0xff130044),
      primaryFixedDim: Color(0xffccbeff),
      onPrimaryFixedVariant: Color(0xff3b1992),
      secondaryFixed: Color(0xffe7deff),
      onSecondaryFixed: Color(0xff130933),
      secondaryFixedDim: Color(0xffcbbff3),
      onSecondaryFixedVariant: Color(0xff39305a),
      tertiaryFixed: Color(0xffffd8ec),
      onTertiaryFixed: Color(0xff29001e),
      tertiaryFixedDim: Color(0xffffaede),
      onTertiaryFixedVariant: Color(0xff690352),
      surfaceDim: Color(0xff141219),
      surfaceBright: Color(0xff3a3840),
      surfaceContainerLowest: Color(0xff0f0d14),
      surfaceContainerLow: Color(0xff1c1b22),
      surfaceContainer: Color(0xff201f26),
      surfaceContainerHigh: Color(0xff2b2930),
      surfaceContainerHighest: Color(0xff36343b),
    );
  }

  ThemeData darkMediumContrast(BuildContext context) {
    return theme(context,darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffef9ff),
      surfaceTint: Color(0xffccbeff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd0c2ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffef9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd0c4f8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffb4e0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141219),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffef9ff),
      outline: Color(0xffcec8d9),
      outlineVariant: Color(0xffcec8d9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0eb),
      inversePrimary: Color(0xff2e0086),
      primaryFixed: Color(0xffebe3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd0c2ff),
      onPrimaryFixedVariant: Color(0xff190052),
      secondaryFixed: Color(0xffebe3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd0c4f8),
      onSecondaryFixedVariant: Color(0xff180f38),
      tertiaryFixed: Color(0xffffdeee),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb4e0),
      onTertiaryFixedVariant: Color(0xff320026),
      surfaceDim: Color(0xff141219),
      surfaceBright: Color(0xff3a3840),
      surfaceContainerLowest: Color(0xff0f0d14),
      surfaceContainerLow: Color(0xff1c1b22),
      surfaceContainer: Color(0xff201f26),
      surfaceContainerHigh: Color(0xff2b2930),
      surfaceContainerHighest: Color(0xff36343b),
    );
  }

  ThemeData darkHighContrast(BuildContext context) {
    return theme(context,darkHighContrastScheme());
  }

  ThemeData theme(BuildContext context, ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          alignLabelWithHint: true,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: const Color(0xFF7C7A7A),
              ),
          contentPadding: const EdgeInsets.all(15.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: .3),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100, width: .3),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color(0xFFB00020).withOpacity(.5), width: .3),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFB00020), width: .3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: const Color(0xFF7C7A7A),
              ),
          errorStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Color(0xFFB00020)),
        ),
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
