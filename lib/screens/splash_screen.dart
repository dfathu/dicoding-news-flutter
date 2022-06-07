import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/responsive.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/theme.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SplashScreeen extends StatelessWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (Responsive.isMobile(context)) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/home_icon.png'))),
                ),
                Text(
                  'NewsHome',
                  style: blackTextStyle.copyWith(
                      fontSize: 32, fontWeight: medium, letterSpacing: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: 'Mulai  \u{2192}',
                  width: 150,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ],
            ),
          );
        } else if (Responsive.isTablet(context)) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/home_icon.png'))),
                ),
                Text(
                  'NewsHome',
                  style: blackTextStyle.copyWith(
                      fontSize: 32, fontWeight: medium, letterSpacing: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: 'Mulai  \u{2192}',
                  width: 150,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/icons/home_icon.png'))),
                      ),
                      Text(
                        'NewsHome',
                        style: blackTextStyle.copyWith(
                            fontSize: 32, fontWeight: medium, letterSpacing: 2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  CustomButton(
                    title: 'Mulai  \u{2192}',
                    width: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    margin: const EdgeInsets.only(right: 30),
                  ),
                ],
              )
            ],
          );
        }
      })),
    );
  }
}
