import 'package:equatable/equatable.dart';
import 'package:task/data_model/number_list_model.dart';

class IncrementState extends Equatable {
  final List<GeneratedListModel>? generatedListModel;
  const IncrementState({this.generatedListModel});

  IncrementState copyWith({List<GeneratedListModel>? generatedListModel}) {
    return IncrementState(
        generatedListModel: generatedListModel ?? this.generatedListModel);
  }

  @override
  List<Object?> get props => [generatedListModel!];
}
