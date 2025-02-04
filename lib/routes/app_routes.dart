





import 'exports.dart';
class AppRoutes{
  static const String splashScreen = "/SplashScreen";
  static const String signInScreen = "/SignInScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String emailPassScreen = "/EmailPassScreen";
  static const String otpVerificationScreen = "/OtpVerificationScreen";
  static const String resetPassScreen = "/ResetPassScreen";
  static const String customNavBar = "/CustomNavBar";
  static const String onboardingScreen = "/OnboardingScreen";


  static List<GetPage> get routes => [
   GetPage(name: splashScreen, page: () =>  const SplashScreen()),
    GetPage(name: signInScreen, page: () =>   SignInScreen()),
    GetPage(name: signUpScreen, page: () =>   SignUpScreen()),
    GetPage(name: onboardingScreen, page: () =>  const OnboardingScreen()),
    GetPage(name: emailPassScreen, page: () =>   EmailPassScreen()),
    GetPage(name: otpVerificationScreen, page: () =>   OtpVerificationScreen()),
    GetPage(name: resetPassScreen, page: () =>   ResetPassScreen()),
    GetPage(name: customNavBar, page: () =>  const CustomNavBar()),

  ];
}