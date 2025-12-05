import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _quoteBackgroundImage = prefs.getString('ff_quoteBackgroundImage')?.ref ??
          _quoteBackgroundImage;
    });
    _safeInit(() {
      _currentQuote = prefs.getString('ff_currentQuote')?.ref ?? _currentQuote;
    });
    _safeInit(() {
      _wallpaperUrls =
          prefs.getStringList('ff_wallpaperUrls') ?? _wallpaperUrls;
    });
    _safeInit(() {
      _BackgroundList = prefs
              .getStringList('ff_BackgroundList')
              ?.map((x) {
                try {
                  return BackgroundSettingsStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _BackgroundList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentSettins')) {
        try {
          final serializedData = prefs.getString('ff_currentSettins') ?? '{}';
          _currentSettins = BackgroundSettingsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _Categories = prefs
              .getStringList('ff_Categories')
              ?.map((x) {
                try {
                  return CategoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Categories;
    });
    _safeInit(() {
      _selectedCategories = prefs
              .getStringList('ff_selectedCategories')
              ?.map((x) {
                try {
                  return CategoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _selectedCategories;
    });
    _safeInit(() {
      _isCheckInPayWall =
          prefs.getBool('ff_isCheckInPayWall') ?? _isCheckInPayWall;
    });
    _safeInit(() {
      _askedRestartOnboarding =
          prefs.getBool('ff_askedRestartOnboarding') ?? _askedRestartOnboarding;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _quoteBackgroundImage =
      FirebaseFirestore.instance.doc('/wallpapers/ZjjxfvRSumq0XStM0Rio');
  DocumentReference? get quoteBackgroundImage => _quoteBackgroundImage;
  set quoteBackgroundImage(DocumentReference? value) {
    _quoteBackgroundImage = value;
    value != null
        ? prefs.setString('ff_quoteBackgroundImage', value.path)
        : prefs.remove('ff_quoteBackgroundImage');
  }

  DocumentReference? _defaultBackgroundImage =
      FirebaseFirestore.instance.doc('/wallpapers/x1qXKBsHyixF4vGgv0Oq');
  DocumentReference? get defaultBackgroundImage => _defaultBackgroundImage;
  set defaultBackgroundImage(DocumentReference? value) {
    _defaultBackgroundImage = value;
  }

  DocumentReference? _currentQuote;
  DocumentReference? get currentQuote => _currentQuote;
  set currentQuote(DocumentReference? value) {
    _currentQuote = value;
    value != null
        ? prefs.setString('ff_currentQuote', value.path)
        : prefs.remove('ff_currentQuote');
  }

  List<String> _wallpaperUrls = [];
  List<String> get wallpaperUrls => _wallpaperUrls;
  set wallpaperUrls(List<String> value) {
    _wallpaperUrls = value;
    prefs.setStringList('ff_wallpaperUrls', value);
  }

  void addToWallpaperUrls(String value) {
    wallpaperUrls.add(value);
    prefs.setStringList('ff_wallpaperUrls', _wallpaperUrls);
  }

  void removeFromWallpaperUrls(String value) {
    wallpaperUrls.remove(value);
    prefs.setStringList('ff_wallpaperUrls', _wallpaperUrls);
  }

  void removeAtIndexFromWallpaperUrls(int index) {
    wallpaperUrls.removeAt(index);
    prefs.setStringList('ff_wallpaperUrls', _wallpaperUrls);
  }

  void updateWallpaperUrlsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    wallpaperUrls[index] = updateFn(_wallpaperUrls[index]);
    prefs.setStringList('ff_wallpaperUrls', _wallpaperUrls);
  }

  void insertAtIndexInWallpaperUrls(int index, String value) {
    wallpaperUrls.insert(index, value);
    prefs.setStringList('ff_wallpaperUrls', _wallpaperUrls);
  }

  List<BackgroundSettingsStruct> _BackgroundList = [
    BackgroundSettingsStruct.fromSerializableMap(
        jsonDecode('{\"imageNumber\":\"1\",\"color\":\"#f9f8f5\"}')),
    BackgroundSettingsStruct.fromSerializableMap(
        jsonDecode('{\"imageNumber\":\"2\",\"color\":\"#2d2d2d\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"3\",\"color\":\"#f9f8f5\",\"isPay\":\"true\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"4\",\"color\":\"#f9f8f5\",\"isPay\":\"true\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"5\",\"color\":\"#f9f8f5\",\"isPay\":\"true\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"6\",\"color\":\"#2d2d2d\",\"isPay\":\"true\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"7\",\"color\":\"#2d2d2d\",\"isPay\":\"true\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"8\",\"color\":\"#f9f8f5\",\"isPay\":\"true\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"9\",\"color\":\"#f9f8f5\",\"isPay\":\"true\"}')),
    BackgroundSettingsStruct.fromSerializableMap(jsonDecode(
        '{\"imageNumber\":\"10\",\"color\":\"#f9f8f5\",\"isPay\":\"true\"}'))
  ];
  List<BackgroundSettingsStruct> get BackgroundList => _BackgroundList;
  set BackgroundList(List<BackgroundSettingsStruct> value) {
    _BackgroundList = value;
    prefs.setStringList(
        'ff_BackgroundList', value.map((x) => x.serialize()).toList());
  }

  void addToBackgroundList(BackgroundSettingsStruct value) {
    BackgroundList.add(value);
    prefs.setStringList('ff_BackgroundList',
        _BackgroundList.map((x) => x.serialize()).toList());
  }

  void removeFromBackgroundList(BackgroundSettingsStruct value) {
    BackgroundList.remove(value);
    prefs.setStringList('ff_BackgroundList',
        _BackgroundList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBackgroundList(int index) {
    BackgroundList.removeAt(index);
    prefs.setStringList('ff_BackgroundList',
        _BackgroundList.map((x) => x.serialize()).toList());
  }

  void updateBackgroundListAtIndex(
    int index,
    BackgroundSettingsStruct Function(BackgroundSettingsStruct) updateFn,
  ) {
    BackgroundList[index] = updateFn(_BackgroundList[index]);
    prefs.setStringList('ff_BackgroundList',
        _BackgroundList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBackgroundList(
      int index, BackgroundSettingsStruct value) {
    BackgroundList.insert(index, value);
    prefs.setStringList('ff_BackgroundList',
        _BackgroundList.map((x) => x.serialize()).toList());
  }

  BackgroundSettingsStruct _currentSettins =
      BackgroundSettingsStruct.fromSerializableMap(
          jsonDecode('{\"imageNumber\":\"1\",\"color\":\"#f9f8f5\"}'));
  BackgroundSettingsStruct get currentSettins => _currentSettins;
  set currentSettins(BackgroundSettingsStruct value) {
    _currentSettins = value;
    prefs.setString('ff_currentSettins', value.serialize());
  }

  void updateCurrentSettinsStruct(Function(BackgroundSettingsStruct) updateFn) {
    updateFn(_currentSettins);
    prefs.setString('ff_currentSettins', _currentSettins.serialize());
  }

  List<CategoryStruct> _Categories = [
    CategoryStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Grow Mode\",\"isPay\":\"false\",\"emoji\":\"📆\",\"subtitle\":\"Training the belief that you can improve through effort and repetition.\"}')),
    CategoryStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Lock-In\",\"isPay\":\"false\",\"emoji\":\"📌\",\"subtitle\":\"Building follow-through and self-leadership\"}')),
    CategoryStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Bounce Back\",\"isPay\":\"true\",\"emoji\":\"🧗‍♀️\",\"subtitle\":\"Recover from setbacks, handle adversity, and pivot under pressure.\"}')),
    CategoryStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Self-Trust\",\"isPay\":\"true\",\"emoji\":\"🤝\",\"subtitle\":\"Actions that build self-confidence through evidence, not hype.\"}')),
    CategoryStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Know Thyself\",\"isPay\":\"false\",\"emoji\":\"🧠\",\"subtitle\":\"Short prompts that build awareness, insight, and self-honesty.\"}')),
    CategoryStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Daily Drive\",\"isPay\":\"true\",\"emoji\":\"🚀\",\"subtitle\":\"Practical motivation that doesn\'t fade after five minutes\"}')),
    CategoryStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Rewrite the Rules\",\"isPay\":\"true\",\"emoji\":\"♻️\",\"subtitle\":\"Spotting, challenging, and replacing the narratives that hold you back.\"}'))
  ];
  List<CategoryStruct> get Categories => _Categories;
  set Categories(List<CategoryStruct> value) {
    _Categories = value;
    prefs.setStringList(
        'ff_Categories', value.map((x) => x.serialize()).toList());
  }

  void addToCategories(CategoryStruct value) {
    Categories.add(value);
    prefs.setStringList(
        'ff_Categories', _Categories.map((x) => x.serialize()).toList());
  }

  void removeFromCategories(CategoryStruct value) {
    Categories.remove(value);
    prefs.setStringList(
        'ff_Categories', _Categories.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategories(int index) {
    Categories.removeAt(index);
    prefs.setStringList(
        'ff_Categories', _Categories.map((x) => x.serialize()).toList());
  }

  void updateCategoriesAtIndex(
    int index,
    CategoryStruct Function(CategoryStruct) updateFn,
  ) {
    Categories[index] = updateFn(_Categories[index]);
    prefs.setStringList(
        'ff_Categories', _Categories.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategories(int index, CategoryStruct value) {
    Categories.insert(index, value);
    prefs.setStringList(
        'ff_Categories', _Categories.map((x) => x.serialize()).toList());
  }

  List<CategoryStruct> _selectedCategories = [];
  List<CategoryStruct> get selectedCategories => _selectedCategories;
  set selectedCategories(List<CategoryStruct> value) {
    _selectedCategories = value;
    prefs.setStringList(
        'ff_selectedCategories', value.map((x) => x.serialize()).toList());
  }

  void addToSelectedCategories(CategoryStruct value) {
    selectedCategories.add(value);
    prefs.setStringList('ff_selectedCategories',
        _selectedCategories.map((x) => x.serialize()).toList());
  }

  void removeFromSelectedCategories(CategoryStruct value) {
    selectedCategories.remove(value);
    prefs.setStringList('ff_selectedCategories',
        _selectedCategories.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSelectedCategories(int index) {
    selectedCategories.removeAt(index);
    prefs.setStringList('ff_selectedCategories',
        _selectedCategories.map((x) => x.serialize()).toList());
  }

  void updateSelectedCategoriesAtIndex(
    int index,
    CategoryStruct Function(CategoryStruct) updateFn,
  ) {
    selectedCategories[index] = updateFn(_selectedCategories[index]);
    prefs.setStringList('ff_selectedCategories',
        _selectedCategories.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSelectedCategories(int index, CategoryStruct value) {
    selectedCategories.insert(index, value);
    prefs.setStringList('ff_selectedCategories',
        _selectedCategories.map((x) => x.serialize()).toList());
  }

  bool _isCheckInPayWall = false;
  bool get isCheckInPayWall => _isCheckInPayWall;
  set isCheckInPayWall(bool value) {
    _isCheckInPayWall = value;
    prefs.setBool('ff_isCheckInPayWall', value);
  }

  bool _askedRestartOnboarding = false;
  bool get askedRestartOnboarding => _askedRestartOnboarding;
  set askedRestartOnboarding(bool value) {
    _askedRestartOnboarding = value;
    prefs.setBool('ff_askedRestartOnboarding', value);
  }

  final _wallpapersQueryManager =
      StreamRequestManager<List<WallpapersRecord>>();
  Stream<List<WallpapersRecord>> wallpapersQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<WallpapersRecord>> Function() requestFn,
  }) =>
      _wallpapersQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWallpapersQueryCache() => _wallpapersQueryManager.clear();
  void clearWallpapersQueryCacheKey(String? uniqueKey) =>
      _wallpapersQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
