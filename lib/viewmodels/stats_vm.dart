import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:flutter/cupertino.dart';

class StatsViewModel extends ChangeNotifier {
  List<String> _stateTitles =
      ReadingStates.listOfStates().map((e) => e.name).toList();
  List<String> get statesTitles => _stateTitles;

  String _currentState = ReadingStates.ended.toString();
  String get currentState => _currentState;
}
