class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "c3435cfe40aeb079689227d82bf921d3";

  static const nowPlayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const popularMoviePath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const topRatedMoviePath =
      "$baseUrl/movie/popular?api_key=$apiKey";
}
