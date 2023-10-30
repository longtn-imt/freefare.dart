import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freefare_flutter_libs/freefare_flutter_libs_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFreefareFlutterLibs platform = MethodChannelFreefareFlutterLibs();
  const MethodChannel channel = MethodChannel('freefare_flutter_libs');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
