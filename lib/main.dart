import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: Colors.greenAccent,
        //   brightness: Brightness.dark,
        // ),
        useMaterial3: false,
      ),
      themeMode: ThemeMode.system,
      home: LoadingScreen(),
    );
  }
}
