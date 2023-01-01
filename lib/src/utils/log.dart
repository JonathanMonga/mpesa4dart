import 'package:meta/meta.dart';

class Log {
  static Log? _instance;

  factory Log() => _instance!;

  Log._(this.production);

  static void init([bool production = false]) => _instance = Log._(production);

  final bool production;

  String debug(String tag, [dynamic payload]) {
    final output = generator('=', tag, payload);
    print(output);
    return output;
  }

  String error(String tag, [dynamic payload]) {
    final output = generator('*', tag, payload);
    print(output);
    return output;
  }

  @visibleForTesting
  String generator(String delim, String tag, [dynamic payload]) {
    var _ = '';
    if (!production) {
      _ += '\n$delim $tag ${delim.padRight(20, delim)}\n';
      if (payload != null) {
        _ += '$payload \n${delim.padRight(20, delim)}\n';
      }
    }

    return _;
  }
}
