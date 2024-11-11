import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';

class BaseEmptyListWidget extends StatelessWidget {
  const BaseEmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning,
              size: 45, color: Color.fromARGB(255, 233, 123, 39)),
          const SizedBox(height: 5),
          const Text('Список пуст'),
          TextButton(
            child: const Text(
              'Обновить',
              style: TextStyle(
                  fontFamily: 'Playfair',
                  fontSize: 14,
                  color: Color.fromARGB(255, 233, 123, 39)),
            ),
            onPressed: () => {
              BlocProvider.of<PositionListBloc>(context)
                  .add(SearchPositionsListEvent(null)),
            },
          ),
        ],
      ),
    );
  }
}
