class RewardItem {
  final int id;
  final String name;
  final String imageUrl;
  final int rewardPoints;
  final String rewardDesc;
  bool isSaved;

  RewardItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rewardPoints,
    required this.rewardDesc,
    this.isSaved = false,
  });

  factory RewardItem.fromJson(Map<String, dynamic> json) {
    return RewardItem(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      rewardPoints: json['reward_points'],
      rewardDesc: json['reward_desc'],
    );
  }
}
