import 'package:flutter_test/flutter_test.dart';
import 'package:freefare_flutter_libs/freefare_flutter_libs.dart';
import 'package:freefare_flutter_libs/freefare_flutter_libs_platform_interface.dart';
import 'package:freefare_flutter_libs/freefare_flutter_libs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFreefareFlutterLibsPlatform
    with MockPlatformInterfaceMixin
    implements FreefareFlutterLibsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FreefareFlutterLibsPlatform initialPlatform = FreefareFlutterLibsPlatform.instance;

  test('$MethodChannelFreefareFlutterLibs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFreefareFlutterLibs>());
  });

  test('getPlatformVersion', () async {
    FreefareFlutterLibs freefareFlutterLibsPlugin = FreefareFlutterLibs();
    MockFreefareFlutterLibsPlatform fakePlatform = MockFreefareFlutterLibsPlatform();
    FreefareFlutterLibsPlatform.instance = fakePlatform;

    expect(await freefareFlutterLibsPlugin.getPlatformVersion(), '42');
  });
}
