import 'package:screenwave/vo/creator.dart';
import 'package:screenwave/vo/screening.dart';

class Movie {
  String title;
  String poster;
  String? cinema;
  String date;
  String time;
  String? notes;
  Screening? screeningDetail;
  Creator? creatorDetail;

  factory Movie.fromMapForTrending(Map<String, dynamic> map) {
    var screeningDetail = map['screening_detail'] != null
        ? Screening.fromMap(map['screening_detail'])
        : null;

    var creatorDetail = map['creator_detail'] != null
        ? Creator.fromMap(map['creator_detail'])
        : null;

    return Movie(
        title: map['title'] ?? '',
        poster: map['poster'] ?? '',
        cinema: map['cinema'] ?? '',
        date: map['date'] ?? '',
        time: map['time'] ?? '',
        notes: map['notes'] ?? '',
        screeningDetail: screeningDetail,
        creatorDetail: creatorDetail);
  }

  factory Movie.fromMapForScreening(Map<String, dynamic> map) {
    var creatorDetail = map['cinema_detail'] != null
        ? Creator.fromMap(map['cinema_detail'])
        : null;

    return Movie(
        title: map['title'] ?? '',
        poster: map['poster'] ?? '',
        date: map['date'] ?? '',
        cinema: creatorDetail?.name,
        time: map['time'] ?? '',
        creatorDetail: creatorDetail);
  }

  Movie({
    required this.title,
    required this.poster,
    this.cinema,
    required this.date,
    required this.time,
    this.notes,
    this.screeningDetail,
    this.creatorDetail,
  });
}
