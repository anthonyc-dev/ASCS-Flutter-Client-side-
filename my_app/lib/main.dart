import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/screens/auth/sign_in_screen.dart';
import 'package:my_app/screens/auth/signup_screen.dart';
import 'package:my_app/screens/events.dart';
import 'package:my_app/screens/home_dashboard.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/nonifiocation.dart';
import 'package:my_app/screens/qr_code.dart';
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontFamily: 'Outfit'),
              bodyMedium: TextStyle(fontFamily: 'Outfit'),
              displayLarge: TextStyle(fontFamily: 'Outfit'),
              displayMedium: TextStyle(fontFamily: 'Outfit'),
              // Add other styles here as needed
            ),
          ),

          initialRoute: '/signin',
          routes: {
            '/homeDashboard': (context) => const HomeDashboard(),
            '/home': (context) => const HomeScreen(),
            '/signin': (context) => const SignInScreen(),
            '/signup': (context) => const SignUpScreen(),
            '/event': (context) => const Event(),
            '/qrcode': (context) => const QrCode(),
            '/notif': (context) => const NotificationScreen(),
          },
        );
      },
    );
  }
}
