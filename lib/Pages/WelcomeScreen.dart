import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:grooming_essence/LoginProcessing.dart';
import 'package:grooming_essence/Widgets/ShapedImage.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:grooming_essence/googleSignIn.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                indicatorBackgroundColor: Colors.grey,
                indicatorColor: Colors.white,
                autoPlayInterval: 3500,
                initialPage: 2,
                isLoop: true,
                children: [
                  ShapedImage(
                      "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/13321242/2021/4/12/2d065d25-2fe4-468a-900e-a0d56d8eb87c1618227947908-Sangria-Women-Lehenga-Choli-5881618227946346-1.jpg"),
                  ShapedImage(
                      "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/1700944/2022/3/2/093bc645-d461-4128-94a1-0692803944141646215571321-HRX-by-Hrithik-Roshan-Men-Yellow-Printed-Cotton-Pure-Cotton--1.jpg"),
                  ShapedImage(
                      'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/18212814/2022/5/10/e960615b-1149-414c-a842-3df62dcbbbda1652175592034PrintedT-shirt1.jpg'),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                  top: 20,
                ),
                child: Text(
                  'Welcome To',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  'Grooming Essence',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 20,
                indent: 30,
                endIndent: 30,
              ),
              Center(
                child: Column(
                  children: [
                    Text('Sign In options', style: TextStyle(fontWeight: FontWeight.bold),),
                    SignInButton(
                      Buttons.GoogleDark,
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvide>(context, listen: false);
                        provider.googleLogin();
                        Navigator.of(context).pushNamed(LoginProcessing.loginProcess);
                      },
                      text: "Sign in with Google",
                    ),
                    SignInButton(
                      Buttons.FacebookNew,
                      onPressed: () {},
                      text: "Sign in with Facebook",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
