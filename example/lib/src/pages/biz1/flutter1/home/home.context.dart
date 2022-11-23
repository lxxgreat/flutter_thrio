// Copyright (c) 2022 foxsofter.
//
// Do not edit this file.
//

part of 'home.page.dart';

extension HomeContext on ModuleContext {
  String? get stringKeyBiz1 => get<String?>('stringKeyBiz1');

  bool setStringKeyBiz1(final String value) => set<String>('stringKeyBiz1', value);

  Stream<String>? onStringKeyBiz1() => on<String>('stringKeyBiz1');

  int? get intKeyRootModule => get<int?>('intKeyRootModule');

  bool setIntKeyRootModule(final int value) => set<int>('intKeyRootModule', value);
}
