import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:watchflix/blocs/cubits/all_trending_today_cubit.dart';
import 'package:watchflix/blocs/cubits/coming_soon_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_cast_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_detail_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_recommendations_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_trailer_cubit.dart';
import 'package:watchflix/blocs/cubits/now_playing_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/page_cubit.dart';
import 'package:watchflix/blocs/cubits/popular_tv_cubit.dart';
import 'package:watchflix/blocs/cubits/saved_cubit.dart';
import 'package:watchflix/blocs/cubits/search_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/search_tv_cubit.dart';
import 'package:watchflix/blocs/cubits/top_rated_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/popular_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/top_rated_tv_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_movie_today_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_movie_week_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_tv_today_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_tv_week_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_cast_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_detail_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_recommendations_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_trailer_cubit.dart';
import 'package:watchflix/screens/main_pages/main_page.dart';
import 'package:watchflix/screens/splash_page.dart';
import 'package:watchflix/shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: primary));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => TopRatedMovieCubit()),
        BlocProvider(create: (context) => PopularMovieCubit()),
        BlocProvider(create: (context) => ComingSoonMovieCubit()),
        BlocProvider(create: (context) => NowPlayingMovieCubit()),
        BlocProvider(create: (context) => SearchMovieCubit()),
        BlocProvider(create: (context) => SearchTvCubit()),
        BlocProvider(create: (context) => MovieDetailCubit()),
        BlocProvider(create: (context) => MovieRecommendationsCubit()),
        BlocProvider(create: (context) => TvRecommendationsCubit()),
        BlocProvider(create: (context) => MovieCastCubit()),
        BlocProvider(create: (context) => MovieTrailerCubit()),
        BlocProvider(create: (context) => TrendingMovieWeekCubit()),
        BlocProvider(create: (context) => TrendingTvWeekCubit()),
        BlocProvider(create: (context) => PopularTvCubit()),
        BlocProvider(create: (context) => TrendingMovieTodayCubit()),
        BlocProvider(create: (context) => TrendingTvTodayCubit()),
        BlocProvider(create: (context) => TopRatedTvCubit()),
        BlocProvider(create: (context) => AllTrendingTodayCubit()),
        BlocProvider(create: (context) => TvDetailCubit()),
        BlocProvider(create: (context) => TvCastCubit()),
        BlocProvider(create: (context) => TvTrailerCubit()),
        BlocProvider(create: (context) => SavedCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/main": (context) => MainPage()
        },
        initialRoute: "/",
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text("Unknown Route")),
              body: Center(child: Text("Unknown Route")),
            ),
          );
        },
      )
    );
  }
}
