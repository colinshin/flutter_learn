import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appName => "Flutter Learn";
  String get autoBySystem => "Auto";
  String get back => "back";
  String get blue => "Twitter blue";
  String get chinese => "简体中文";
  String get choiceFont => "Choice font";
  String get choiceLanguage => "Choice language";
  String get choiceTheme => "Choice theme";
  String get darkMode => "Dark Mode";
  String get english => "English";
  String get forgetPassword => "forget password";
  String get forward => "forward";
  String get green => "WeChat green";
  String get hintEnterAccount => "your account number";
  String get hintEnterCode => "verification code";
  String get hintEnterPassword => "your password";
  String get hintEnterPhone => "your phone number";
  String get login => "Login";
  String get loginPage => "Login Page";
  String get moviePage => "Movie Page";
  String get nextStep => "next step";
  String get orange => "Didi orange";
  String get purple => "Kuake purple";
  String get red => "Wangyi red";
  String get refresh => "refresh";
  String get register => "register";
  String get registerAgreement => "registration agreement";
  String get registerAnd => "and";
  String get registerHadAccount => "had account?";
  String get registerIRead => "I have read";
  String get registerPrivacyProtocol => "privacy protocol";
  String get registerRightNow => "register now";
  String get runningHand => "Tensentype running hand";
  String get share => "share";
  String get starCandy => "Star candy";
  String get weChatLogin => "login by we chat";
  String get webViewPage => "Web Page";
}

class $en extends S {
  const $en();
}

class $zh_CN extends S {
  const $zh_CN();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get forgetPassword => "忘记密码";
  @override
  String get back => "后退";
  @override
  String get runningHand => "腾祥伯当行书";
  @override
  String get login => "登录";
  @override
  String get red => "网易红";
  @override
  String get webViewPage => "网页";
  @override
  String get registerHadAccount => "已有账号？";
  @override
  String get moviePage => "豆瓣电影";
  @override
  String get starCandy => "繁星糖果";
  @override
  String get share => "分享";
  @override
  String get loginPage => "登录页";
  @override
  String get autoBySystem => "跟随系统";
  @override
  String get registerIRead => "我已阅读";
  @override
  String get hintEnterPhone => "请输入手机号";
  @override
  String get green => "微信绿";
  @override
  String get appName => "学Flutter";
  @override
  String get forward => "前进";
  @override
  String get choiceTheme => "选择主题";
  @override
  String get refresh => "刷新";
  @override
  String get registerAnd => "和";
  @override
  String get orange => "滴滴橙";
  @override
  String get registerAgreement => "注册协议";
  @override
  String get blue => "推特蓝";
  @override
  String get choiceFont => "选择字体";
  @override
  String get hintEnterAccount => "请输入账号";
  @override
  String get hintEnterPassword => "请输入密码";
  @override
  String get hintEnterCode => "请输入验证码";
  @override
  String get purple => "夸克紫";
  @override
  String get nextStep => "下一步";
  @override
  String get darkMode => "黑夜模式";
  @override
  String get choiceLanguage => "选择语言";
  @override
  String get weChatLogin => "微信登录";
  @override
  String get registerPrivacyProtocol => "隐私协议";
  @override
  String get registerRightNow => "立即注册";
  @override
  String get register => "注册";
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("zh", "CN"),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        case "zh_CN":
          S.current = const $zh_CN();
          return SynchronousFuture<S>(S.current);
        default:
          // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
