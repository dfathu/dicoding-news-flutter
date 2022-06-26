import 'package:dicoding_pertama_membuat_aplikasi_flutter/models/model_albums.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/services/internet.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/responsive.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ModelPhotos>> _futurePhotos;

  @override
  void initState() {
    super.initState();
    _futurePhotos = Apiservice().getPhotos();
  }

  Widget _headerHomeM() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/home_icon.png'))),
        ),
        const Icon(
          Icons.bookmark_border,
          size: 35,
        )
      ],
    );
  }

  Widget _contentHomeM(snapshot) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      shrinkWrap: true,
      itemCount: snapshot.data!.length - 40,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 200,
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/card/detail', arguments: {
                "id": snapshot.data![index].id.toString(),
              });
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].title.toString(),
                                style: blackTextStyle.copyWith(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.access_time_outlined,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    (categoryTime..shuffle()).first,
                                    style: blackTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    (categoryCard..shuffle()).first,
                                    style: greyTextStyle.copyWith(
                                        fontSize: 16, fontWeight: medium),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Image.network(
                          snapshot.data![index].url.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (Responsive.isMobile(context)) {
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin,
                  bottom: defaultMargin),
              child: Column(
                children: [
                  _headerHomeM(),
                  const SizedBox(
                    height: 30,
                  ),
                  FutureBuilder<List<ModelPhotos>>(
                    future: _futurePhotos,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return _contentHomeM(snapshot);
                      } else if (snapshot.hasError) {
                        return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Center(child: Text('${snapshot.error}')));
                      }

                      // By default, show a loading spinner.
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child:
                              const Center(child: CircularProgressIndicator()));
                    },
                  ),
                ],
              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Apiservice().getPosts();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
