import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grooming_essence/LoginProcessing.dart';
import 'package:grooming_essence/Pages/cart_page.dart';
import 'package:grooming_essence/Pages/favorite_page.dart';
import 'package:grooming_essence/Pages/offer_details.dart';
import 'package:grooming_essence/Pages/offers_page.dart';
import 'package:grooming_essence/Pages/product_details_page.dart';
import 'package:grooming_essence/Pages/user_profile.dart';
import 'package:grooming_essence/googleSignIn.dart';
import 'package:grooming_essence/provider_category_name.dart';
import 'package:provider/provider.dart';
import 'package:grooming_essence/Pages/HomePage.dart';


import 'Pages/WelcomeScreen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(create:(context) =>  CategoryProvider(),child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String welcomeScreen = '/';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvide(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            //fontFamily: GoogleFonts.jost().fontFamily,

            textTheme: GoogleFonts.jostTextTheme(
              Theme.of(context).textTheme,
            )
          ),
          //home: WelcomeScreen(),
          routes: {
            '/': (context) => WelcomeScreen(),
            HomePage.homepage : (context) => HomePage(),
            LoginProcessing.loginProcess : (context) =>  LoginProcessing(),
            ProductFullView.routeName : (context) => ProductFullView(),
            Offers.routeName : (context) => Offers(),
            OfferDetails.routeName: (context) => OfferDetails(),
            UserProfile.routeName: (context) => UserProfile(),
            Favorite.routeName: (context) => Favorite(),
            Cart.routeName : (context) => Cart(),

          },
        ),
      );
}
