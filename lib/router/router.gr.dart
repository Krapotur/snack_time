// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:snack_time/features/basket/view/basket_screen.dart' as _i1;
import 'package:snack_time/features/home/view/home_screen.dart' as _i2;
import 'package:snack_time/features/models/models.dart' as _i8;
import 'package:snack_time/features/profile/view/profile_screen.dart' as _i3;
import 'package:snack_time/features/restaurant/view/restaurant_screen.dart'
    as _i5;
import 'package:snack_time/features/restaurant_list/view/restaurant_list_screen.dart'
    as _i4;

/// generated route for
/// [_i1.BasketScreen]
class BasketRoute extends _i6.PageRouteInfo<void> {
  const BasketRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.BasketScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i4.RestaurantListScreen]
class RestaurantListRoute extends _i6.PageRouteInfo<void> {
  const RestaurantListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RestaurantListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.RestaurantListScreen();
    },
  );
}

/// generated route for
/// [_i5.RestaurantScreen]
class RestaurantRoute extends _i6.PageRouteInfo<RestaurantRouteArgs> {
  RestaurantRoute({
    _i7.Key? key,
    required _i8.Restaurant restaurant,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          RestaurantRoute.name,
          args: RestaurantRouteArgs(
            key: key,
            restaurant: restaurant,
          ),
          initialChildren: children,
        );

  static const String name = 'RestaurantRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RestaurantRouteArgs>();
      return _i5.RestaurantScreen(
        key: args.key,
        restaurant: args.restaurant,
      );
    },
  );
}

class RestaurantRouteArgs {
  const RestaurantRouteArgs({
    this.key,
    required this.restaurant,
  });

  final _i7.Key? key;

  final _i8.Restaurant restaurant;

  @override
  String toString() {
    return 'RestaurantRouteArgs{key: $key, restaurant: $restaurant}';
  }
}
