import 'package:uuid/uuid.dart';

class IdGen {
  static String genId() {
    String v1 = Uuid().v4(options: {
      'random': [
        0x10,
        0x91,
        0x56,
        0xbe,
        0xc4,
        0xfb,
        0xc1,
        0xea,
        0x71,
        0xb4,
        0xef,
        0xe1,
        0x67,
        0x1c,
        0x58,
        0x36
      ]
    });
    String time = DateTime.now().toUtc().toString();
    String time2 = DateTime.now().microsecond.toString();
    String time3 = DateTime.now().second.toString();
    return v1 + time + time2 + time3;
  }
}
