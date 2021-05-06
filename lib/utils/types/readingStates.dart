import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/utils/types/readingState.dart';

class ReadingStates {
  static get abandoned => ReadingState(name: kAbandoned);
  static get ended => ReadingState(name: kEnded);
  static get planning => ReadingState(name: kPlanning);

  static List<ReadingState> listOfStates() {
    return <ReadingState>[
      abandoned,
      ended,
      planning,
    ];
  }

  static ReadingState fromString(String name) {
    for (ReadingState state in listOfStates()) {
      if (state.name == name) return state;
    }
    throw new Exception('State with given name does not exists!');
  }
}
