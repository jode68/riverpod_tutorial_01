import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template68/models/app_model.dart';
import 'package:template68/provider/app_test.dart';

class AppProvider extends StateNotifier<List<AppModel>> {
  AppProvider() : super(appMyList);

  void init() {
    state = appMyList;
  }

  void isDone(int index) {
    state = [
      ...state..[index] = state[index].copyWith(isDone: !state[index].isDone)
    ];
  }

  void addItem(AppModel appModel) {
    state = [...state, appModel];
  }

  void removeItem(int index) {
    state = [...state..removeAt(index)];
  }

  void editItem(AppModel appModel, int index) {
    state = [...state..[index] = appModel];
  }
}

final appProvider = StateNotifierProvider<AppProvider, List<AppModel>>(
  (ref) {
    return AppProvider();
  },
);
