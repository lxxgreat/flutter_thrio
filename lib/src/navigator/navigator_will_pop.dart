// The MIT License (MIT)
//
// Copyright (c) 2023 foxsofter
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import 'package:flutter/widgets.dart';

import 'navigator_will_pop_mixin.dart';

class NavigatorWillPop extends StatefulWidget {
  const NavigatorWillPop({
    super.key,
    required this.onWillPop,
    required this.internalNavigatorKey,
    required this.child,
  });

  final Future<bool> Function() onWillPop;
  final GlobalKey<NavigatorState> internalNavigatorKey;
  final Widget child;

  static NavigatorObserver navigatorObserverFor(
    final GlobalKey<NavigatorState> navigatorStateKey,
  ) =>
      NavigatorWillPopMixin.navigatorObserverFor(navigatorStateKey);

  @override
  _NavigatorWillPopState createState() => _NavigatorWillPopState();
}

class _NavigatorWillPopState extends State<NavigatorWillPop>
    with NavigatorWillPopMixin {
  @override
  Widget build(final BuildContext context) => widget.child;

  @override
  Future<bool> onWillPop() => widget.onWillPop();

  @override
  GlobalKey<NavigatorState> get internalNavigatorKey =>
      widget.internalNavigatorKey;
}
