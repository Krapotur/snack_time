import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';

@RoutePage()
class PositionsScreen extends StatefulWidget {
  const PositionsScreen({super.key});

  @override
  State<PositionsScreen> createState() => PositionsScreenState();
}

class PositionsScreenState extends State<PositionsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        color: theme.primaryColor,
        onRefresh: () async {
          final completer = Completer();
          BlocProvider.of<PositionListBloc>(context)
              .add(SearchPositionsListEvent(completer));
          return completer.future;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text(
                'ITALIANO R&K',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 10.0),
                child: Text(
                  'Акции',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const EventsWidget(),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 10.0),
                child: Text(
                  'Вам понравится',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const OffersWidget(),
            const KaruselCategory(),
            const PositionListView(),
          ],
        ),
      ),
    );
  }
}
