// Copyright (c) 2022 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter_thrio/flutter_thrio.dart';

import 'flutter1/flutter1.route.dart';
import 'flutter3/flutter3.route.dart';
import 'flutter5/flutter5.route.dart';

class Biz1Route extends NavigatorRouteNode {
  factory Biz1Route(final NavigatorRouteNode parent) => _instance ??= Biz1Route._(parent);

  Biz1Route._(super.parent);

  static Biz1Route? _instance;

  late final flutter1 = Flutter1Route(this);

  late final flutter3 = Flutter3Route(this);

  late final flutter5 = Flutter5Route(this);

  @override
  String get name => 'biz1';
}
