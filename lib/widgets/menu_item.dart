import 'package:flutter/material.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class MenuItemCustom extends StatelessWidget {
  String icon;
  bool active;
  Function() onPress;

  MenuItemCustom({
    required this.icon,
    this.active = false,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    String getIcon() {
      if (icon == 'home') {
        return active ? 'ic_home_active.png' : 'ic_home.png';
      } else if (icon == 'explore') {
        return active ? 'ic_explore_active.png' : 'ic_explore.png';
      } else {
        return active ? 'ic_home_active.png' : 'ic_home.png';
      }
    }

    ImageProvider GeneratedIcon() {
      return AssetImage('assets/icons/' + getIcon());
    }

    String getMenuTitle() {
      if (icon == 'home') {
        return 'Home';
      } else if (icon == 'explore') {
        return 'Explore';
      } else {
        return 'Home';
      }
    }

    Text GeneratedText() {
      return Text(
        getMenuTitle(),
        style: regular.copyWith(
          fontWeight: active ? fontSemiBold : fontRegular,
          color: active ? secondary : greyColor
        ),
      );
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageCustom(
              width: 24,
              height: 24,
              image: GeneratedIcon(),
            ),
            GeneratedText()
          ],
        ),
      ),
    );
  }
}
