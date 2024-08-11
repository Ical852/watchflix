import 'package:flutter/material.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

dynamic nullChecker(dynamic check) {
  if (check == null) return null;
  return check;
}

bool isNotNull(dynamic check) {
  return check != null;
}

Color getColorType(type) {
  if (type == 'danger') {
    return secondary;
  } else if (type == 'info') {
    return infoColor;
  } else {
    return successColor;
  }
}

double getWH(BuildContext context, String type) {
  var size = MediaQuery.of(context).size;

  if (type == 'width') return size.width;
  return size.height;
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

String rawMoneyFormat(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return formatted.replaceAll(',', '.');
}

String moneyFormat(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return 'IDR. ' + formatted.replaceAll(',', '.');
}

String getIC(String icon) {
  return "assets/icons/$icon";
}

String getIM(String image) {
  return "assets/images/$image";
}

BoxShadow getBoxShadow(double show) {
  return BoxShadow(
    color: blackColor.withOpacity(show / 10),
    blurRadius: show,
    offset: Offset(0, show)
  );
}

void showGLobalAlert(type, text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      text,
      style: regular.white.bold,
      textAlign: TextAlign.center,
    ),
    backgroundColor: getColorType(type),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8)
      )
    ),
  ));
}

void showDrawer(BuildContext context, double height, Widget content) {
  showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32), topRight: Radius.circular(32)
      )
    ),
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)
          )
        ),
        child: content,
      );
    },
  );
}

void showConfirm(BuildContext context, String confirm, Function onYes, onCancel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm'),
        content: Text(confirm),
        actions: <Widget>[
          TextButton(
            child: Text('No'),
            onPressed: () {
              onCancel();
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              onYes();
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  ).then((value) {
    if (value != null && value) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Cancelled!'),
      ));
    }
  });
}

String getPosterUrl(String url) {
  return "https://image.tmdb.org/t/p/original/$url";
}

String convertMinutesToHourMinute(int totalMinutes) {
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;

  String hourStr = hours > 1 ? "hours" : "hour";
  String minuteStr = minutes > 1 ? "minutes" : "minute";

  if (hours > 0 && minutes > 0) {
    return "$hours $hourStr $minutes $minuteStr";
  } else if (hours > 0) {
    return "$hours $hourStr";
  } else {
    return "$minutes $minuteStr";
  }
}

String dateFormat(String date) {
  DateTime parsedDate = DateTime.parse(date);

  String formattedDate = intl.DateFormat("MMMM dd, yyyy", "id_ID").format(parsedDate);
  return formattedDate;
}

String getTitle(Results detail) {
  if (detail.title != null) return detail.title!;
  if (detail.name != null) return detail.name!;
  return "-";
}

void launchURL(String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
