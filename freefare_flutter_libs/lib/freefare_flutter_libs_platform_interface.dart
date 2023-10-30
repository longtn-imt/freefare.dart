import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'freefare_flutter_libs_method_channel.dart';

abstract class FreefareFlutterLibsPlatform extends PlatformInterface {
  /// Constructs a FreefareFlutterLibsPlatform.
  FreefareFlutterLibsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FreefareFlutterLibsPlatform _instance = MethodChannelFreefareFlutterLibs();

  /// The default instance of [FreefareFlutterLibsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFreefareFlutterLibs].
  static FreefareFlutterLibsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FreefareFlutterLibsPlatform] when
  /// they register themselves.
  static set instance(FreefareFlutterLibsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
