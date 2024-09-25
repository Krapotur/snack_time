import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/restaurant_list/bloc/restaurant_list_bloc.dart';

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
            'Пропало соединение с интернетом,',
            style: TextStyle(
                fontFamily: 'Playfair',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700.withOpacity(0.8)),
          ),
          Text(
            'проверьте ваше подключение к сети',
            style: TextStyle(
                fontFamily: 'Playfair',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700.withOpacity(0.8)),
          ),
          TextButton(
            child: const Text(
              'Попробовать снова',
              style: TextStyle(
                  fontFamily: 'Playfair',
                  fontSize: 17,
                  color: Color.fromARGB(255, 233, 123, 39)),
            ),
            onPressed: () => {
              BlocProvider.of<RestaurantListBloc>(context)
                  .add(LoadingRestaurantList()),
            },
          ),
        ],
      ),
    );
  }
}
