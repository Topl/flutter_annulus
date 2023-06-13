enum ChartOption {
  averageTransactionFee(
    name: 'Average Transaction Fee',
  ),
  dataThroughput(
    name: 'Data Throughput',
  ),
  averageBlockTime(
    name: 'Average Block Time',
  );

  const ChartOption({
    required this.name,
  });

  final String name;
}
