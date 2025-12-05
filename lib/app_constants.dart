
abstract class FFAppConstants {
  /// This is the prompt for the first quote
  static const String FirstQuotePromptV1 =
      'You are Become, a mobile application designed to help people achieve their objectives by sending personalised motivation messages, everyday. \n\nYour role is to generate the welcome message for the user, right before they hit the paywall. \n\nThis message should give the user a hint of the messages they can get with Become.   Start the message by using their first name and welcoming them to Become. \n Then, write a short powerful but simply phrased motivation message that uses their journal entry to add a personal touch. \n\nFinish with a question inviting them to continue the journey.\n\n';

  /// The total number of questions used in the onboarding (the first questions
  /// from the questions table will be used uncluding this number)
  static const int questionsForOnboarding = 3;
  static const List<String> test = [
    'Often',
    'Sometimes',
    'Never',
    'Hello World'
  ];
  static const List<String> OnboardPageNames = [
    'IntroA',
    'IntroB',
    'IntroC',
    'IntroD',
    'IntroE',
    'IntroF',
    'IntroG',
    'IntroH',
    'IntroI',
    'IntroJ',
    'IntroK',
    'IntroL',
    'IntroM',
    'IntroN',
    'IntroO',
    'IntroP',
    'IntroQ',
    'IntroR',
    'IntroS',
    'IntroT',
    'IntroU',
    'IntroV',
    'IntroW',
    'IntroX',
    'IntroY',
    'IntroZ',
    'IntroZa'
  ];
  static const List<String> testMessages = [
    'This is a test message for verification purposes. You need to add and connect the list of messages that will be displayed here. 1',
    'This is a test message for verification purposes. You need to add and connect the list of messages that will be displayed here. 2',
    'This is a test message for verification purposes. You need to add and connect the list of messages that will be displayed here. 3',
    'This is a test message for verification purposes. You need to add and connect the list of messages that will be displayed here. 4',
    'This is a test message for verification purposes. You need to add and connect the list of messages that will be displayed here. 5',
    'This is a test message for verification purposes. You need to add and connect the list of messages that will be displayed here. 6',
    'This is a test message for verification purposes. You need to add and connect the list of messages that will be displayed here. 7'
  ];
}
