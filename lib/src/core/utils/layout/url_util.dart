import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  UrlUtil._();

  static Future<bool> launch(
    BuildContext context, {
    required String url,
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    try {
      String newUrl = url;
      if (url.length >= 5 && url.substring(0, 5).contains('http')) {
        newUrl = url;
      } else {
        newUrl = 'https://$url';
      }
      final uri = Uri.parse(newUrl);

      return launchUrl(
        uri,
        mode: mode,
      );
    } catch (e) {
      log('$e', name: 'UrlUtil');

      Toaster.showErrorTopShortToast(
        context,
        'Неправильный формат ссылки',
      );
      return false;
    }
  }

  // static Future<bool> launchPhoneUrl(
  //   BuildContext context, {
  //   required String phone,
  // }) async {
  //   try {
  //     final Uri phoneLaunchUri = Uri(
  //       scheme: 'tel',
  //       path: phone,
  //     );

  //     return launchUrl(phoneLaunchUri);
  //   } catch (e) {
  //     log('$e', name: 'UrlUtil');

  //     Toaster.showErrorTopShortToast(context, context.localized.invalidNumberFormat);
  //     return false;
  //   }
  // }

  // static Future<bool> launchSMSUrl(
  //   BuildContext context, {
  //   required String phone,
  // }) async {
  //   try {
  //     final Uri phoneLaunchUri = Uri(
  //       scheme: 'sms',
  //       path: phone,
  //     );

  //     return launchUrl(phoneLaunchUri);
  //   } catch (e) {
  //     log('$e', name: 'UrlUtil');

  //     Toaster.showErrorTopShortToast(context, context.localized.invalidNumberFormat);
  //     return false;
  //   }
  // }

  // static Future<bool> launchEmailUrl(
  //   BuildContext context, {
  //   required String email,
  //   String? subject,
  // }) async {
  //   try {
  //     final Uri phoneLaunchUri = Uri(
  //       scheme: 'mailto',
  //       path: email,
  //       query: subject != null ? "subject=$subject" : null,
  //     );
  //     return launchUrl(phoneLaunchUri);
  //   } catch (e) {
  //     log('$e', name: 'UrlUtil');
  //     Toaster.showErrorTopShortToast(context, context.localized.incorrectEmailFormat);
  //     return false;
  //   }
  // }

  // static Future<bool> launchWhatsappUrl(
  //   BuildContext context, {
  //   required String phone,
  //   String? text,
  // }) async {
  //   final String whatsapp = phone;
  //   final String whatappUrlIos = "https://wa.me/$whatsapp";
  //   try {
  //     final Uri phoneLaunchUri = Uri.parse(
  //       whatappUrlIos,
  //     ).replace(
  //       queryParameters: {
  //         if (text != null) 'text': text,
  //       },
  //     );
  //     return launchUrl(phoneLaunchUri, mode: LaunchMode.externalApplication);
  //   } catch (e) {
  //     log('$e', name: 'UrlUtil');
  //     Toaster.showErrorTopShortToast(context, context.localized.invalidNumberFormat);
  //     return false;
  //   }
  // }
}
