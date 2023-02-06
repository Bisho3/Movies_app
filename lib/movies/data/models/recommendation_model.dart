import 'package:movie_app/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendation {
  const RecommendationsModel({
     super.backdropPath,
    required super.id,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      backdropPath: json["backdrop_path"] ??'/maxRhndtC4BJABvqRPvYNu69CHA.jpg',
      id: json["id"],
    );
  }
}
