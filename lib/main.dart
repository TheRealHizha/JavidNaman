import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math' as math;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class LanguageManager extends ChangeNotifier {
  Locale _currentLocale = const Locale('fa');

  Locale get currentLocale => _currentLocale;

  void setLanguage(String languageCode) {
    if (languageCode == 'ckb') {
      _currentLocale = const Locale('ckb', 'IQ');
    } else if (languageCode == 'az') {
      _currentLocale = const Locale('az', 'AZ');
    } else {
      _currentLocale = Locale(languageCode);
    }
    notifyListeners();
  }
}

class FallbackMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) => DefaultMaterialLocalizations.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<MaterialLocalizations> old) => false;
}

class FallbackCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) => DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<CupertinoLocalizations> old) => false;
}

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const Map<String, Map<String, String>> _translations = {
    'fa': {
      'lang_name': 'فارسی',
      'statistics_title': 'آمار جاویدنامان دی‌ماه ۱۴۰۴',
      'total_count': 'تعداد کل',
      'average_age': 'میانگین سن',
      'max_age': 'بیشترین سن',
      'min_age': 'کمترین سن',
      'top_cities': '۵ شهر با بیشترین آمار',
      'years': 'سال',
      'unknown': 'نامشخص',
      'people': 'نفر',
      'choose_language': 'زبان خود را انتخاب کنید',
      'skip': 'رد کردن',
      'restart': 'شروع مجدد',
      'web_warning': 'این صفحه ممکن است برای نسخه وب به درستی کار نکند. اگر اتفاقی نیفتاد، رد کردن را بزنید.',
      'statistics': 'آمار',
      'javidnaman': 'جاویدنامان',
      'poems': 'اشعار',
      'about': 'درباره ما',
      'search': 'جستجوی نام جاویدنامان...',
      'clear_filters': 'حذف فیلترها',
      'all_ages': 'همه سنین',
      'under_18': 'زیر ۱۸ سال',
      '18_30': '۱۸ تا ۳۰ سال',
      '31_45': '۳۱ تا ۴۵ سال',
      '46_60': '۴۶ تا ۶۰ سال',
      'over_60': 'بالای ۶۰ سال',
      'no_results': 'نتیجه‌ای یافت نشد!',
      'try_other_filters': 'سعی کنید فیلترهای دیگری را امتحان کنید',
      'showing_results': 'نمایش {count} نتیجه',
      'no_data': 'هیچ داده‌ای برای نمایش وجود ندارد',
      'place_of_sacrifice': 'محل جان باختن:',
      'intro_1': 'به نام نامی جاویدنامان وطن',
      'intro_2': 'نه یک تن، نه چندتن، هزاران هزارتن',
      'intro_3': 'خفته در خاک میهن',
      'intro_4': 'نرود از یاد',
      'intro_5': 'نامشان جاویدان باد',
      'poem_subject': 'موضوع:',
      'poem_line1': 'مصرع اول:',
      'poem_line2': 'مصرع دوم:',
      'poet': 'شاعر:',
    },
    'en': {
      'lang_name': 'English',
      'statistics_title': 'Javidnaman Statistics - January 2026',
      'total_count': 'Total',
      'average_age': 'Avg Age',
      'max_age': 'Max Age',
      'min_age': 'Min Age',
      'top_cities': 'Top 5 Cities',
      'years': 'Years',
      'unknown': 'Unknown',
      'people': 'People',
      'choose_language': 'Choose Your Language',
      'skip': 'Skip',
      'restart': 'Restart',
      'web_warning': 'This page may not work correctly on the web version. If nothing happens, click Skip.',
      'statistics': 'Statistics',
      'javidnaman': 'Javidnaman',
      'poems': 'Poems',
      'about': 'About',
      'search': 'Search Javidnaman names...',
      'clear_filters': 'Clear Filters',
      'all_ages': 'All Ages',
      'under_18': 'Under 18',
      '18_30': '18 to 30',
      '31_45': '31 to 45',
      '46_60': '46 to 60',
      'over_60': 'Over 60',
      'no_results': 'No results found!',
      'try_other_filters': 'Try changing your filters',
      'showing_results': 'Showing {count} results',
      'no_data': 'No data to display',
      'place_of_sacrifice': 'Place of sacrifice:',
      'intro_1': 'In the name of the immortal names of the homeland',
      'intro_2': 'Not one, not a few, but thousands upon thousands',
      'intro_3': 'Resting in the soil of the motherland',
      'intro_4': 'Never forgotten',
      'intro_5': 'May their names be eternal',
      'poem_subject': 'Subject:',
      'poem_line1': 'First Hemistich:',
      'poem_line2': 'Second Hemistich:',
      'poet': 'Poet:',
    },
    'ar': {
      'lang_name': 'العربية',
      'statistics_title': 'إحصاءات جاويدنامان - يناير 2026',
      'total_count': 'العدد الإجمالي',
      'average_age': 'متوسط العمر',
      'max_age': 'أكبر عمر',
      'min_age': 'أصغر عمر',
      'top_cities': 'أكثر 5 مدن',
      'years': 'سنة',
      'unknown': 'غير معروف',
      'people': 'شخص',
      'choose_language': 'اختر لغتك',
      'skip': 'تخطي',
      'restart': 'إعادة تشغيل',
      'web_warning': 'قد لا تعمل هذه الصفحة بشكل صحيح على إصدار الويب. إذا لم يحدث شيء، انقر فوق تخطي.',
      'statistics': 'إحصاءات',
      'javidnaman': 'جاويدنامان',
      'poems': 'قصائد',
      'about': 'حول',
      'search': 'بحث عن أسماء جاويدنامان...',
      'clear_filters': 'مسح الفلاتر',
      'all_ages': 'جميع الأعمار',
      'under_18': 'أقل من 18',
      '18_30': '18 إلى 30',
      '31_45': '31 إلى 45',
      '46_60': '46 إلى 60',
      'over_60': 'أكثر من 60',
      'no_results': 'لم يتم العثور على نتائج!',
      'try_other_filters': 'حاول تغيير الفلاتر الخاصة بك',
      'showing_results': 'عرض {count} نتيجة',
      'no_data': 'لا توجد بيانات للعرض',
      'place_of_sacrifice': 'مكان التضحية:',
      'intro_1': 'باسم الأسماء الخالدة للوطن',
      'intro_2': 'ليس واحداً، ولا عدة، بل الآلاف',
      'intro_3': 'رقدوا في تراب الوطن',
      'intro_4': 'لن يُنسى',
      'intro_5': 'فلتخلد أسماؤهم',
      'poem_subject': 'الموضوع:',
      'poem_line1': 'المصرع الأول:',
      'poem_line2': 'المصرع الثاني:',
      'poet': 'الشاعر:',
    },
    'ckb': {
      'lang_name': 'کوردی',
      'statistics_title': 'ئاماری جاویدنامان - بەفرانباری 2026',
      'total_count': 'ژمارەی گشتی',
      'average_age': 'تەمەنی میانگین',
      'max_age': 'بەرزترین تەمەن',
      'min_age': 'کەمترین تەمەن',
      'top_cities': '٥ شارە سەرەکییەکان',
      'years': 'ساڵ',
      'unknown': 'نەناسراو',
      'people': 'کەس',
      'choose_language': 'زمانەکەت هەڵبژێرە',
      'skip': 'پەڕینەوە',
      'restart': 'دەستپێکردنەوە',
      'web_warning': 'ئەم پەڕەیە لەوانەیە لە وەشانی وێب بە باشی کار نەکات. ئەگەر هیچ ڕوونەدا، کرتەی پەڕینەوە بکە.',
      'statistics': 'ئامار',
      'javidnaman': 'جاویدنامان',
      'poems': 'شعرەکان',
      'about': 'دەربارە',
      'search': 'گەڕان بە ناوی جاویدنامان...',
      'clear_filters': 'پاککردنەوەی فلتەرەکان',
      'all_ages': 'هەموو تەمەنەکان',
      'under_18': 'ژێر ١٨ ساڵ',
      '18_30': '١٨ تا ٣٠ ساڵ',
      '31_45': '٣١ تا ٤٥ ساڵ',
      '46_60': '٤٦ تا ٦٠ ساڵ',
      'over_60': 'سەرووی ٦٠ ساڵ',
      'no_results': 'هیچ ئەنجامێک نەدۆزرایەوە!',
      'try_other_filters': 'هەوڵبدە فلتەرەکانی تر تاقیبکەیتەوە',
      'showing_results': 'پیشاندانی {count} ئەنجام',
      'no_data': 'هیچ دیتایەک نییە بۆ نیشاندانی',
      'place_of_sacrifice': 'شوێنی گیانبەختکردن:',
      'intro_1': 'بە ناوی نەمرەکانی نیشتمان',
      'intro_2': 'نە یەک، نە چەند، بەڵکو هەزاران',
      'intro_3': 'که لە خاکی نیشتماندا ڕاکشاون',
      'intro_4': 'لەبیر ناچێت',
      'intro_5': 'با ناوەکانیان بە نەمری بمێنێت',
      'poem_subject': 'بابەت:',
      'poem_line1': 'مصرعی یەکەم:',
      'poem_line2': 'مصرعی دووەم:',
      'poet': 'شاعیر:',
    },
    'az': {
      'lang_name': 'Azərbaycan',
      'statistics_title': 'Javidnaman Statistikası - Yanvar 2026',
      'total_count': 'Ümumi say',
      'average_age': 'Orta yaş',
      'max_age': 'Maksimum yaş',
      'min_age': 'Minimum yaş',
      'top_cities': 'Top 5 Şəhər',
      'years': 'İl',
      'unknown': 'Naməlum',
      'people': 'Nəfər',
      'choose_language': 'Dilinizi Seçin',
      'skip': 'Keç',
      'restart': 'Yenidən başlat',
      'web_warning': 'Bu səhifə veb versiyasında düzgün işləməyə bilər. Bir şey baş verməsə, Keç düyməsini basın.',
      'statistics': 'Statistika',
      'javidnaman': 'Javidnaman',
      'poems': 'Şeirlər',
      'about': 'Haqqında',
      'search': 'Javidnaman adlarını axtar...',
      'clear_filters': 'Filtrləri təmizlə',
      'all_ages': 'Bütün yaşlar',
      'under_18': '18-dən aşağı',
      '18_30': '18-30 arası',
      '31_45': '31-45 arası',
      '46_60': '46-60 arası',
      'over_60': '60-dan yuxarı',
      'no_results': 'Nəticə tapılmadı!',
      'try_other_filters': 'Filtrləri dəyişdirin',
      'showing_results': '{count} nəticə göstərilir',
      'no_data': 'Göstəriləcək məlumat yoxdur',
      'place_of_sacrifice': 'Qurban yeri:',
      'intro_1': 'Vətənin əbədi adları ilə',
      'intro_2': 'Bir yox, bir neçə yox, minlərlə',
      'intro_3': 'Vətən torpağında yatır',
      'intro_4': 'Unudulmaz',
      'intro_5': 'Adları əbədi olsun',
      'poem_subject': 'Mövzu:',
      'poem_line1': 'Birinci misra:',
      'poem_line2': 'İkinci misra:',
      'poet': 'Şair:',
    },
  };

  String translate(String key, {Map<String, String>? params}) {
    String text = _translations[locale.languageCode]?[key] ?? _translations['fa']?[key] ?? key;
    if (params != null) {
      for (var entry in params.entries) {
        text = text.replaceAll('{${entry.key}}', entry.value);
      }
    }
    return text;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['fa', 'en', 'ar', 'ckb', 'az'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => Future.value(AppLocalizations(locale));

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

String toPersianNumber(int num) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  String result = num.toString();
  for (int i = 0; i < english.length; i++) {
    result = result.replaceAll(english[i], persian[i]);
  }
  return result;
}

String toPersianStringNumber(String str) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  String result = str;
  for (int i = 0; i < english.length; i++) {
    result = result.replaceAll(english[i], persian[i]);
  }
  return result;
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageManager(),
      child: const JavidnamApp(),
    ),
  );
}

class JavidnamApp extends StatelessWidget {
  const JavidnamApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageManager = Provider.of<LanguageManager>(context);
    final baseTextTheme = Theme.of(context).textTheme;
    final vazirTextTheme = TextTheme(
      displayLarge: GoogleFonts.vazirmatn(textStyle: baseTextTheme.displayLarge),
      displayMedium: GoogleFonts.vazirmatn(textStyle: baseTextTheme.displayMedium),
      displaySmall: GoogleFonts.vazirmatn(textStyle: baseTextTheme.displaySmall),
      headlineLarge: GoogleFonts.vazirmatn(textStyle: baseTextTheme.headlineLarge),
      headlineMedium: GoogleFonts.vazirmatn(textStyle: baseTextTheme.headlineMedium),
      headlineSmall: GoogleFonts.vazirmatn(textStyle: baseTextTheme.headlineSmall),
      titleLarge: GoogleFonts.vazirmatn(textStyle: baseTextTheme.titleLarge),
      titleMedium: GoogleFonts.vazirmatn(textStyle: baseTextTheme.titleMedium),
      titleSmall: GoogleFonts.vazirmatn(textStyle: baseTextTheme.titleSmall),
      bodyLarge: GoogleFonts.vazirmatn(textStyle: baseTextTheme.bodyLarge),
      bodyMedium: GoogleFonts.vazirmatn(textStyle: baseTextTheme.bodyMedium),
      bodySmall: GoogleFonts.vazirmatn(textStyle: baseTextTheme.bodySmall),
      labelLarge: GoogleFonts.vazirmatn(textStyle: baseTextTheme.labelLarge),
      labelMedium: GoogleFonts.vazirmatn(textStyle: baseTextTheme.labelMedium),
      labelSmall: GoogleFonts.vazirmatn(textStyle: baseTextTheme.labelSmall),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'جاویدنامان',
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FallbackMaterialLocalizationsDelegate(),
        FallbackCupertinoLocalizationsDelegate(),
      ],
      supportedLocales: const [
        Locale('fa'), 
        Locale('en'), 
        Locale('ar'), 
        Locale('ckb', 'IQ'), 
        Locale('az', 'AZ'),
      ],
      locale: languageManager.currentLocale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return const Locale('fa');
        
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        
        return const Locale('fa');
      },
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Vazirmatn',
        textTheme: vazirTextTheme,
        primaryTextTheme: vazirTextTheme,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE8B86D),
          secondary: Color(0xFFD4AF37),
          surface: Color(0xFF1A1A1A),
        ),
      ),
      home: const LanguageSelectionPage(),
    );
  }
}

class Javidnam {
  final String name;
  final String age;
  final String place;
  final String imageUrl;

  Javidnam({
    required this.name,
    required this.age,
    required this.place,
    required this.imageUrl,
  });

  factory Javidnam.fromJson(Map<String, dynamic> json) {
    String extractedName = json['name'] ?? '';
    if (extractedName.trim().isEmpty || extractedName == "نامشخص") {
      extractedName = "جاویدنام (نامشخص)";
    }

    String extractedAge = json['age'] ?? 'نامشخص';
    if (extractedAge == "۰") extractedAge = "نامشخص";
    
    return Javidnam(
      name: extractedName,
      age: extractedAge,
      place: json['place'] ?? 'نامشخص',
      imageUrl: json['image'] ?? '',
    );
  }
}

class Poem {
  final String title;
  final String poet;
  final String subject;
  final String line1;
  final String line2;

  Poem({
    required this.title,
    required this.poet,
    required this.subject,
    required this.line1,
    required this.line2,
  });

  factory Poem.fromJson(Map<String, dynamic> json) {
    String subject = 'نامشخص';
    if (json['موضوع'] != null && json['موضوع'].isNotEmpty) {
      subject = json['موضوع'][0];
    }

    return Poem(
      title: json['عنوان'] ?? 'بدون عنوان',
      poet: json['شاعر'] ?? 'ناشناس',
      subject: subject,
      line1: json['مصرع_اول'] ?? '',
      line2: json['مصرع_دوم'] ?? '',
    );
  }
}

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final List<String> _languages = ['fa', 'en', 'ar', 'ckb', 'az'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 800;
    final loc = AppLocalizations(Locale('fa'));

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/intro_bg.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.7)),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose Your Language',
                    style: TextStyle(
                      fontSize: isDesktop ? 48 : 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFE8B86D),
                      shadows: const [Shadow(color: Colors.black, blurRadius: 10)],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loc.translate('choose_language'),
                    style: TextStyle(
                      fontSize: isDesktop ? 24 : 18,
                      color: Colors.white70,
                      shadows: const [Shadow(color: Colors.black, blurRadius: 10)],
                    ),
                  ),
                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: _languages.map((langCode) {
                      final langName = AppLocalizations(Locale(langCode)).translate('lang_name');
                      return ElevatedButton(
                        onPressed: () {
                          context.read<LanguageManager>().setLanguage(langCode);
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const IntroPage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return FadeTransition(opacity: animation, child: child);
                              },
                              transitionDuration: const Duration(milliseconds: 1500),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A1A1A).withOpacity(0.9),
                          foregroundColor: const Color(0xFFE8B86D),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFFE8B86D), width: 1.5),
                          ),
                          elevation: 8,
                        ),
                        child: Text(
                          langName,
                          style: TextStyle(
                            fontSize: isDesktop ? 20 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with WidgetsBindingObserver {
  final AudioPlayer _player = AudioPlayer();
  
  int _currentSubtitleIndex = -1;
  bool _isSkipped = false;
  bool _isFinished = false;
  bool _isPausedByBackground = false;
  bool _isWebRecoveryMode = false;

  Uint8List? _audioBytes;
  int _elapsedMs = 0;
  final Stopwatch _stopwatch = Stopwatch();

  final List<Map<String, dynamic>> _timings = [
    {"start": 0, "end": 3000},
    {"start": 3000, "end": 9000},
    {"start": 9000, "end": 12000},
    {"start": 12000, "end": 15000},
    {"start": 15000, "end": 19500},
  ];

  final List<String> _subtitleKeys = [
    'intro_1',
    'intro_2',
    'intro_3',
    'intro_4',
    'intro_5',
  ];

  final List<Map<String, dynamic>> _colorRules = [
    {"word": "جاویدنامان", "color": Colors.red},
    {"word": "وطن", "color": Colors.green},
    {"word": "خاک میهن", "color": Colors.green},
    {"word": "جاویدان", "color": Colors.red},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadAudioAndStart();
  }

  Future<void> _loadAudioAndStart() async {
    try {
      final ByteData data = await rootBundle.load('assets/epic_music.mp3');
      _audioBytes = data.buffer.asUint8List();
      await _player.setSourceBytes(_audioBytes!);
      await _player.resume();
    } catch (e) {}
    _startIntro();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _isPausedByBackground = true;
      _stopwatch.stop();
      _player.pause();
    } else if (state == AppLifecycleState.resumed) {
      if (_isPausedByBackground && !_isSkipped && !_isFinished) {
        _isPausedByBackground = false;
        _stopwatch.start();
        _player.resume();
      } else if (_isPausedByBackground && _isFinished) {
        _isWebRecoveryMode = true;
        setState(() {});
      }
    }
  }

  void _startIntro() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
    }
    _runNextFrame();
  }

  void _runNextFrame() {
    if (_isSkipped || _isFinished) return;
    if (_isPausedByBackground) {
      Future.delayed(const Duration(milliseconds: 100), _runNextFrame);
      return;
    }

    final elapsed = _stopwatch.elapsedMilliseconds + _elapsedMs;
    
    int newIndex = -1;
    for (int i = 0; i < _timings.length; i++) {
      final t = _timings[i];
      if (elapsed >= t['start'] && elapsed < t['end']) {
        newIndex = i;
        break;
      }
    }

    if (newIndex != _currentSubtitleIndex) {
      if (mounted) setState(() => _currentSubtitleIndex = newIndex);
    }

    if (elapsed >= 19500) {
      _isFinished = true;
      _stopwatch.stop();
      if (mounted) {
        setState(() => _currentSubtitleIndex = -1);
        _navigateToMain();
      }
      return;
    }

    Future.delayed(const Duration(milliseconds: 50), _runNextFrame);
  }

  void _skipIntro() {
    if (_isSkipped) return;
    _stopwatch.stop();
    _player.stop();
    setState(() {
      _isSkipped = true;
    });
    _navigateToMain();
  }

  void _restartIntro() {
    _stopwatch.reset();
    _elapsedMs = 0;
    _isFinished = false;
    _isWebRecoveryMode = false;
    _currentSubtitleIndex = -1;
    
    try {
      _player.stop();
      _player.setSourceBytes(_audioBytes!);
      _player.resume();
    } catch (e) {}
    
    _startIntro();
    setState(() {});
  }

  void _navigateToMain() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const MainApp(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 1500),
        ),
      );
    }
  }

  Widget _buildColoredText(String text, Color defaultColor, double fontSize) {
    final languageCode = AppLocalizations.of(context).locale.languageCode;
    
    if (languageCode != 'fa') {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize, 
          fontWeight: FontWeight.bold, 
          color: defaultColor, 
          shadows: const [Shadow(color: Colors.black, blurRadius: 10)]
        ),
      );
    }

    List<TextSpan> spans = [];
    String remainingText = text;
    final sortedRules = List<Map<String, dynamic>>.from(_colorRules)
      ..sort((a, b) => b['word'].toString().length.compareTo(a['word'].toString().length));

    while (remainingText.isNotEmpty) {
      bool matched = false;
      for (var rule in sortedRules) {
        final word = rule['word'] as String;
        final color = rule['color'] as Color;
        
        if (remainingText.startsWith(word)) {
          spans.add(TextSpan(
            text: word, 
            style: TextStyle(
              color: color, 
              fontWeight: FontWeight.bold, 
              fontSize: fontSize, 
              shadows: const [Shadow(color: Colors.black, blurRadius: 10)]
            )
          ));
          remainingText = remainingText.substring(word.length);
          matched = true;
          break;
        }
      }
      if (!matched) {
        spans.add(TextSpan(
          text: remainingText[0], 
          style: TextStyle(
            color: defaultColor, 
            fontSize: fontSize, 
            shadows: const [Shadow(color: Colors.black, blurRadius: 10)]
          )
        ));
        remainingText = remainingText.substring(1);
      }
    }

    return RichText(
      textAlign: TextAlign.center, 
      text: TextSpan(
        style: const TextStyle(fontWeight: FontWeight.bold, height: 1.4), 
        children: spans
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 800;
    final bool isWebPlatform = kIsWeb;
    final loc = AppLocalizations.of(context);

    final double baseFontSize = isDesktop ? 64 : 36;
    final double currentFontSize = _currentSubtitleIndex == 1 || _currentSubtitleIndex == 4 ? baseFontSize * 0.7 : baseFontSize;
    final Color defaultColor = _currentSubtitleIndex == 4 ? const Color(0xFFE8B86D) : Colors.white70;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/intro_bg.jpg', 
              fit: BoxFit.cover, 
              alignment: Alignment.topCenter
            )
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentSubtitleIndex != -1)
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation, 
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.1), 
                              end: Offset.zero
                            ).animate(animation), 
                            child: child
                          )
                        );
                      },
                      child: Container(
                        key: ValueKey<int>(_currentSubtitleIndex),
                        constraints: BoxConstraints(
                          maxWidth: isDesktop ? 1000 : MediaQuery.of(context).size.width * 0.95
                        ),
                        child: _buildColoredText(
                          loc.translate(_subtitleKeys[_currentSubtitleIndex]),
                          defaultColor,
                          currentFontSize,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          Positioned(
            bottom: 60, 
            right: 40,
            child: TextButton(
              onPressed: _skipIntro,
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.6), 
                foregroundColor: Colors.white, 
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)), 
                side: const BorderSide(color: Colors.white24)
              ),
              child: Text(
                loc.translate('skip'), 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Vazirmatn')
              ),
            ),
          ),

          if (isWebPlatform && _isWebRecoveryMode)
            Positioned(
              bottom: 60, 
              left: 40,
              child: TextButton(
                onPressed: _restartIntro,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: Text(
                  loc.translate('restart'), 
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Vazirmatn')
                ),
              ),
            ),

          if (isWebPlatform)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    loc.translate('web_warning'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70, 
                      fontSize: 12, 
                      fontFamily: 'Vazirmatn', 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  List<Javidnam> _allMartyrs = [];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final languageManager = Provider.of<LanguageManager>(context);

    return FutureBuilder<List<Javidnam>>(
      future: _loadMartyrs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: Color(0xFFE8B86D))),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    const SizedBox(height: 20),
                    const Text(
                      "خطا در بارگذاری فایل JSON! مطمئن شوید فایل در پوشه assets است.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 16)
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => setState(() {}),
                      child: const Text("تلاش مجدد"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final martyrs = snapshot.data!;
        _allMartyrs = martyrs;

        final List<Widget> pages = [
          StatisticsPage(martyrs: _allMartyrs),
          MartyrsListPage(martyrs: _allMartyrs),
          const PoemsPage(),
          const PlaceholderPage(),
        ];

        final isRtl = languageManager.currentLocale.languageCode == 'fa' ||
                      languageManager.currentLocale.languageCode == 'ar' ||
                      languageManager.currentLocale.languageCode == 'ckb';

        return Scaffold(
          backgroundColor: const Color(0xFF121212),
          body: Directionality(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/persepolis_bg.jpg',
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.85),
                    colorBlendMode: BlendMode.darken,
                    errorBuilder: (c, o, s) => Container(color: const Color(0xFF121212)),
                  ),
                ),
                SafeArea(child: pages[_selectedIndex]),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFF1A1A1A).withOpacity(0.9),
            selectedItemColor: const Color(0xFFE8B86D),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontFamily: 'Vazirmatn', fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Vazirmatn'),
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.analytics_outlined),
                activeIcon: const Icon(Icons.analytics),
                label: loc.translate('statistics'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.people_outline),
                activeIcon: const Icon(Icons.people),
                label: loc.translate('javidnaman'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.menu_book_outlined),
                activeIcon: const Icon(Icons.menu_book),
                label: loc.translate('poems'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.info_outline),
                activeIcon: const Icon(Icons.info),
                label: loc.translate('about'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<List<Javidnam>> _loadMartyrs() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/javidnams_data.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      return jsonData.map((e) => Javidnam.fromJson(e)).toList();
    } catch (e) {
      throw Exception("خطا در بارگذاری داده‌ها: $e");
    }
  }
}

class StatisticsPage extends StatefulWidget {
  final List<Javidnam> martyrs;
  const StatisticsPage({super.key, required this.martyrs});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String _convertPersianToEnglish(String persianNumber) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String result = persianNumber;
    for (int i = 0; i < persian.length; i++) {
      result = result.replaceAll(persian[i], english[i]);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 800;
    final loc = AppLocalizations.of(context);

    final int total = widget.martyrs.length;
    
    final List<int> ages = widget.martyrs
        .map((e) {
          String englishAge = _convertPersianToEnglish(e.age);
          return int.tryParse(englishAge);
        })
        .whereType<int>()
        .toList();
        
    final double avgAge = ages.isNotEmpty 
        ? ages.reduce((a, b) => a + b) / ages.length 
        : 0;
        
    final int maxAge = ages.isNotEmpty ? ages.reduce(math.max) : 0;
    final int minAge = ages.isNotEmpty ? ages.reduce(math.min) : 0;

    final Map<String, int> cityMap = {};
    for (var m in widget.martyrs) {
      String place = m.place.trim();
      if (place.isNotEmpty && place != "نامشخص") {
        String city = place.contains(' ') ? place.split(' ').last : place;
        if (city.isNotEmpty && city != "نامشخص") {
          cityMap[city] = (cityMap[city] ?? 0) + 1;
        }
      }
    }
    
    final sortedCities = cityMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topCities = sortedCities.take(5).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                loc.translate('statistics_title'),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFE8B86D)),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildStatCard(context, loc.translate('total_count'), toPersianNumber(total), Icons.people, isDesktop),
                  _buildStatCard(
                    context,
                    loc.translate('average_age'),
                    avgAge > 0 ? "${toPersianStringNumber(avgAge.toStringAsFixed(1))} ${loc.translate('years')}" : loc.translate('unknown'),
                    Icons.calendar_today,
                    isDesktop,
                  ),
                  _buildStatCard(
                    context,
                    loc.translate('max_age'),
                    maxAge > 0 ? "${toPersianNumber(maxAge)} ${loc.translate('years')}" : loc.translate('unknown'),
                    Icons.arrow_upward,
                    isDesktop,
                  ),
                  _buildStatCard(
                    context,
                    loc.translate('min_age'),
                    minAge > 0 ? "${toPersianNumber(minAge)} ${loc.translate('years')}" : loc.translate('unknown'),
                    Icons.arrow_downward,
                    isDesktop,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                loc.translate('top_cities'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.red),
                ),
              const SizedBox(height: 16),
              if (topCities.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'هیچ داده‌ای برای نمایش وجود ندارد',
                      style: TextStyle(color: Color.fromARGB(255, 235, 15, 15), fontSize: 16),
                    ),
                  ),
                )
              else
                ...topCities.map((entry) => _buildChartBar(entry.key, entry.value, total, loc)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, bool isDesktop) {
    return Container(
      width: isDesktop ? 240 : double.infinity,
      constraints: const BoxConstraints(maxWidth: 400, minHeight: 90),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E).withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
          ),
          const SizedBox(width: 12),
          Icon(icon, color: const Color(0xFFE8B86D), size: 32),
        ],
      ),
    );
  }

  Widget _buildChartBar(String city, int count, int total, AppLocalizations loc) {
    final double percent = total > 0 ? count / total : 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              city,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: percent,
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8B86D),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 60,
            child: Text(
              "${toPersianNumber(count)} ${loc.translate('people')}",
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0xFFE8B86D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MartyrsListPage extends StatefulWidget {
  final List<Javidnam> martyrs;
  const MartyrsListPage({super.key, required this.martyrs});

  @override
  State<MartyrsListPage> createState() => _MartyrsListPageState();
}

class _MartyrsListPageState extends State<MartyrsListPage> {
  static const _pageSize = 30;
  final PagingController<int, Javidnam> _pagingController = PagingController(firstPageKey: 0);
  
  String _searchQuery = "";
  String _selectedCity = "همه";
  String _selectedAgeFilter = "همه سنین";

  List<String> get _allCities {
    final cities = widget.martyrs
        .map((e) {
          String place = e.place.trim();
          if (place.contains(' ')) {
            return place.split(' ').last;
          }
          return place;
        })
        .where((city) => city.isNotEmpty && city != "نامشخص")
        .toSet()
        .toList();
    cities.sort();
    return ["همه", ...cities];
  }

  final List<String> _ageFilterOptions = [
    "همه سنین",
    "زیر ۱۸ سال",
    "۱۸ تا ۳۰ سال",
    "۳۱ تا ۴۵ سال",
    "۴۶ تا ۶۰ سال",
    "بالای ۶۰ سال",
    "نامشخص",
  ];

  List<Javidnam> get _filteredMartyrs {
    List<Javidnam> list = widget.martyrs;
    
    if (_selectedCity != "همه") {
      list = list.where((m) {
        String place = m.place.trim();
        String city = place.contains(' ') ? place.split(' ').last : place;
        return city == _selectedCity;
      }).toList();
    }
    
    if (_selectedAgeFilter != "همه سنین") {
      list = list.where((m) {
        String englishAge = _convertPersianToEnglish(m.age);
        int? age = int.tryParse(englishAge);
        
        if (m.age == "نامشخص" || m.age == "۰") {
          return _selectedAgeFilter == "نامشخص";
        }
        
        if (age == null) return false;
        
        switch (_selectedAgeFilter) {
          case "زیر ۱۸ سال":
            return age < 18;
          case "۱۸ تا ۳۰ سال":
            return age >= 18 && age <= 30;
          case "۳۱ تا ۴۵ سال":
            return age >= 31 && age <= 45;
          case "۴۶ تا ۶۰ سال":
            return age >= 46 && age <= 60;
          case "بالای ۶۰ سال":
            return age > 60;
          default:
            return true;
        }
      }).toList();
    }
    
    if (_searchQuery.isNotEmpty) {
      list = list.where((m) {
        String searchLower = _searchQuery.trim().toLowerCase();
        String nameLower = m.name.trim().toLowerCase();
        return nameLower.contains(searchLower) || 
               nameLower.split(' ').any((word) => word.contains(searchLower));
      }).toList();
    }
    
    return list;
  }

  String _convertPersianToEnglish(String persianNumber) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String result = persianNumber;
    for (int i = 0; i < persian.length; i++) {
      result = result.replaceAll(persian[i], english[i]);
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _loadPage(pageKey);
    });
  }

  void _loadPage(int pageKey) {
    final filtered = _filteredMartyrs;
    final startIndex = pageKey * _pageSize;
    final endIndex = math.min(startIndex + _pageSize, filtered.length);
    
    Future.delayed(const Duration(milliseconds: 100), () {
      if (startIndex < filtered.length) {
        final newItems = filtered.sublist(startIndex, endIndex);
        final isLastPage = endIndex >= filtered.length;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          _pagingController.appendPage(newItems, pageKey + 1);
        }
      } else {
        _pagingController.appendLastPage([]);
      }
    });
  }

  void _refreshList() {
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loc = AppLocalizations.of(context);
    int crossAxisCount = 2;
    if (size.width > 600) crossAxisCount = 3;
    if (size.width > 1000) crossAxisCount = 5;
    if (size.width > 1400) crossAxisCount = 6;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A).withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFE8B86D).withOpacity(0.2)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFFE8B86D), size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        onChanged: (v) {
                          setState(() {
                            _searchQuery = v;
                            _refreshList();
                          });
                        },
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
                          hintText: loc.translate('search'),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (_searchQuery.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                        onPressed: () {
                          setState(() {
                            _searchQuery = "";
                            _refreshList();
                          });
                        },
                      ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCity,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCity = newValue!;
                              _refreshList();
                            });
                          },
                          dropdownColor: const Color(0xFF2A2A2A),
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFE8B86D)),
                          isExpanded: true,
                          items: _allCities.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: _selectedCity == value ? const Color(0xFFE8B86D) : Colors.white,
                                  fontWeight: _selectedCity == value ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 12),
                    
                    Container(
                      constraints: const BoxConstraints(maxWidth: 180),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedAgeFilter,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedAgeFilter = newValue!;
                              _refreshList();
                            });
                          },
                          dropdownColor: const Color(0xFF2A2A2A),
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFE8B86D)),
                          isExpanded: true,
                          items: _ageFilterOptions.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: _selectedAgeFilter == value ? const Color(0xFFE8B86D) : Colors.white,
                                  fontWeight: _selectedAgeFilter == value ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 12),
                    
                    if (_selectedCity != "همه" || _selectedAgeFilter != "همه سنین" || _searchQuery.isNotEmpty)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCity = "همه";
                            _selectedAgeFilter = "همه سنین";
                            _searchQuery = "";
                            _refreshList();
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red.withOpacity(0.2),
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.red.withOpacity(0.3)),
                          ),
                        ),
                        child: Text(
                          loc.translate('clear_filters'),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
              
              if (_filteredMartyrs.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    loc.translate('showing_results', params: {'count': toPersianNumber(_filteredMartyrs.length)}),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
        
        const SizedBox(height: 8),
        
        Expanded(
          child: PagedGridView<int, Javidnam>(
            pagingController: _pagingController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: size.width > 800 ? 0.85 : 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            builderDelegate: PagedChildBuilderDelegate<Javidnam>(
              itemBuilder: (context, martyr, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => DetailPage(martyr: martyr),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          return SlideTransition(position: animation.drive(tween), child: child);
                        },
                      ),
                    );
                  },
                  child: _buildCard(martyr, size.width),
                );
              },
              firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator(color: Color(0xFFE8B86D))),
              newPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator(color: Color(0xFFE8B86D))),
              noItemsFoundIndicatorBuilder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, color: Colors.grey[600], size: 60),
                    const SizedBox(height: 16),
                    Text(
                      loc.translate('no_results'),
                      style: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loc.translate('try_other_filters'),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(Javidnam martyr, double screenWidth) {
    final bool isDesktop = screenWidth > 800;
    
    String displayName = martyr.name.trim().isEmpty || martyr.name == "نامشخص" 
        ? "جاویدنام" 
        : martyr.name;
    
    String displayAge = martyr.age == "نامشخص" || martyr.age == "۰" 
        ? "سن: نامشخص" 
        : "سن: ${martyr.age}";
    
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E).withOpacity(0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8B86D).withOpacity(0.3)),
        boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'avatar_${martyr.name}',
            child: SizedBox(
              width: isDesktop ? 80 : 60,
              height: isDesktop ? 80 : 60,
              child: ClipOval(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (martyr.imageUrl.isNotEmpty)
                      DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(martyr.imageUrl),
                            fit: BoxFit.cover,
                            opacity: 0.3,
                          ),
                        ),
                      ),
                    Center(
                      child: martyr.imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: martyr.imageUrl,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                              placeholder: (context, url) => const SizedBox(width: 30, height: 30, child: CircularProgressIndicator(color: Color(0xFFE8B86D), strokeWidth: 2)),
                              errorWidget: (context, url, error) => const Icon(Icons.person, color: Colors.white, size: 30),
                            )
                          : const Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            displayName,
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            displayAge,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
          Text(
            martyr.place,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final Javidnam martyr;
  const DetailPage({super.key, required this.martyr});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;
  late Animation<double> _fadeAnimation4;

  late String _randomQuote;

  final List<String> _quotes = [
    "از خون جوانان وطن لاله دمیده 🌹",
    "این مرز و بوم، مزرعه ی عشق و وفاست 🦁☀",
    "یادت نرود که چه کسانی برای آزادی این مرز و بوم جان دادند 🥀",
  ];

  @override
  void initState() {
    super.initState();
    _randomQuote = _quotes[math.Random().nextInt(_quotes.length)];
    
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _fadeAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));
    _fadeAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.6, curve: Curves.easeOut)));
    _fadeAnimation3 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.8, curve: Curves.easeOut)));
    _fadeAnimation4 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0, curve: Curves.easeOut)));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 800;
    final loc = AppLocalizations.of(context);

    String displayName = widget.martyr.name.trim().isEmpty || widget.martyr.name == "نامشخص" 
        ? "جاویدنام" 
        : widget.martyr.name;
    
    String displayAge = widget.martyr.age == "نامشخص" || widget.martyr.age == "۰" 
        ? "سن: نامشخص" 
        : "سن: ${widget.martyr.age}";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/persepolis_bg.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.darken,
              errorBuilder: (c, o, s) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors: [Color(0xFF1A0F00), Color(0xFF0A0A0A)],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    children: [
                      FadeTransition(
                        opacity: _fadeAnimation1,
                        child: Hero(
                          tag: 'avatar_${widget.martyr.name}',
                          child: Container(
                            width: isDesktop ? 200 : 160,
                            height: isDesktop ? 200 : 160,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFE8B86D), width: 3),
                              boxShadow: const [BoxShadow(color: Color(0xFFE8B86D), blurRadius: 30, spreadRadius: 5, offset: Offset(0, 0))],
                            ),
                            child: ClipOval(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  if (widget.martyr.imageUrl.isNotEmpty)
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(widget.martyr.imageUrl),
                                          fit: BoxFit.cover,
                                          opacity: 0.2,
                                        ),
                                      ),
                                    ),
                                  Center(
                                    child: widget.martyr.imageUrl.isNotEmpty
                                        ? CachedNetworkImage(
                                            imageUrl: widget.martyr.imageUrl,
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.center,
                                            placeholder: (context, url) => const SizedBox(width: 60, height: 60, child: CircularProgressIndicator(color: Color(0xFFE8B86D), strokeWidth: 2)),
                                            errorWidget: (context, url, error) => const Icon(Icons.person, size: 60, color: Colors.grey),
                                          )
                                        : const Icon(Icons.person, size: 60, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeTransition(
                        opacity: _fadeAnimation2,
                        child: SlideTransition(
                          position: Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(_fadeAnimation2),
                          child: Text(
                            displayName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFF5F0E6), shadows: [Shadow(color: Colors.black, blurRadius: 20)], height: 1.2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FadeTransition(
                        opacity: _fadeAnimation3,
                        child: SlideTransition(
                          position: Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(_fadeAnimation3),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8B86D).withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: const Color(0xFFE8B86D).withOpacity(0.4)),
                                ),
                                child: Text(
                                  displayAge,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE8B86D)),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                loc.translate('place_of_sacrifice'),
                                style: const TextStyle(color: Colors.grey, letterSpacing: 1.0),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.martyr.place, 
                                textAlign: TextAlign.center, 
                                style: const TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.w500)
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeTransition(
                        opacity: _fadeAnimation4,
                        child: SlideTransition(
                          position: Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(_fadeAnimation4),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white10),
                            ),
                            child: Text(
                              _randomQuote,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.white70, fontSize: 15, height: 1.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PoemsPage extends StatefulWidget {
  const PoemsPage({super.key});

  @override
  State<PoemsPage> createState() => _PoemsPageState();
}

class _PoemsPageState extends State<PoemsPage> {
  static const _pageSize = 20;
  final PagingController<int, Poem> _pagingController = PagingController(firstPageKey: 0);
  
  String _searchQuery = "";
  String _selectedSubject = "همه";
  String _selectedPoet = "همه";

  List<Poem> _allPoems = [];
  List<Poem> _filteredPoems = [];
  
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      if (!_isLoading) {
        _loadPage(pageKey);
      }
    });
    
    _loadAllPoems();
  }

  Future<void> _loadAllPoems() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/poems.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> poemsData = jsonData['poems'];
      
      setState(() {
        _allPoems = poemsData.map((e) => Poem.fromJson(e)).toList();
        _filteredPoems = _allPoems;
        _isLoading = false;
        _errorMessage = null;
      });
      
      _pagingController.refresh();
      
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = "خطا در بارگذاری اشعار: $e";
      });
      print("Error loading poems: $e");
    }
  }

  void _loadPage(int pageKey) {
    final startIndex = pageKey * _pageSize;
    final endIndex = math.min(startIndex + _pageSize, _filteredPoems.length);
    
    Future.delayed(const Duration(milliseconds: 100), () {
      if (startIndex < _filteredPoems.length) {
        final newItems = _filteredPoems.sublist(startIndex, endIndex);
        final isLastPage = endIndex >= _filteredPoems.length;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          _pagingController.appendPage(newItems, pageKey + 1);
        }
      } else {
        _pagingController.appendLastPage([]);
      }
    });
  }

  void _applyFilters() {
    setState(() {
      _filteredPoems = _allPoems.where((poem) {
        if (_searchQuery.isNotEmpty) {
          String searchLower = _searchQuery.trim().toLowerCase();
          if (!poem.line1.toLowerCase().contains(searchLower) &&
              !poem.line2.toLowerCase().contains(searchLower) &&
              !poem.poet.toLowerCase().contains(searchLower)) {
            return false;
          }
        }

        if (_selectedSubject != "همه" && poem.subject != _selectedSubject) {
          return false;
        }

        if (_selectedPoet != "همه" && poem.poet != _selectedPoet) {
          return false;
        }

        return true;
      }).toList();
      
      _pagingController.refresh();
    });
  }

  List<String> get _allSubjects {
    final subjects = _allPoems.map((e) => e.subject).toSet().toList();
    subjects.sort();
    return ["همه", ...subjects];
  }

  List<String> get _allPoets {
    final poets = _allPoems.map((e) => e.poet).toSet().toList();
    poets.sort();
    return ["همه", ...poets];
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loc = AppLocalizations.of(context);
    int crossAxisCount = 2;
    if (size.width > 600) crossAxisCount = 3;
    if (size.width > 1000) crossAxisCount = 4;
    if (size.width > 1400) crossAxisCount = 5;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: Color(0xFFE8B86D)));
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 60),
            const SizedBox(height: 20),
            Text(
              _errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
                _loadAllPoems();
              },
              child: const Text("تلاش مجدد"),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A).withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFE8B86D).withOpacity(0.2)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFFE8B86D), size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        onChanged: (v) {
                          _searchQuery = v;
                          _applyFilters();
                        },
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'جستجو در اشعار...',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (_searchQuery.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                        onPressed: () {
                          _searchQuery = "";
                          _applyFilters();
                        },
                      ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedSubject,
                          onChanged: (String? newValue) {
                            _selectedSubject = newValue!;
                            _applyFilters();
                          },
                          dropdownColor: const Color(0xFF2A2A2A),
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFE8B86D)),
                          isExpanded: true,
                          items: _allSubjects.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: _selectedSubject == value ? const Color(0xFFE8B86D) : Colors.white,
                                  fontWeight: _selectedSubject == value ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 12),
                    
                    Container(
                      constraints: const BoxConstraints(maxWidth: 180),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedPoet,
                          onChanged: (String? newValue) {
                            _selectedPoet = newValue!;
                            _applyFilters();
                          },
                          dropdownColor: const Color(0xFF2A2A2A),
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFE8B86D)),
                          isExpanded: true,
                          items: _allPoets.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: _selectedPoet == value ? const Color(0xFFE8B86D) : Colors.white,
                                  fontWeight: _selectedPoet == value ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 12),
                    
                    if (_selectedSubject != "همه" || _selectedPoet != "همه" || _searchQuery.isNotEmpty)
                      TextButton(
                        onPressed: () {
                          _selectedSubject = "همه";
                          _selectedPoet = "همه";
                          _searchQuery = "";
                          _applyFilters();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red.withOpacity(0.2),
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.red.withOpacity(0.3)),
                          ),
                        ),
                        child: Text(
                          loc.translate('clear_filters'),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
              
              if (_filteredPoems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    loc.translate('showing_results', params: {'count': toPersianNumber(_filteredPoems.length)}),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
        
        const SizedBox(height: 8),
        
        Expanded(
          child: PagedGridView<int, Poem>(
            pagingController: _pagingController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: size.width > 800 ? 1.2 : 1.0,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            builderDelegate: PagedChildBuilderDelegate<Poem>(
              itemBuilder: (context, poem, index) {
                return _buildCard(poem, size.width);
              },
              firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator(color: Color(0xFFE8B86D))),
              newPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator(color: Color(0xFFE8B86D))),
              noItemsFoundIndicatorBuilder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, color: Colors.grey[600], size: 60),
                    const SizedBox(height: 16),
                    Text(
                      loc.translate('no_results'),
                      style: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loc.translate('try_other_filters'),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(Poem poem, double screenWidth) {
    final loc = AppLocalizations.of(context);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E).withOpacity(0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8B86D).withOpacity(0.2)),
        boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(0, 4))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // موضوع
          Text(
            "${loc.translate('poem_subject')} ${poem.subject}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Color(0xFFE8B86D),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            "${loc.translate('poem_line1')}\n${poem.line1}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 4),
          Text(
            "${loc.translate('poem_line2')}\n${poem.line2}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          const Spacer(),
          const Divider(color: Colors.white10),
          Text(
            "${loc.translate('poet')} ${poem.poet}",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
              fontStyle: FontStyle.italic,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 800;
    final loc = AppLocalizations.of(context);

    final Map<String, String> aboutTexts = {
      'fa': 'هدف از ساخت این اپلیکیشن فقط و فقط ازیاد نبردن اسامی جاویدنامان وطن است.\nبرای تجربه کاربری بهتر از V.P.N استفاده کنید.\nاسامی جاویدنامان مدام بروزرسانی خواهد شد 🥀\nپاینده ایران 🦁☀\nساخته شده توسط H1ZHA 👨‍💻❤',
      'en': 'The sole purpose of this application is to never forget the names of the Javidnaman of the homeland.\nFor a better user experience, use V.P.N.\nThe names of Javidnaman will be constantly updated 🥀\nLong live Iran 🦁☀\nMade by H1ZHA 👨‍💻❤',
      'ar': 'الغرض الوحيد من هذا التطبيق هو عدم نسيان أسماء جاويدنامان للوطن.\nلتجربة مستخدم أفضل، استخدم V.P.N.\nسيتم تحديث أسماء جاويدنامان باستمرار 🥀\nتحيا إيران 🦁☀\nصنع بواسطة H1ZHA 👨‍💻❤',
      'ckb': 'تەنها مەبەستی دروستکردنی ئەم ئەپە بریتییە لە لەبیرنەکردنی ناوەکانی جاویدنامانی نیشتمان.\nبۆ ئەزموونێکی باشتری بەکارهێنەر، V.P.N بەکاربهێنە.\nناوەکانی جاویدنامان بەردەوام نوێ دەکرێنەوە 🥀\nبژی ئێران 🦁☀\nدروستکراوە لەلایەن H1ZHA 👨‍💻❤',
      'az': 'Bu tətbiqin yeganə məqsədi vətənin Javidnaman adlarını unutmamaqdır.\nDaha yaxşı istifadəçi təcrübəsi üçün V.P.N istifadə edin.\nJavidnaman adları daim yenilənəcək 🥀\nYaşasın İran 🦁☀\nH1ZHA tərəfindən hazırlanmışdır 👨‍💻❤',
    };

    String aboutText = aboutTexts[loc.locale.languageCode] ?? aboutTexts['fa']!;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE8B86D).withOpacity(0.3), width: 2),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.local_florist, size: 60, color: Colors.red),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1A1A1A),
                      ),
                      child: const Icon(Icons.flag, size: 20, color: Color(0xFFE8B86D)),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            Text(
              loc.translate('about'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFE8B86D)),
            ),
            
            const SizedBox(height: 24),
            
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E).withOpacity(0.7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white10),
              ),
              child: Text(
                aboutText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 18 : 15,
                  color: Colors.white70,
                  height: 1.8,
                  fontFamily: 'Vazirmatn',
                ),
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: 80,
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xFFE8B86D).withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Icon(Icons.favorite, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Icon(Icons.favorite, color: Colors.red, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}