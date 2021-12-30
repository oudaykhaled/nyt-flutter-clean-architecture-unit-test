import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../article_detail/presentation/screen/article_detail.dart';
import '../../../common/constant.dart';
import '../../data/model/article.dart';

class ArticleListItem extends StatelessWidget {

  const ArticleListItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    String imageUrl = defaultImage;
    if (article.media.isNotEmpty && article.media.first.metaData.isNotEmpty) {
      imageUrl = article.media.first.metaData.first.url;
    }

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all()),
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: imageUrl,
                width: 64,
                height: 64,
                errorWidget:
                    (BuildContext context, String url, dynamic error) =>
                        const CircleAvatar(),
                imageBuilder: (BuildContext context,
                    ImageProvider<Object> imageProvider) {
                  return Material(
                    elevation: 4,
                    shape: const CircleBorder(),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider),
                          shape: BoxShape.circle),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title.substring(0, min(10, article.title.length)),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      article.abstract
                          .substring(0, min(40, article.abstract.length)),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => onItemClicked(context),
    );
  }

  void onItemClicked(BuildContext context) {
    Navigator.pushNamed(context, ArticleDetail.routeKey, arguments: article);
  }
}
