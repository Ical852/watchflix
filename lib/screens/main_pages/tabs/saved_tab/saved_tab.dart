import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/saved_cubit.dart';
import 'package:watchflix/models/saved_model.dart';
import 'package:watchflix/screens/main_pages/tabs/saved_tab/partials/empty_saved.dart';
import 'package:watchflix/screens/main_pages/tabs/saved_tab/partials/saved_header.dart';
import 'package:watchflix/screens/main_pages/tabs/saved_tab/partials/saved_list.dart';

class SavedTab extends StatefulWidget {
  const SavedTab({super.key});

  @override
  State<SavedTab> createState() => _SavedTabState();
}

class _SavedTabState extends State<SavedTab> {
  @override
  Widget build(BuildContext context) {
    Widget MainContent() {
      return BlocConsumer<SavedCubit, List<SavedModel>>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.length < 1) return EmptySaved();
          return SavedList();
        },
      );
    }

    return Container(
      child: Column(
      children: [
        SavedHeader(),
        Expanded(
          child: MainContent(),
        ),
      ],
    ));
  }
}
