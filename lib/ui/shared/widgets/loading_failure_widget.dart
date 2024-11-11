import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';

class LoadingFailureWidget extends StatelessWidget {
  const LoadingFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.perm_scan_wifi_sharp,
            size: 50,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Сервер недоступен.',
            style: TextStyle(
                fontFamily: 'Playfair',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700.withOpacity(0.8)),
          ),
          Text(
            'Проверьте подключение к Интернету',
            style: TextStyle(
                fontFamily: 'Playfair',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700.withOpacity(0.8)),
          ),
          TextButton(
            child: Text(
              'Попробовать снова',
              style: TextStyle(
                  fontFamily: 'Playfair',
                  fontSize: 17,
                  color: Theme.of(context).primaryColor),
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
