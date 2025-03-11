part of 'resources.dart';

mixin AppTheme {
  static ThemeData get light => ThemeData(
        // fontFamily: Assets.fonts.golosText.golosTextBlack,
        useMaterial3: true,
        // typography: Typography.material2014(),
        textTheme: const TextTheme(
          displayLarge: TextStyle(letterSpacing: -1),
          displayMedium: TextStyle(letterSpacing: -1),
          displaySmall: TextStyle(letterSpacing: -1),
          bodyLarge: TextStyle(letterSpacing: -1),
          bodyMedium: TextStyle(letterSpacing: -1),
          bodySmall: TextStyle(letterSpacing: -1),
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          secondary: AppColors.mainColor,
          // surface: AppLightColors.base100,
        ),
        // // fontFamily: Platform.isIOS ? FontFamily.sFPro : null,
        scaffoldBackgroundColor: AppColors.white,
        brightness: Brightness.light,
        // primaryColor: AppLightColors.mainColor,
        // progressIndicatorTheme: const ProgressIndicatorThemeData(
        //   color: AppLightColors.mainColor,
        // ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.white,
          titleTextStyle: TextStyle(
            color: AppColors.text,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          modalBarrierColor: Color.fromRGBO(0, 0, 0, 0.5),
          dragHandleColor: Color(0xffCCCCCC),
          dragHandleSize: Size(48, 4),
          // showDragHandle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        // textSelectionTheme: const TextSelectionThemeData(
        //   cursorColor: AppLightColors.mainColor,
        // ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColors.backgroundInputGrey,
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.greyText,
            letterSpacing: -1,
          ),
          errorStyle: TextStyle(
            fontSize: 14,
            color: AppColors.red,
            letterSpacing: -1,
          ),
          // counterStyle: TextStyle(
          //   fontSize: 11,
          //   color: AppLightColors.base500,
          // ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.line2, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.line2, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.line2, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: AppColors.text,
              width: 0.5,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.mainColor,
            disabledBackgroundColor: AppColors.line2,
            disabledForegroundColor: AppColors.text,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.tabActive,
          labelStyle: TextStyle(
            fontSize: 11,
            // height: 18 / 12,
          ),
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: AppColors.base400,
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            // height: 18 / 12,
          ),
        ),
        // dialogBackgroundColor: AppLightColors.base50,
        // checkboxTheme: const CheckboxThemeData(
        //   side: BorderSide(
        //     color: AppLightColors.base200,
        //     width: 2,
        //   ),
        // ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(shape: CircleBorder()),
      );

  // static ThemeData get dark => _darkThemeData;
}

mixin AppDecorations {
  // static const List<Color> gradientColors = [
  //   Color(0xff4296F8),
  //   Color(0xff0055DD),
  // ];

  // static const List<BoxShadow> accountTabDropShadow = [
  //   BoxShadow(
  //     blurRadius: 4,
  //     offset: Offset(0, 4),
  //     color: Color.fromRGBO(0, 0, 0, 0.25),
  //   ),
  // ];

  // static const List<BoxShadow> appBarButtonShadows = [
  //   BoxShadow(
  //     blurRadius: 5,
  //     color: Color.fromRGBO(0, 0, 0, 0.05),
  //   ),
  //   BoxShadow(
  //     blurRadius: 35,
  //     offset: Offset(0, 25),
  //     color: Color.fromRGBO(0, 0, 0, 0.07),
  //   ),
  // ];
}
