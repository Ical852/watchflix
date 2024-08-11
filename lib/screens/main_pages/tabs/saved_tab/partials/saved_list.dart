import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/saved_cubit.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/saved_model.dart';
import 'package:watchflix/screens/main_pages/tabs/saved_tab/widgets/saved_grid_card.dart';

// ignore: must_be_immutable
class SavedList extends StatelessWidget {
  SavedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedCubit, List<SavedModel>>(
      listener: (context, state) {},
      builder: (context, state) {
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
              itemCount: state.length,
              itemBuilder: (context, index) {
                double itemWidth = getWH(context, "width") / 3 - 20;
                double itemHeight = itemWidth * 105 / 160;
                return SavedGridCard(
                  itemWidth: itemWidth,
                  itemHeight: itemHeight,
                  detail: state[index].result,
                  type: state[index].type
                );
              },
            ),
          ),
        );
      },
    );
  }
}