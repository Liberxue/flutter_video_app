import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
//   example
//   logger.d('Log message with 2 methods');

//   loggerNoStack.i('Info message');

//   loggerNoStack.w('Just a warning!');

//   logger.e('Error! Something bad happened', 'Test Error');

//   loggerNoStack.v({'key': 5, 'value': 'something'});

//   Logger(printer: SimplePrinter(colors: true)).v('boom');
