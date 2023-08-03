import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/increment_cubit.dart';
import 'package:task/bloc/increment_state.dart';
import 'package:task/data_model/number_list_model.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    IncrementCubit? incrementCubit =
        BlocProvider.of<IncrementCubit>(context, listen: false);
    incrementCubit.generateList();

    return Scaffold(
      body: SafeArea(

        child: BlocBuilder<IncrementCubit, IncrementState>(
            builder: (context, state) {
          return ListView.builder(
              itemCount: (state.generatedListModel ?? []).length,
              itemBuilder: (context, index) {
                return ListItemWidget(
                    generatedListModel: (state.generatedListModel ?? [])[index]);
              });
        }),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final GeneratedListModel? generatedListModel;
  const ListItemWidget({super.key, this.generatedListModel});

  @override
  Widget build(BuildContext context) {
    IncrementCubit? incrementCubit =
        BlocProvider.of<IncrementCubit>(context, listen: false);

    return Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text((generatedListModel?.count ?? 0).toString()),
            MaterialButton(
              onPressed: () {
                incrementCubit.incrementAtIndex(generatedListModel?.index ?? 0);
              },
              child: const Text("+"),
            )
          ],
        ));
  }
}
