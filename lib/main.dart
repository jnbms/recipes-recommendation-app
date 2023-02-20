import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// improt 문구가 복잡해지는 점 관리하기
import 'package:recipes/recipe/recipe.entity.dart';
import 'package:recipes/screens/detail.dart';

// SCREENS
import 'package:recipes/screens/home.dart';
import 'package:recipes/screens/recipe.dart';
import 'package:recipes/states/page.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => PageModel(30),
      child: App(),
    ));

// ROUTES
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/recipe': (context) => RecipeScreen(),
        '/detail': (context) => DetialScreen(),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shadowColor: Colors.transparent,
          ),
          // DARK_MODE
          brightness: Brightness.light,
          fontFamily: 'Jeju',
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.black, fontSize: 36),
            headline2: TextStyle(color: Colors.black, fontSize: 32),
            headline3: TextStyle(color: Colors.black, fontSize: 28),
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          })),
    );
  }
}
