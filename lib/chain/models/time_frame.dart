enum TimeFrame {
  day(
    name: '24h',
  ),
  week(
    name: '1w',
  ),
  twoWeeks(
    name: '2w',
  ),
  month(
    name: '1m',
  ),
  threeMonths(
    name: '3m',
  ),
  sixMonths(
    name: '6m',
  ),
  year(
    name: '1y',
  ),
  all(
    name: 'All',
  );

  const TimeFrame({
    required this.name,
  });

  final String name;
}
