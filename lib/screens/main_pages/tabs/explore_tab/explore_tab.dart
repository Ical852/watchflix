import 'package:flutter/material.dart';
import 'package:watchflix/screens/main_pages/tabs/explore_tab/list/movie_list.dart';
import 'package:watchflix/screens/main_pages/tabs/explore_tab/list/tv_list.dart';
import 'package:watchflix/screens/main_pages/tabs/explore_tab/partials/search_bar.dart';
import 'package:watchflix/screens/main_pages/tabs/explore_tab/partials/search_drawer.dart';
import 'package:watchflix/view_models/main/explore_view_model.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  late ExploreViewModel exploreVM = ExploreViewModel(context);
  TextEditingController searchController = TextEditingController(text: "");
  var search = "movie";

  @override
  void initState() {
    super.initState();
    exploreVM.searchMovie("");
  }

  @override
  Widget build(BuildContext context) {
    Widget SearchDrawerContent() {
      return SearchDrawer(
        onMovies: (){
          setState(() {
            search = "movie";
            exploreVM.searchMovie("");
          });
        },
        onTv: (){
          setState(() {
            search = "tv";
            exploreVM.searchTv("");
          });
        },
      );
    }

    Widget SearchBarContent() {
      return SearchBarCustom(
        searchController: searchController,
        onFieldSubmitted: (e) {
          if (search == 'tv') {
            exploreVM.searchTv(e.toString());
          } else {
            exploreVM.searchMovie(e.toString());
          }
        }, 
        searchDrawerContent: SearchDrawerContent()
      );
    }

    Widget MainContent() {
      if (search == "movie") {
        return MovieList(
          refresh: () => exploreVM.searchMovie(""),
          search: search
        );
      }
      return TvList(
        refresh: () => exploreVM.searchTv(""),
        search: search
      );
    }

    return Container(
      child: Column(
        children: [
          SearchBarContent(),
          MainContent()
        ],
      )
    );
  }
}
