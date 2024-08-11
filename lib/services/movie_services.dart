import 'dart:convert';

import 'package:watchflix/models/cast_response.dart';
import 'package:watchflix/models/detail_response.dart';
import 'package:watchflix/models/detail_tv_response.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/models/trailer_response.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  Future<FetchResponse?> getTopRated() async {
    try {
      var url = baseUrl + 'movie/top_rated';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getTopRatedTv() async {
    try {
      var url = baseUrl + 'tv/top_rated';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getPopular() async {
    try {
      var url = baseUrl + 'movie/popular';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getPopularTv() async {
    try {
      var url = baseUrl + 'tv/popular';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getComingSoon() async {
    try {
      var url = baseUrl + 'movie/upcoming';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getNowPlaying() async {
    try {
      var url = baseUrl + 'movie/now_playing';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> searchMovie({
    String search = ""
  }) async {
    try {
      var url = baseUrl + 'search/movie?query='+ (search == "" ? "a" : search);
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> searchTv({
    String search = ""
  }) async {
    try {
      var url = baseUrl + 'search/tv?query='+ (search == "" ? "a" : search);
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<DetailResponse?> getMovieDetail({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'movie/$id';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return DetailResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<DetailTvResponse?> getTvDetail({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'tv/$id';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return DetailTvResponse.fromJson(decoded);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<FetchResponse?> getMovieRecommendations({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'movie/$id/recommendations';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getTvRecommendations({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'tv/$id/recommendations';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<CastResponse?> getMovieCasts({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'movie/$id/credits';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return CastResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<CastResponse?> getTvCasts({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'tv/$id/credits';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return CastResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<TrailerResponse?> getMovieTrailers({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'movie/$id/videos';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return TrailerResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<TrailerResponse?> getTvTrailers({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'tv/$id/videos';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return TrailerResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getTrendingMovieWeek() async {
    try {
      var url = baseUrl + 'trending/movie/week';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getTrendingMovieToday() async {
    try {
      var url = baseUrl + 'trending/movie/day';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getTrendingTvWeek() async {
    try {
      var url = baseUrl + 'trending/tv/week';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getTrendingTvToday() async {
    try {
      var url = baseUrl + 'trending/tv/day';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getAllTrendingToday() async {
    try {
      var url = baseUrl + 'trending/all/day';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }
}