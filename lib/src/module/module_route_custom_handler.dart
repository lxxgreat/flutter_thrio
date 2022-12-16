// The MIT License (MIT)
//
// Copyright (c) 2022 foxsofter
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

import 'package:flutter/foundation.dart';
import 'package:uri/uri.dart';

import '../exception/thrio_exception.dart';
import '../navigator/navigator_url_template.dart';
import 'module_anchor.dart';
import 'module_types.dart';
import 'thrio_module.dart';

mixin ModuleRouteCustomHandler on ThrioModule {
  /// Register a route custom handler.
  ///
  /// Unregistry by calling the return value `VoidCallback`.
  ///
  @protected
  VoidCallback registerRouteCustomHandler(
    final String template,
    final NavigatorRouteCustomHandler handler, {
    final bool queryParamsAreOptional = false,
  }) {
    var scheme = '';
    var host = '';
    var path = '';
    var tem = template;
    final parts = template.split('://');
    if (parts.length > 2) {
      throw ThrioException('inivalid template: $template');
    } else if (parts.length == 2) {
      scheme = parts[0].toLowerCase();
      final subParts = parts[1].split('/');
      host = subParts[0];
      if (subParts.length > 1) {
        tem = '/${subParts.getRange(1, subParts.length).join('/')}';
        path = tem.split('{')[0];
      } else {
        tem = '';
      }
    } else {
      path = template.split('{')[0];
    }
    final parser = tem.isEmpty
        ? null
        : UriParser(UriTemplate(tem),
            queryParamsAreOptional: queryParamsAreOptional);
    final key = NavigatorUrlTemplate(
        scheme: scheme, host: host, path: path, parser: parser);
    if (anchor.customHandlers.keys.contains(key)) {
      throw ThrioException('duplicate url template: $template');
    }
    return anchor.customHandlers.registry(key, handler);
  }

  /// A function for register a `NavigatorRouteCustomHandler` .
  ///
  @protected
  void onRouteCustomHandlerRegister(final ModuleContext moduleContext) {}
}
