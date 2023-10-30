# freefare.dart

This project contains Dart packages to use SQLite from Dart via `dart:ffi`.

The main package in this repository is [`freefare`](freefare), which contains all the Dart apis and their implementation.
`package:freefare` is a pure-Dart package without a dependency on Flutter. 
It can be used both in Flutter apps or in standalone Dart applications.

The `freefare_flutter_libs` and `freefare3_flutter_libs` packages contain no Dart code at all. Flutter users can depend
on one of them to include native libraries in their apps.

## Example Usage

A file with basic usage examples for pure Dart can be found [here](freefare/example/main.dart).
