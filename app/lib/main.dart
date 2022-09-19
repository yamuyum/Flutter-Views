import 'package:flutter/material.dart';
import 'Components/footer.dart';
import 'Components/header.dart';
import 'Components/sideMenu.dart';
import 'Constants/colors.dart';
import 'Views/homeView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // firebase設定
  // await Firebase.initializeApp();
  // admob設定
  // final initFuture = MobileAds.instance.initialize();
  // final initFuture = Platform.isWindows ?"":MobileAds.instance.initialize();

  // stripe設定
  // // set the publishable key for Stripe - this is mandatory
  // Stripe.publishableKey = stripePublishableKey;
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // Stripe.urlScheme = 'flutterstripe';
  // await Stripe.instance.applySettings();

  // runApp(
  //   /// Providers are above [MyApp] instead of inside it, so that tests
  //   /// can use [MyApp] while mocking the providers
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => AdState(initFuture)),
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        primaryColor: bgColor,
        primarySwatch: Colors.blue,
      ),
      // 初手出ししたい画面を
      home: HomeView(),
    );
  }
}
