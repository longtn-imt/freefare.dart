/// This library contains a workaround neccessary to open dynamic libraries on
/// old Android versions (6.0.1).
///
/// The purpose of the `freefare_flutter_libs` package is to provide `freefare`
/// native libraries when building Flutter apps for Android and iOS.
library freefare_flutter_libs;

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';

const _platform = MethodChannel('freefare_flutter_libs');

/// Workaround to open freefare on old Android versions.
///
/// On old Android versions, this method can help if you're having issues
/// opening freefare (e.g. if you're seeing crashes about `libfreefare.so` not
/// being available). To be safe, call this method before using apis from
/// `package:freefare` or `package:moor/ffi.dart`.
///
/// Big thanks to [@knaeckeKami](https://github.com/knaeckeKami) for finding
/// this workaround!!
Future<void> applyWorkaroundToOpenSqlite3OnOldAndroidVersions() async {
  if (!Platform.isAndroid) return;

  try {
    DynamicLibrary.open('libfreefare.so');
  } on ArgumentError {
    // Ok, the regular approach failed. Try to open freefare in Java, which seems
    // to fix the problem.
    await _platform.invokeMethod('doesnt_matter');

    // Try again. If it still fails we're out of luck.
    DynamicLibrary.open('libfreefare.so');
  }
}
