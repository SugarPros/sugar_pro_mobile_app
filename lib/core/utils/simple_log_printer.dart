import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    filter: ProductionFilter(),
    output: CustomConsoleOutput(),
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 50,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.none
    ),
  );
}

class SimpleLogPrinter extends PrettyPrinter {
  @override
  List<String> log(LogEvent event) {
    // var color = PrettyPrinter.levelColors[event.level];
    // var emoji = PrettyPrinter.levelEmojis[event.level];
    var color = levelColors![event.level];
    var emoji = levelEmojis![event.level];
    return [color!('$emoji: ${event.message}')];
  }
}

class CustomConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    final StringBuffer buffer = StringBuffer();
    event.lines.forEach(buffer.writeln);

    if (kReleaseMode) {
      debugPrint(buffer.toString());
    } else{
      dev.log(buffer.toString());
    }
  }
}