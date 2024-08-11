import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/search_tv_cubit.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/screens/main_pages/tabs/explore_tab/widgets/grid_card.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/widgets/refetch_data.dart';

// ignore: must_be_immutable
class TvList extends StatelessWidget {
  String search;
  Function() refresh;

  TvList({
    super.key,
    required this.search,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchTvCubit, SearchTvState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchTvLoading) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            ),
          );
        }
        if (state is SearchTvFailed) {
          return Expanded(
            child: Center(
              child: RefetchData(
                title: "Failed to get tv list",
                onRefetch: refresh,
              ),
            ),
          );
        }
        if (state is SearchTvSuccess) {
          return Expanded(
            child: Container(
              child: GridView.builder(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 172),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 105 / 160,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                itemCount: state.search.results!.length,
                itemBuilder: (context, index) {
                  double itemWidth = getWH(context, "width") / 3 - 20;
                  double itemHeight = itemWidth * 105 / 160;
                  return GridCard(
                    itemWidth: itemWidth,
                    itemHeight: itemHeight,
                    detail: state.search.results![index],
                    search: search
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}