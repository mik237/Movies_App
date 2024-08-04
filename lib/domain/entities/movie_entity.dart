import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieEntity extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? posterPath;
  final String? overview;
  final String? releaseDate;
  final num? voteAverage;

  const MovieEntity({
    @required this.backdropPath,
    @required this.id,
    @required this.title,
    @required this.posterPath,
    @required this.releaseDate,
    @required this.voteAverage,
    this.overview,
  }) : assert(id != null, "Movie id must not be null");

  @override
  List<Object?> get props => [id, title];

  @override
  bool? get stringify => true;
}
