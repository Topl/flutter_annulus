enum LoggerClass {
  ApiError('ApiError'),
  Analytics('Analytics'),
  Navigation('Navigation');

  const LoggerClass(this.string);
  final String string;
}

enum LogLevel { Info, Warning, Severe, Shout }
