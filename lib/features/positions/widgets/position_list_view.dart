import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/ui/shared/widgets/loading_failure_widget.dart';

class PositionListView extends StatelessWidget {
  const PositionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PositionListBloc, PositionListState>(
        builder: (context, state) {
      if (state is PositionListLoading) {
        return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()));
      }

      if (state is PositionListLoaded) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          sliver: GridPositions(
            positionsList: state.positionsList,
          ),
        );
      }
      if (state is PositionListFailure) {
        return const SliverFillRemaining(
          child: LoadingFailureWidget(),
        );
      }
      return const SliverFillRemaining(
        child: LoadingFailureWidget(),
      );
    });
  }
}
