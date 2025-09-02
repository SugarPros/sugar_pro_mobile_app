import 'package:sugar_pros/core/utils/exports.dart';

List<ThemeData> getThemes() {
  return [darkTheme, lightTheme];
}

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: createMaterialColor(BrandColors.primary),
  primaryColor: BrandColors.primary,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: Utils.darkTheme,
    color: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  primaryTextTheme: TextTheme(
    titleLarge: const TextStyle().copyWith(
      color: BrandColors.bc1C1939,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'Geist',
      letterSpacing: -0.02,
      height: 1.25
    )
  ),
  iconTheme: const IconThemeData(
    color: Colors.white
  ),
  fontFamily: 'Geist',
  dividerColor: Colors.black12,
  cardColor: Colors.white54
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: createMaterialColor(BrandColors.primary),
  primaryColor: BrandColors.primary,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: Utils.lightTheme,
    color: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  primaryTextTheme: TextTheme(
    titleLarge: const TextStyle().copyWith(
      color: BrandColors.bc1C1939,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'Geist',
      letterSpacing: -0.02,
      height: 1.25
    )
  ),
  iconTheme: const IconThemeData(
    color: Colors.white
  ),
  fontFamily: 'Geist',
  dividerColor: Colors.black12,
  cardColor: Colors.white54
);

MaterialColor createMaterialColor(Color color) {
  final double r = color.r;
  final double g = color.g;
  final double b = color.b;
  final Map<int, Color> shades = {
    50: Color.from(red: r, green: g, blue: b, alpha: .1),
    100: Color.from(red: r, green: g, blue: b, alpha: .2),
    200: Color.from(red: r, green: g, blue: b, alpha: .3),
    300: Color.from(red: r, green: g, blue: b, alpha: .4),
    400: Color.from(red: r, green: g, blue: b, alpha: .5),
    500: Color.from(red: r, green: g, blue: b, alpha: .6),
    600: Color.from(red: r, green: g, blue: b, alpha: .7),
    700: Color.from(red: r, green: g, blue: b, alpha: .8),
    800: Color.from(red: r, green: g, blue: b, alpha: .9),
    900: Color.from(red: r, green: g, blue: b, alpha: 1),
  };
  return MaterialColor(color.toInt32, shades);
}

extension ColorEx on Color {
  static int floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  int get toInt32 {
    return floatToInt8(a) << 24 | floatToInt8(r) << 16 | floatToInt8(g) << 8 | floatToInt8(b) << 0;
  }
}
