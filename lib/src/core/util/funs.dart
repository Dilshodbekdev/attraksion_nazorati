import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/language_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/questionnaire_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String convertDateTime(String? date) {
  var outputDate = "";
  if (date != null) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm');
    outputDate = outputFormat.format(inputDate);
  }
  return outputDate;
}

Color textColor(int status) {
  late Color textColor = Colors.white;
  switch (status) {
    case 1:
      textColor = AppColors.createdColor;
      break;
    case 2:
      textColor = AppColors.sentColor;
      break;
    case 3:
      textColor = AppColors.progressColor;
      break;
    case 4:
      textColor = AppColors.completesColor;
      break;
    default:
      textColor = Colors.red;
      break;
  }
  return textColor;
}

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

String getLang(LanguageModel language, String lang) {
  String lan = '';
  if (lang == 'uz') {
    lan = language.oz ?? '-';
  } else if (lang == 'uk') {
    lan = language.uz ?? '-';
  } else if (lang == 'ru') {
    lan = language.ru ?? '-';
  } else {
    lan = language.en ?? '-';
  }
  return lan;
}

String getStatusText(int status, String lang) {
  String lan = '';
  if (status == 1) {
    if (lang == 'uz') {
      lan = "Yangi";
    } else if (lang == 'uk') {
      lan = "Янги";
    } else if (lang == 'ru') {
      lan = "Hовый";
    } else {
      lan = "New";
    }
  } else if (status == 2) {
    if (lang == 'uz') {
      lan = "Ro'yxatga olingan";
    } else if (lang == 'uk') {
      lan = "Рўйхатга олинган";
    } else if (lang == 'ru') {
      lan = "Зарегистрирован";
    } else {
      lan = "Registered";
    }
  } else if (status == 3) {
    if (lang == 'uz') {
      lan = "Ko‘rib chiqishda";
    } else if (lang == 'uk') {
      lan = "Кўриб чиқишда";
    } else if (lang == 'ru') {
      lan = "Oбзоре";
    } else {
      lan = "Review";
    }
  } else {
    if (lang == 'uz') {
      lan = "Javob berilgan";
    } else if (lang == 'uk') {
      lan = "Жавоб берилган";
    } else if (lang == 'ru') {
      lan = "Ответил";
    } else {
      lan = "Answered";
    }
  }

  return lan;
}

String getLangString(String lang) {
  String lan = '';
  if (lang == 'uz') {
    lan = 'oz';
  } else if (lang == 'uk') {
    lan = 'uz';
  } else if (lang == 'ru') {
    lan = 'ru';
  } else {
    lan = 'en';
  }
  return lan;
}

String getImg(String img) {
  return "https://ombudsman.uz/$img";
}
