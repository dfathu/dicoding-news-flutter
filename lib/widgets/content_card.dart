import 'package:dicoding_pertama_membuat_aplikasi_flutter/models/model_posts.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/services/internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../shared/theme.dart';

class ContentCard extends StatefulWidget {
  final String time;
  final String id;
  const ContentCard({Key? key, required this.time, required this.id})
      : super(key: key);

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  ModelPost _futurePosts = ModelPost();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _futurePosts = await Apiservice().getPostsById(widget.id);
      print("debugPrint change");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_futurePosts.id != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_time_outlined,
                size: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.time,
                style:
                    blackTextStyle.copyWith(fontSize: 15, fontWeight: semiBold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${_futurePosts.title}",
                  style: blackTextStyle.copyWith(
                      fontSize: 25, fontWeight: semiBold),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${_futurePosts.body}",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 220,
          child: const Center(child: CircularProgressIndicator()));
    }
  }
}
