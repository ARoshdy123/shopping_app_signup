import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_signup/screens/signup.dart';
import 'package:shopping_app_signup/widgets/display_product.dart';
import 'package:shopping_app_signup/widgets/grid_view.dart';
import 'package:shopping_app_signup/widgets/hot_offers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'languages', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: ShoppingApp()),
  );
  // runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SignUpScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shopping_app_title'.tr()),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              if (context.locale == Locale('en', 'US')) {
                context.setLocale(Locale('ar', 'EG'));
              } else {
                context.setLocale(Locale('en', 'US'));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'our_products'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DisplayProducts(),
              const SizedBox(height: 20),
              GridViewProduct(),
              const SizedBox(height: 20),
              Text(
                'hot_offers'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              HotOffers(),
            ],
          ),
        ),
      ),
    );
  }
}
