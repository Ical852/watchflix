import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/page_cubit.dart';
import 'package:watchflix/screens/main_pages/bottom_navigator.dart';
import 'package:watchflix/screens/main_pages/tabs/explore_tab/explore_tab.dart';
import 'package:watchflix/screens/main_pages/tabs/home_tab/home_tab.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/view_models/main/main_view_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  late MainViewModel mainVm = MainViewModel(context);
  var keyboardVisible = false;

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != keyboardVisible) {
      setState(() {
        keyboardVisible = newValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget ContentRender(String state) {
      if (state == "explore") return ExploreTab();
      return HomeTab();
    }

    Widget BottomNavRender(String state) {
      if (keyboardVisible) return Container();
      return Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigator(
          currentPage: state,
          onPress: (set) {
            setState(() {
              mainVm.setNewPage(set);
            });
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PageCubit, String>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              color: primary,
              child: Stack(
                children: [
                  ContentRender(state),
                  BottomNavRender(state)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
