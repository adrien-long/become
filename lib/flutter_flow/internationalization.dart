import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Journal
  {
    'x0txumam': {
      'en': 'Journal',
      'fr': 'Journal',
    },
    'k9qp4g64': {
      'en':
          'Your answers help create personalized messages just for you. Tap to edit.',
      'fr':
          'Vos réponses aident à créer des messages personnalisés. Appuyez sur une question pour modifier votre réponse.',
    },
    'pdm2ltn2': {
      'en': 'Complete the onboarding process to define your goal. ',
      'fr': 'Complète le processus d\'inscription pour définir ton objectif.',
    },
    'g2wbf4b1': {
      'en': 'Onboarding',
      'fr': 'Démarrer',
    },
  },
  // Wall
  {
    '4utwlnjy': {
      'en':
          'Become brings you your daily dose of motivation. Feel free to leave us a comment, we’ll read it carefully!',
      'fr':
          'Become apporte ta dose journalière de motivation. N\'hésite pas à nous laisser un commentaire. Nous le lirons avec attention!',
    },
    '23bbtqk9': {
      'en': 'Become Premium',
      'fr': 'Become Premium',
    },
    'qjntpj70': {
      'en': 'Click here to subscribe to Become Premium',
      'fr': 'Clique ici pour t\'abonner à Become Premium',
    },
    '3zv3n5xt': {
      'en': 'You\'ve subscribed to Become Premium',
      'fr': 'Tu es abonné à Become Premium',
    },
    '9jjxlwds': {
      'en': 'Help us improve',
      'fr': 'Feedback',
    },
  },
  // Quotes
  {
    'kwl2nhu0': {
      'en': 'Messages',
      'fr': 'Messages',
    },
    '00pva7wm': {
      'en':
          'Click here to activate your subscription and receive your messages',
      'fr': 'Clique ici pour activer ta souscription et recevoir des messages',
    },
    '96j7awoz': {
      'en': 'Click here to complete the onboarding process',
      'fr': 'Clique ici pour compléter le processus d\'inscription',
    },
    '405g3k4b': {
      'en': 'Become',
      'fr': 'Become',
    },
  },
  // IntroB
  {
    'c3if8aoo': {
      'en':
          'We all have goals we want to achieve, but often lose motivation very quickly',
      'fr':
          'Nous avons tous des objectifs que nous voulons atteindre, mais nous perdons souvent notre motivation très rapidement.',
    },
    'itdhb9yw': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // FirstQuote
  {
    '5on4n3hn': {
      'en': 'Discover my first quote',
      'fr': 'Découvrir mon premier message',
    },
    'wu7imdl2': {
      'en': 'Receive these daily',
      'fr': 'Recevoir tous les jours',
    },
  },
  // Paywall
  {
    'd6dcjz3r': {
      'en': 'How your free trial works',
      'fr': 'Comment fonctionne votre essai gratuit',
    },
    'tgksoh87': {
      'en':
          'You have one week to try it out.\nYou won’t be charged anything today',
      'fr':
          'Become apporte ta dose journalière de motivation. N\'hésite pas à nous laisser un commentaire. Nous le lirons avec attention!',
    },
    'c13vly0l': {
      'en': 'Restore Purchase',
      'fr': 'Restaurer les achats',
    },
    '56y87g6f': {
      'en': 'See our  ',
      'fr': 'Voir nos ',
    },
    '10xplcw0': {
      'en': 'Terms of Use',
      'fr': 'Conditions d\'utilisation',
    },
    'm2vdnf20': {
      'en': ' & ',
      'fr': ' & ',
    },
    'zr99xomq': {
      'en': 'Privacy Policy',
      'fr': 'Politique de confidentialité',
    },
    'wgt9r6dh': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // Profile
  {
    '922d2c2x': {
      'en': 'Profile Information',
      'fr': 'Informations sur le profil',
    },
    'y5if9aim': {
      'en': 'First Name',
      'fr': 'Prénom',
    },
    'fgnhw5ld': {
      'en': 'Enter your first name',
      'fr': 'Entrez votre prénom',
    },
    'i58goopd': {
      'en': 'Save Changes',
      'fr': 'Enregistrer les modifications',
    },
    'n2ljyh00': {
      'en': 'Notification Settings',
      'fr': 'Paramètres de notification',
    },
    '33sjmfy4': {
      'en': 'Legal',
      'fr': 'Légal',
    },
    'tn774lew': {
      'en': 'Terms of Use',
      'fr': 'Conditions d\'utilisation',
    },
    'lffnp58k': {
      'en': 'Privacy Policy',
      'fr': 'Politique de confidentialité',
    },
    '0pkulali': {
      'en': 'About',
      'fr': 'À propos',
    },
    '1kek7sa4': {
      'en': 'Created by Nolca, July 2025',
      'fr': 'Créé par Nolca, juillet 2025',
    },
    'rnbpg3qm': {
      'en': 'Restart onboarding',
      'fr': 'Recommencer l\'onboarding',
    },
    '5idhnp4z': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
  },
  // EditJournalEntry
  {
    '3j1gmy9o': {
      'en': 'Type here...',
      'fr': 'Écrire ici...',
    },
    '6hsvscql': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
    'n4g5iuf6': {
      'en': 'Back',
      'fr': 'Retour',
    },
  },
  // Feedback
  {
    'o1rqk865': {
      'en': 'Send feedback',
      'fr': 'Envoyer des commentaires',
    },
    'me3vdcwl': {
      'en':
          'Your feedback is really precious to help us improve the app. Don\'t forget to leave your contact details if you want to be called back.',
      'fr':
          'Vos commentaires sont précieux pour nous aider à améliorer l\'application. N\'oubliez pas de laisser vos coordonnées si vous souhaitez être rappelé.',
    },
    'dxygjuar': {
      'en': 'Type here...',
      'fr': 'Écrire ici...',
    },
    'w0u0uvtl': {
      'en': 'Send',
      'fr': 'Envoyer',
    },
    'pllgwb7h': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
  },
  // IntroA
  {
    '8aeujk58': {
      'en': 'Get Started',
      'fr': 'Commencer',
    },
  },
  // IntroI
  {
    'mrwfybyh': {
      'en': 'What is your first name?',
      'fr': 'Quel est votre prénom?',
    },
    'sth018oy': {
      'en': 'Type here...',
      'fr': 'Écrire ici...',
    },
    'cvow04be': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroD
  {
    'i8vwa1lt': {
      'en': 'Do you experience motivation issues?',
      'fr': 'Avez-vous des problèmes de motivation ?',
    },
    'blilyajp': {
      'en': 'Very often',
      'fr': 'Très souvent',
    },
    'vkqf5ylv': {
      'en': 'Sometimes',
      'fr': 'Parfois',
    },
    'upai6o1q': {
      'en': 'Never',
      'fr': 'Jamais',
    },
    'pox2kwnf': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroF
  {
    'q3mqf14a': {
      'en': 'How old are you?',
      'fr': 'Quel âge as-tu?',
    },
    'bkvyucyf': {
      'en': '13-17',
      'fr': '13-17',
    },
    'eo4hny4y': {
      'en': '18-24',
      'fr': '18-24',
    },
    '4ornzu15': {
      'en': '25-34',
      'fr': '25-34',
    },
    't3vq92w2': {
      'en': '35-44',
      'fr': '35-44',
    },
    'fwhc5l1a': {
      'en': '45-54',
      'fr': '45-54',
    },
    'r1ogsxqk': {
      'en': '55+',
      'fr': '55+',
    },
    'q81e08dy': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroE
  {
    'p0a6a81d': {
      'en': 'What describe you best?',
      'fr': 'Qu\'est ce qui te décrit le mieux?',
    },
    'ag8onl9s': {
      'en': 'Male',
      'fr': 'Homme',
    },
    't4mwf9w2': {
      'en': 'Female',
      'fr': 'Femme',
    },
    '3u2ga6fa': {
      'en': 'Other',
      'fr': 'Autre',
    },
    'v45bbaqs': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroG
  {
    'cemvlo2t': {
      'en': 'Why do you think motivation fades?',
      'fr': 'Pourquoi penses-tu que la motivation s’estompe ?',
    },
    'b90xnct6': {
      'en': 'Lack of clear goals',
      'fr': 'Manque d\'objectifs clairs',
    },
    'w2vcy9lr': {
      'en': 'No visible progress',
      'fr': 'Aucun progrès visible',
    },
    '5p7sqj9l': {
      'en': 'Lack of support or accountability',
      'fr': 'Manque de soutien ',
    },
    'ugktcokh': {
      'en': 'Fear of failure',
      'fr': 'Peur de l\'échec',
    },
    'u0xupj9w': {
      'en': 'I’m too busy / not enough time',
      'fr': 'Je suis trop occupé / je n’ai pas assez de temps',
    },
    'qhpnwovm': {
      'en': 'Losing excitement over time',
      'fr': 'Perte d\'enthousiasme au fil du temps',
    },
    '44kolecd': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroH
  {
    'usf5nuh7': {
      'en': 'What do you think would help you the most?',
      'fr': 'Selon toi, qu’est-ce qui t\'aiderait le plus ?',
    },
    'iwcdl6xo': {
      'en': 'Motivation messages',
      'fr': 'Messages de motivation',
    },
    '04i1aq4l': {
      'en': ' Daily reminders / check-ins',
      'fr': 'Rappels quotidiens',
    },
    'ifdkvfvc': {
      'en': 'Inspiring success stories',
      'fr': 'Des histoires de réussite inspirantes',
    },
    '08njty1t': {
      'en': 'Positive self-talk & mindset tips',
      'fr': 'Conseils pour garder un état d\'esprit positif',
    },
    'dd4gj5pm': {
      'en': 'Reflect on wins and defeats / Journaling',
      'fr':
          'Des questions pour réfléchir aux réussites et défaites (journaling)',
    },
    'rzulzucr': {
      'en': 'Having an accountability partner*',
      'fr': 'Avoir un partenaire de soutien*',
    },
    '846xuzlg': {
      'en':
          '*An accountability partner is someone you intentionally agree to check in with about your goals, commitments',
      'fr':
          '*Un partenaire de soutien est une personne avec laquelle tu partages tes objectifs et ton progrès',
    },
    'l7jor04o': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroL
  {
    '7v7iebfs': {
      'en': 'Why Becomers love Become',
      'fr': 'Ce que la communauté des Becomers en dit',
    },
    'k1oa0xmp': {
      'en':
          '\"What a refreshing app. (...) So far, it’s helped me stay focused on my daily tasks and reminded me to be a more present parent. The design is clean, notifications are somehow always timely and a welcome boost to begin and end the day on a positive note.\"',
      'fr':
          '« Une appli vraiment rafraîchissante. (…) Elle m’aide à rester concentré sur mes tâches quotidiennes et à être un parent plus présent. Le design est épuré, les notifications arrivent toujours au bon moment et donnent un vrai coup de boost pour bien commencer et finir la journée. »',
    },
    '7xznc0fd': {
      'en': '★★★★★ — Flobertt, 34',
      'fr': '★★★★★ — Flobertt, 34',
    },
    '9pl95j8m': {
      'en':
          '“Love this app. The messages feel like a friend reminding me to keep going. I’ve stayed on track with my goals way longer than usual.” ',
      'fr':
          'J\'adore cette appli. Les messages sont comme un ami qui me rappelle de persévérer. J\'ai maintenu mes objectifs bien plus longtemps que d\'habitude.',
    },
    '1djcj9my': {
      'en': '★★★★★ — Emma, 25',
      'fr': '★★★★★ — Emma, 25',
    },
    'vqg4g6tt': {
      'en':
          '“Such a small thing but it works. I actually look forward to my daily message. It’s always a nice boost. And I change my goal when I need!” ',
      'fr':
          'C\'est un petit geste, mais ça marche. J\'attends mon message quotidien avec impatience. C\'est toujours un bon coup de pouce. Et je change d\'objectif quand j\'en ai besoin !',
    },
    'tvsrmu31': {
      'en': '★★★★★ — Lucas, 22',
      'fr': '★★★★★ — Lucas, 22',
    },
    'yah1p5o7': {
      'en': 'Continue',
      'fr': 'Définir mon objectif',
    },
  },
  // IntroC
  {
    '7bt1gz2o': {
      'en':
          'Become send you personalised messages to keep you motivated and inspired, every single day, to become who you want to be.',
      'fr':
          'Become t’envoie chaque jour des messages personnalisés pour rester motivé et inspiré, afin que tu deviennes la personne que tu souhaite.',
    },
    'nl43ptm1': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroJ
  {
    'o06g9geu': {
      'en': 'Next',
      'fr': 'Suivant',
    },
  },
  // IntroK
  {
    'rkejnk1s': {
      'en':
          'You will be able to define your goal in a second, but first, check why Becomers love the app',
      'fr':
          'Vous pourrez définir votre objectif en un instant, mais d\'abord, découvrez pourquoi les Becomers adorent l\'application',
    },
    'b8327y8x': {
      'en': 'Check reviews',
      'fr': 'Suivant',
    },
  },
  // IntroM
  {
    'jkk24um0': {
      'en':
          'The quality of your responses determine the quality of the message your receive',
      'fr':
          'La qualité de vos réponses détermine la qualité du message que vous recevez.',
    },
    '58yggo2o': {
      'en': 'Define my goal!',
      'fr': 'Définir mon objectif',
    },
  },
  // IntroPage
  {
    'jv0985bh': {
      'en': 'be\ncome',
      'fr': 'devenir',
    },
    'es7ha1wg': {
      'en': 'Adopt a life-changing\n mindset',
      'fr': 'Adoptez un état d\'esprit qui change la vie\n\n',
    },
    'pc6vkhy0': {
      'en': 'Type here...',
      'fr': 'Écrire ici...',
    },
    'up59g5y5': {
      'en': '',
      'fr': '',
    },
    'shwkiizb': {
      'en': 'Type here...',
      'fr': 'Écrire ici...',
    },
    'mr7gt6mn': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // QuotesNew
  {
    '4o060sf8': {
      'en':
          'Click here to activate your subscription and receive your messages',
      'fr': 'Clique ici pour activer ta souscription et recevoir des messages',
    },
    'czi1mw3l': {
      'en': 'Click here to complete the onboarding process',
      'fr': 'Clique ici pour compléter le processus d\'inscription',
    },
  },
  // NotificationSettings
  {
    'agn05gpd': {
      'en': 'Receive messages throughout the day',
      'fr': 'Recevez des devis tout au long de la journée',
    },
    'c9aignu8': {
      'en': 'Small doses of motivation can make a big difference',
      'fr':
          'De petites doses de motivation peuvent faire une grande différence',
    },
    'r9hqbhxu': {
      'en': 'Become',
      'fr': 'Motivation',
    },
    '65gqrs1s': {
      'en': 'Message text this',
      'fr': 'Texte du message',
    },
    'jplxka2o': {
      'en': 'How many',
      'fr': 'Combien',
    },
    'fq98d4hg': {
      'en': 'Start at:',
      'fr': 'Commencez par :',
    },
    'fb7l4ofs': {
      'en': 'Finish at:',
      'fr': 'Arrivée à :',
    },
    'fagn0rin': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Button
  {
    'd3r5m504': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
  },
  // screenshot
  {
    'rnq3bjt9': {
      'en': 'Become',
      'fr': 'Become',
    },
  },
  // SubscribeNudge
  {
    'een0bwu8': {
      'en': 'Get Become Premium to receive your daily inspirations!',
      'fr':
          'Obtenez Become Premium pour recevoir vos inspirations quotidiennes !',
    },
    '14zh9hg5': {
      'en': 'Subscribe',
      'fr': 'S\'abonner',
    },
  },
  // OnboardingNudge
  {
    'e5eiktif': {
      'en': 'Get Become Premium to receive your daily inspirations!',
      'fr':
          'Obtenez Become Premium pour recevoir vos inspirations quotidiennes !',
    },
    'ls8z6x77': {
      'en': 'Subscribe',
      'fr': 'S\'abonner',
    },
  },
  // BackgroundImagesSheet
  {
    '98az6url': {
      'en': 'Background images',
      'fr': 'Images d\'arrière-plan',
    },
  },
  // QuotesListSheet
  {
    'ff1hkc29': {
      'en': 'History',
      'fr': 'Historique',
    },
    'ojx4qkxn': {
      'en': 'Filter',
      'fr': 'Favoris',
    },
  },
  // SubmitQuoteSheet
  {
    'dxyhbzrg': {
      'en': 'Submit a message',
      'fr': 'Proposer un message',
    },
    'zybkbu56': {
      'en':
          'Messages submitted will be reviewed before being shared publicly. Only original content will be shared, unless the source is explicitely stated. ',
      'fr':
          'Les messages soumis seront examinés avant d\'être partagés publiquement. Seul le contenu original sera partagé, sauf mention explicite de la source.',
    },
    'dxist9jb': {
      'en': 'Type your quote here:',
      'fr': 'Saisissez votre citation ici :',
    },
    'f62ba3qh': {
      'en': 'Type here...',
      'fr': 'Saisissez votre texte ici...',
    },
    'c3g1j302': {
      'en': 'Nickname (public):',
      'fr': 'Surnom (public) :',
    },
    '8d4u7qny': {
      'en': 'Type here...',
      'fr': 'Saisissez votre texte ici...',
    },
    'oee0hmys': {
      'en': 'Select a theme...',
      'fr': 'Choisissez un thème...',
    },
    'gj0s4gkb': {
      'en': 'Submit for validation',
      'fr': 'Soumettre pour validation',
    },
  },
  // FeedbackToast
  {
    'q50exqbp': {
      'en': 'Help us improve your experience',
      'fr': 'Aidez-nous à améliorer votre expérience',
    },
    'v9bnk3n5': {
      'en': 'Click here to share your feedback',
      'fr': 'Cliquez ici pour nous faire part de vos commentaires',
    },
  },
  // FeedbackSheet
  {
    'tkaiq53y': {
      'en': 'Rate us to continue',
      'fr': 'Votre avis compte',
    },
    'oh23mg61': {
      'en': 'Leave us a note',
      'fr': 'Quelle note donnez vous à Become?',
    },
    'tt2a2bgz': {
      'en': 'Leave a comment (optional)',
      'fr': 'Laissez nous un commentaire (optionnel)',
    },
    'pne4xquc': {
      'en': 'Comment here...',
      'fr': 'Laisser un commentaire ici...',
    },
    'omsiz81f': {
      'en': 'Submit',
      'fr': 'Envoyer',
    },
  },
  // FeedbackItem
  {
    'k1mfsqd1': {
      'en': ' — ',
      'fr': '—',
    },
    'ok1eovk5': {
      'en': ', ',
      'fr': ',',
    },
    '0aa3hot0': {
      'en': '.',
      'fr': '.',
    },
    'ofgvyjbm': {
      'en': ' — Flobertt, 34',
      'fr': '★★★★★ — Flobertt, 34',
    },
  },
  // JournalSheet
  {
    '5zulyl3v': {
      'en': 'Journal',
      'fr': 'Journal',
    },
    '34wigjle': {
      'en':
          'Your answers help create personalized messages just for you. Tap to edit.',
      'fr':
          'Vos réponses aident à créer des messages personnalisés. Appuyez sur une question pour modifier votre réponse.',
    },
    '0pi0hw8b': {
      'en': 'Complete the onboarding process to define your goal. ',
      'fr': 'Complète le processus d\'inscription pour définir ton objectif.',
    },
    'iri4a53h': {
      'en': 'Onboarding',
      'fr': 'Démarrer',
    },
  },
  // WalSheet
  {
    '605hazbe': {
      'en':
          'Become brings you your daily dose of motivation. Feel free to leave us a comment, we’ll read it carefully!',
      'fr':
          'Become apporte ta dose journalière de motivation. N\'hésite pas à nous laisser un commentaire. Nous le lirons avec attention!',
    },
    'pm041xe2': {
      'en': 'Become Premium',
      'fr': 'Become Premium',
    },
    '6gd2pecw': {
      'en': 'Click here to subscribe to Become Premium',
      'fr': 'Clique ici pour t\'abonner à Become Premium',
    },
    '8b7agd1u': {
      'en': 'You\'ve subscribed to Become Premium',
      'fr': 'Tu es abonné à Become Premium',
    },
    '0dim3zor': {
      'en': 'Help us improve',
      'fr': 'Feedback',
    },
  },
  // ScreenshotNew
  {
    'w4prpac0': {
      'en': 'Become',
      'fr': 'Become',
    },
  },
  // BackgroundImagesSheetNew
  {
    'mritjylk': {
      'en': 'Choose a background',
      'fr': 'Images d\'arrière-plan',
    },
  },
  // BackgroundItem
  {
    'gj1cz166': {
      'en': 'Press to unlock',
      'fr': 'Appuyez pour déverrouiller',
    },
  },
  // QuotesLikedSheet
  {
    '8azjimc9': {
      'en': 'Favorites',
      'fr': 'Historique',
    },
  },
  // CategorySheet
  {
    'ot7oyfqj': {
      'en': 'Choose what you need the most right now',
      'fr': 'Choisissez ce dont vous avez le plus besoin en ce moment.',
    },
    '5frv054p': {
      'en':
          'You can choose one category or several if you want to make your own mix!',
      'fr':
          'Vous pouvez choisir une catégorie ou plusieurs si vous souhaitez créer votre propre mélange.',
    },
  },
  // QuotationsView
  {
    'qqwfg903': {
      'en': 'Become',
      'fr': 'Become',
    },
  },
  // Miscellaneous
  {
    'b9r1vhkc': {
      'en': 'Button',
      'fr': 'Bouton',
    },
    'hvqurzyw': {
      'en': 'Type here...',
      'fr': 'Écrire ici...',
    },
    '35t90s7d': {
      'en': 'Save Changes',
      'fr': 'Enregistrer les modifications',
    },
    'b170yi10': {
      'en': 'Type here...',
      'fr': 'Écrire ici...',
    },
    'ruz9t9jl': {
      'en': 'Turn on notifications to make the most of Become.',
      'fr': 'Activez les notifications pour profiter pleinement de Become.',
    },
    'rm8oo2mt': {
      'en': '',
      'fr': '',
    },
    'of2i22f4': {
      'en': '',
      'fr': '',
    },
    'usd899me': {
      'en': '',
      'fr': '',
    },
    '20yzmezi': {
      'en': '',
      'fr': '',
    },
    'v2pkl1j5': {
      'en': '',
      'fr': '',
    },
    'x8ue43ql': {
      'en': '',
      'fr': '',
    },
    '1dz6flho': {
      'en': '',
      'fr': '',
    },
    'dqoc2tbm': {
      'en': '',
      'fr': '',
    },
    '02h55hd3': {
      'en': '',
      'fr': '',
    },
    'iy5hrss9': {
      'en': '',
      'fr': '',
    },
    'wlixdigj': {
      'en': '',
      'fr': '',
    },
    '7l6pm8o1': {
      'en': '',
      'fr': '',
    },
    'imj1gwsx': {
      'en': '',
      'fr': '',
    },
    'xomjon7w': {
      'en': '',
      'fr': '',
    },
    'fbcfanpp': {
      'en': '',
      'fr': '',
    },
    '50gfaezr': {
      'en': '',
      'fr': '',
    },
    'b5uppnja': {
      'en': '',
      'fr': '',
    },
    'bu1zb2gd': {
      'en': '',
      'fr': '',
    },
    'em34snq4': {
      'en': '',
      'fr': '',
    },
    'c49qopi8': {
      'en': '',
      'fr': '',
    },
    'p6at8z44': {
      'en': '',
      'fr': '',
    },
    '61462jum': {
      'en': '',
      'fr': '',
    },
    'hguiawyf': {
      'en': '',
      'fr': '',
    },
    'm1sv6wnh': {
      'en': '',
      'fr': '',
    },
    'wu967s85': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
