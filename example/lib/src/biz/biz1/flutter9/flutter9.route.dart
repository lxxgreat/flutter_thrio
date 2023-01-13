// Copyright (c) 2023 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter_thrio/flutter_thrio.dart';

class Flutter9Route extends NavigatorRouteLeaf {
  factory Flutter9Route(final NavigatorRouteNode parent) =>
      _instance ??= Flutter9Route._(parent);

  Flutter9Route._(super.parent);

  static Flutter9Route? _instance;

  @override
  String get name => 'flutter9';

  Future<TPopParams?> push<TParams, TPopParams>({
    final TParams? params,
    final bool animated = true,
    final NavigatorIntCallback? result,
  }) =>
      ThrioNavigator.push<TParams, TPopParams>(
        url: url,
        params: params,
        animated: animated,
        result: result,
      );
}