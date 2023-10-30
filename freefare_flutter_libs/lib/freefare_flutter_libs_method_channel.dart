import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'freefare_flutter_libs_platform_interface.dart';

/// An implementation of [FreefareFlutterLibsPlatform] that uses method channels.
class MethodChannelFreefareFlutterLibs extends FreefareFlutterLibsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('freefare_flutter_libs');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
