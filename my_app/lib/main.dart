import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/screens/auth/sign_in_screen.dart';
import 'package:my_app/screens/auth/signup_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/utils/screen_size.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Base size for UI design (adjust if needed)
      designSize: ScreenSizeUtil().getDesignSize(),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ASCS',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/signin',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/signin': (context) => const SignInScreen(),
            '/signup': (context) => const SignUpScreen(),
          },
        );
      },
    );
  }
}
