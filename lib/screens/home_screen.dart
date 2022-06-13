import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/responsive.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (Responsive.isMobile(context)) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: defaultMargin, left: defaultMargin),
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/home_icon.png'))),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(
                          top: defaultMargin, right: defaultMargin),
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border),
                      iconSize: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 200,
                                minHeight: 200,
                                maxWidth: 400,
                                maxHeight: 400,
                              ),
                              child: Image.asset('assets/icons/home_icon.png',
                                  fit: BoxFit.cover),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                                flex: 1, child: Text("hohohohohohohhhoh"))
                          ],
                        ),
                      );
                    }),
              ],
            ),
          );
        } else if (Responsive.isTablet(context)) {
          return Text(
            'NewsHome',
            style: blackTextStyle.copyWith(
                fontSize: 32, fontWeight: medium, letterSpacing: 2),
          );
        } else {
          return Text(
            'NewsHome',
            style: blackTextStyle.copyWith(
                fontSize: 32, fontWeight: medium, letterSpacing: 2),
          );
        }
      })),
    );
  }
}
