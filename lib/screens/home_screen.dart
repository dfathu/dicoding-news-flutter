import 'package:dicoding_pertama_membuat_aplikasi_flutter/models/model_albums.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/services/internet.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/responsive.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/shared/theme.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/widgets/content_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ModelPhotos>> _futurePhotos;
  late List<String> _timeListRandom = [];
  int _selectedItem = 0;
  String _timeForD = '';
  String _idForD = '';
  String _urlForD = '';

  @override
  void initState() {
    super.initState();
    _futurePhotos = Apiservice().getPhotos();
    _timeListRandom = _getRandomTime();
    print("debugPrint time list: ${_timeListRandom[0]}");
    _timeListRandom.forEach(
        (element) => {print("debugPrint time list element: $element")});
  }

  List<String> _getRandomTime() {
    List<String> _randomTime = [];
    for (int i = 0; i < 10; i++) {
      _randomTime.add((categoryTime..shuffle()).first);
    }
    return _randomTime;
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
                "time": _timeListRandom[index],
                "image": snapshot.data![index].url.toString()
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
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                                    _timeListRandom[index],
                                    style: blackTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    (categoryCard..shuffle()).first,
                                    style: greyTextStyle.copyWith(
                                        fontSize: 16, fontWeight: medium),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
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

  Widget _contentHomeD(snapshot) {
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
              setState(() {
                _selectedItem = 1;
                _timeForD = _timeListRandom[index];
                _idForD = snapshot.data![index].id.toString();
                _urlForD = snapshot.data![index].url.toString();
              });
              // Navigator.pushNamed(context, '/card/detail', arguments: {
              //   "id": snapshot.data![index].id.toString(),
              //   "time": _timeListRandom[index],
              //   "image": snapshot.data![index].url.toString()
              // });
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
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                                    _timeListRandom[index],
                                    style: blackTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    (categoryCard..shuffle()).first,
                                    style: greyTextStyle.copyWith(
                                        fontSize: 16, fontWeight: medium),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
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

  Widget _sideBarT() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 200,
      color: Color.fromARGB(255, 226, 226, 223),
      child: Padding(
        padding: EdgeInsets.only(
            top: defaultMargin,
            right: defaultMargin,
            left: defaultMargin,
            bottom: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Newshome",
              style: blackTextStyle.copyWith(
                  fontSize: 24, fontWeight: bold, letterSpacing: -1),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 234, 234),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Home",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
                          height: MediaQuery.of(context).size.height - 220,
                          child:
                              const Center(child: CircularProgressIndicator()));
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (Responsive.isTablet(context)) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sideBarT(),
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: defaultMargin,
                          right: defaultMargin,
                          left: defaultMargin,
                          bottom: defaultMargin),
                      child: Column(
                        children: [
                          FutureBuilder<List<ModelPhotos>>(
                            future: _futurePhotos,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return _contentHomeM(snapshot);
                              } else if (snapshot.hasError) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Center(
                                        child: Text('${snapshot.error}')));
                              }

                              // By default, show a loading spinner.
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height - 220,
                                  child: const Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: kWhiteColor,
                  constraints: BoxConstraints(minWidth: 200, maxWidth: 250),
                  child: _sideBarT(),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Color.fromARGB(255, 236, 234, 234),
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: defaultMargin,
                            right: defaultMargin,
                            left: defaultMargin,
                            bottom: defaultMargin),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Latest",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 20, fontWeight: medium),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 5,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: kBlackColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 30,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FutureBuilder<List<ModelPhotos>>(
                              future: _futurePhotos,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _contentHomeD(snapshot);
                                } else if (snapshot.hasError) {
                                  return SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Center(
                                          child: Text('${snapshot.error}')));
                                }

                                // By default, show a loading spinner.
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height -
                                        220,
                                    child: const Center(
                                        child: CircularProgressIndicator()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: _selectedItem == 0
                      ? Container(
                          color: kWhiteColor,
                        )
                      : SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: defaultMargin,
                                right: defaultMargin,
                                left: defaultMargin,
                                bottom: defaultMargin),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amberAccent,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          child: Container(
                                            height: 42,
                                            width: 42,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                _urlForD,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "by UserId $_idForD",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: semiBold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 350,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      _urlForD,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ContentCard(time: _timeForD, id: _idForD),
                              ],
                            ),
                          ),
                        )),
            ],
          );
        }
      })),
      floatingActionButton: Visibility(
        visible: Responsive.isMobile(context) ? true : false,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 40,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
