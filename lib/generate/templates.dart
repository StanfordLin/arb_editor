


const String defaultFileTemplate = '''
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';
/// Callers can lookup localized strings with an instance of @className returned
/// by `@className.of(context)`.
///
/// Applications need to include `@className.delegate()` in their app\'s
/// localizationDelegates list, and the locales they support in the app\'s
/// supportedLocales list. For example:
///
/// ```
/// import '@importFile';
///
/// return MaterialApp(
///   localizationsDelegates: @className.localizationsDelegates,
///   supportedLocales: @className.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: 0.16.0
///   intl_translation: 0.17.7
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the @className.supportedLocales
/// property.
class @className {
  @className(Locale locale) : _localeName = Intl.canonicalizedLocale(locale.toString());
  final String _localeName;
  static Future<@className> load(Locale locale) {
    return initializeMessages(locale.toString())
      .then<@className>((_) => @className(locale));
  }
  static @className of(BuildContext context) {
    return Localizations.of<@className>(context, @className);
  }
  static const LocalizationsDelegate<@className> delegate = _@classNameDelegate();
  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  /// A list of this localizations delegate's supported locales.
  @supportedLocales
@classMethods
}
class _@classNameDelegate extends LocalizationsDelegate<@className> {
  const _@classNameDelegate();
  @override
  Future<@className> load(Locale locale) => @className.load(locale);
  @override
  bool isSupported(Locale locale) => <String>[@supportedLanguageCodes].contains(locale.languageCode);
  @override
  bool shouldReload(_@classNameDelegate old) => false;
}
''';

const String getterMethodTemplate = '''
  String get @methodName {
    return Intl.message(
      @message,
      locale: _localeName,
      @intlMethodArgs
    );
  }
''';

const String simpleMethodTemplate = '''
  String @methodName(@methodParameters) {@dateFormatting
    return Intl.message(
      @message,
      locale: _localeName,
      @intlMethodArgs
    );
  }
''';

const String pluralMethodTemplate = '''
  String @methodName(@methodParameters) {
    return Intl.plural(
      @intlMethodArgs
    );
  }
''';