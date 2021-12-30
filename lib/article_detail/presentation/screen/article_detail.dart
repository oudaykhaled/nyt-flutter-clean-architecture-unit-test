import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../articles_list/data/model/article.dart';
import '../../../common/constant.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail(this._article, {Key? key}) : super(key: key);
  static const String routeKey = '/ArticleDetail';
  final Article _article;

  @override
  ArticleDetailState createState() => ArticleDetailState();
}

class ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    String imageUrl = defaultImage;
    if (widget._article.media.isNotEmpty &&
        widget._article.media.first.metaData.isNotEmpty &&
        widget._article.media.first.metaData.length > 2) {
      imageUrl = widget._article.media.first.metaData[2].url;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._article.title),
      ),
      body: ListView(
        children: <Widget>[
          CachedNetworkImage(
            key: const Key('articleImage'),
            imageUrl: imageUrl,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.fitWidth,
            imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) {
              return Material(
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget._article.abstract,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
