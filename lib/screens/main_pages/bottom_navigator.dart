import 'package:flutter/material.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/widgets/menu_item.dart';

// ignore: must_be_immutable
class BottomNavigator extends StatelessWidget {
  Function(String) onPress;
  String currentPage;

  BottomNavigator({
    super.key,
    required this.onPress,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: primary,
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuItemCustom(
              icon: 'home',
              onPress: () => onPress('home'),
              active: currentPage == 'home',
            ),
            MenuItemCustom(
              icon: 'explore',
              onPress: () => onPress('explore'),
              active: currentPage == 'explore',
            ),
            MenuItemCustom(
              icon: 'saved',
              onPress: () => onPress('saved'),
              active: currentPage == 'saved',
            ),
          ],
        ),
      ),
    );
  }
}
