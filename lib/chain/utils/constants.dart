const int minimumResults = 50;

// Day
const int chartDaySkipAmount = 1;
final DateTime chartDayEndTime = DateTime.now().subtract(
  const Duration(days: 1),
);

// Week
const int chartWeekSkipAmount = 5;
final DateTime chartWeekEndTime = DateTime.now().subtract(
  const Duration(days: 7),
);

// Two Weeks
const int chartTwoWeekSkipAmount = 10;
final DateTime chartTwoWeekEndTime = DateTime.now().subtract(
  const Duration(days: 14),
);

// Month
const int chartMonthSkipAmount = 20;
final DateTime chartMonthEndTime = DateTime.now().subtract(
  const Duration(days: 30),
);

// Three Months
const int chartThreeMonthSkipAmount = 60;
final DateTime chartThreeMonthEndTime = DateTime.now().subtract(
  const Duration(days: 90),
);

// Six Months
const int chartSixMonthSkipAmount = 120;
final DateTime chartSixMonthEndTime = DateTime.now().subtract(
  const Duration(days: 180),
);

// Year
const int chartYearSkipAmount = 240;
final DateTime chartYearEndTime = DateTime.now().subtract(
  const Duration(days: 365),
);

// All
const int chartAllSkipAmount = 480;
final DateTime chartAllEndTime = DateTime.fromMillisecondsSinceEpoch(0);
