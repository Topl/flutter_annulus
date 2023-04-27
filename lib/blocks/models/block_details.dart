
class BlockDetails {
  final int height;
  final int time;
  final String hash;
  final String epoch;
  final String header;
  final int size;

  BlockDetails({
    required this.hash,
    required this.height,
    required this.time,
    required this.epoch,
    required this.header,
    required this.size
  });

  factory BlockDetails.fromJson(Map<String, dynamic> json) {
    return BlockDetails(
      hash: json['hash'],
      height: json['height'],
      time: json['time'],
      size: json['size'],
      epoch: json['epoch'],
      header: json['header'],
    );
  }
}