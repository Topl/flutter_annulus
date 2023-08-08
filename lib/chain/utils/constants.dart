const int minimumResults = 50;

// Day
const int chartDaySkipAmount = 10;
final DateTime chartDayEndTime = DateTime.now().subtract(
  const Duration(days: 1),
);

// Week
const int chartWeekSkipAmount = 20;
final DateTime chartWeekEndTime = DateTime.now().subtract(
  const Duration(days: 7),
);

// Two Weeks
const int chartTwoWeekSkipAmount = 40;
final DateTime chartTwoWeekEndTime = DateTime.now().subtract(
  const Duration(days: 14),
);

// Month
const int chartMonthSkipAmount = 80;
final DateTime chartMonthEndTime = DateTime.now().subtract(
  const Duration(days: 30),
);

// Three Months
const int chartThreeMonthSkipAmount = 160;
final DateTime chartThreeMonthEndTime = DateTime.now().subtract(
  const Duration(days: 90),
);

// Six Months
const int chartSixMonthSkipAmount = 320;
final DateTime chartSixMonthEndTime = DateTime.now().subtract(
  const Duration(days: 180),
);

// Year
const int chartYearSkipAmount = 640;
final DateTime chartYearEndTime = DateTime.now().subtract(
  const Duration(days: 365),
);

// All
const int chartAllSkipAmount = 1280;
final DateTime chartAllEndTime = DateTime.fromMillisecondsSinceEpoch(0);
