// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:snack_time/features/cart/view/cart_screen.dart' as _i1;
import 'package:snack_time/features/home/view/home_screen.dart' as _i2;
import 'package:snack_time/features/orders_list/view/orders_list_screen.dart'
    as _i3;
import 'package:snack_time/features/positions/view/positions_screen.dart'
    as _i4;
import 'package:snack_time/features/profile/view/profile_screen.dart' as _i5;
import 'package:snack_time/features/registration_order.dart/view/registration_order_screen.dart'
    as _i6;
import 'package:snack_time/repositories/models.dart' as _i9;

/// generated route for
/// [_i1.CartScreen]
class CartRoute extends _i7.PageRouteInfo<void> {
  const CartRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.OrdersListScreen]
class OrdersListRoute extends _i7.PageRouteInfo<void> {
  const OrdersListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OrdersListRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.OrdersListScreen();
    },
  );
}

/// generated route for
/// [_i4.PositionsScreen]
class PositionsRoute extends _i7.PageRouteInfo<void> {
  const PositionsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PositionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PositionsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.PositionsScreen();
    },
  );
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i6.RegistrationOrderScreen]
class RegistrationOrderRoute
    extends _i7.PageRouteInfo<RegistrationOrderRouteArgs> {
  RegistrationOrderRoute({
    _i8.Key? key,
    required List<_i9.Position> positions,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          RegistrationOrderRoute.name,
          args: RegistrationOrderRouteArgs(
            key: key,
            positions: positions,
          ),
          initialChildren: children,
        );

  static const String name = 'RegistrationOrderRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegistrationOrderRouteArgs>();
      return _i6.RegistrationOrderScreen(
        key: args.key,
        positions: args.positions,
      );
    },
  );
}

class RegistrationOrderRouteArgs {
  const RegistrationOrderRouteArgs({
    this.key,
    required this.positions,
  });

  final _i8.Key? key;

  final List<_i9.Position> positions;

  @override
  String toString() {
    return 'RegistrationOrderRouteArgs{key: $key, positions: $positions}';
  }
}
