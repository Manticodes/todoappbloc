class IdGen {
  static String genId() {
    String time = DateTime.now().toUtc().toString();
    String time2 = DateTime.now().microsecond.toString();
    String time3 = DateTime.now().second.toString();
    final result = time + time2 + time3;
    return result;
  }
}
