import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenwave/vo/movie.dart';
import '../const.dart';
import 'theme.dart';

class MovieRow extends StatelessWidget {
  final Movie movie;
  const MovieRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: cardBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: movie.poster == ""
                    ? Container(
                        width: imageWidth,
                        height: imageHeight,
                        color: subTextColor.withOpacity(0.05),
                        child: const Icon(Icons.photo,
                            size: 80, color: subTextColor))
                    : CachedNetworkImage(
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        imageUrl: movie.poster,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Builder(builder: (context) {
                              return const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                      color: primaryColor));
                            }),
                          ],
                        ),
                        errorWidget: (context, url, error) => Container(
                            width: imageWidth,
                            height: imageHeight,
                            color: subTextColor.withOpacity(0.05),
                            child: const Icon(
                              Icons.error,
                              color: subTextColor,
                            )),
                      ),
              ),
              const SizedBox(width: 15),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${movie.date} . ${movie.time}",
                      style:
                          const TextStyle(fontSize: 13, color: subTextColor)),
                  Text(
                    movie.title,
                    style: const TextStyle(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  movie.notes == null || movie.notes == ''
                      ? const SizedBox()
                      : Text(movie.notes ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13, color: textColor.withOpacity(0.8))),
                  movie.screeningDetail == null
                      ? const SizedBox(height: 6)
                      : Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 25,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          gradientColor2,
                                          gradientColor1
                                        ])),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${movie.screeningDetail!.totalTarget} of ${movie.screeningDetail!.totalAttend}",
                                        style: const TextStyle(
                                            fontSize: 14, color: textColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  movie.screeningDetail!.status,
                                  style: const TextStyle(
                                      fontSize: 13, color: gradientColor1),
                                ),
                              )
                            ],
                          ),
                        ),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: primaryColor, size: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          movie.cinema ?? '',
                          style: const TextStyle(
                              fontSize: 13,
                              color: subTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  movie.creatorDetail == null
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  width: 17,
                                  height: 17,
                                  imageUrl: movie.creatorDetail!.profile,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Builder(builder: (context) {
                                        return const SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: CircularProgressIndicator(
                                                color: primaryColor,
                                                strokeWidth: 0.5));
                                      }),
                                    ],
                                  ),
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: RichText(
                                  text: TextSpan(children: [
                                    const TextSpan(
                                      text: 'Created by ',
                                      style: TextStyle(
                                          color: subTextColor, fontSize: 13),
                                    ),
                                    TextSpan(
                                      text: movie.creatorDetail?.name ?? '',
                                      style: const TextStyle(
                                          color: subTextColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                ],
              )),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
