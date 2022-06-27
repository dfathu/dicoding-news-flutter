import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/responsive.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/theme.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class DetailCardScreen extends StatelessWidget {
  const DetailCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (Responsive.isMobile(context)) {
          return Stack(children: [
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: Image.network(
                      arguments['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: kWhiteColor,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: defaultMargin,
                            right: defaultMargin,
                            left: defaultMargin),
                        child: ContentCard(
                          id: arguments['id'],
                          time: arguments['time'],
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.only(
                    top: defaultMargin,
                    right: defaultMargin,
                    left: defaultMargin),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: kWhiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const Center(
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const Center(
                                child: Icon(
                                  Icons.backup_outlined,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const Center(
                                child: Icon(
                                  Icons.more_horiz_outlined,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]);
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
