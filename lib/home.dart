import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/page/profile_page.dart';
import 'package:home/themes.dart';
import 'package:home/utils/user_preference.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const Home());
}

class Home extends StatelessWidget {
  static const String title = 'User Profile';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeProvider.,
          title: title,
          home: ProfilePage(),
        ),
      ),
    );
  }
}
