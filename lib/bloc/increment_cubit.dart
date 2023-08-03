import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/increment_state.dart';
import 'package:task/data_model/number_list_model.dart';

class IncrementCubit extends Cubit<IncrementState> {
  IncrementCubit() : super(const IncrementState(generatedListModel: []));

  /// Generate List of 100 number with default count value 0
  generateList() {
    List<GeneratedListModel> numberList = [];
    for (var i = 0; i <= 100; i++) {
      numberList.add(GeneratedListModel(count: 0, index: i));
    }
    emit(state.copyWith(generatedListModel: numberList));
  }

  /// Value Increment at specific index
  void incrementAtIndex(int index) {
    List<GeneratedListModel> numberList = state.generatedListModel ?? [];
    numberList[index].count = (numberList[index].count ?? 0) + 1;
    emit(state.copyWith(generatedListModel: []));
    emit(state.copyWith(generatedListModel: numberList));
  }
}
