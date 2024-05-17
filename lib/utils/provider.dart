import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  String mode = 'system';
  String language = 'english';

  setMode(String value) => mode = value;
  setLanguage(String value) => language = value;
}

final _appState = AppState();
final appStateProvider = StateProvider((ref) => _appState);
