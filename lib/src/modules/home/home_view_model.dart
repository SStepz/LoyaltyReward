import 'package:flutter/material.dart';
import 'package:loyalty_challenge/src/data/models/reward_item.dart';
import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/data/services/reward/reward_mock_service.dart';
import 'package:loyalty_challenge/src/data/services/reward/reward_service_interface.dart';

class HomeViewModel extends ChangeNotifier {
  final User user;
  late RewardServiceInterface _rewardService;

  List<RewardItem> _rewards = [];
  List<RewardItem> get rewards => _rewards;

  HomeViewModel({required this.user}) {
    _rewardService =
        RewardMockService(); // Replace with actual service implementation
    loadRewards();
  }

  Future<void> loadRewards() async {
    _rewards = await _rewardService.fetchRewards();
    notifyListeners();
  }

  void toggleSave(RewardItem item) {
    item.isSaved = !item.isSaved;
    notifyListeners();
  }

  void redeemReward(RewardItem item) {
    if (user.points >= item.rewardPoints) {
      user.points -= item.rewardPoints;
      notifyListeners();
    }
  }

  void sortAscending() {
    _rewards.sort((a, b) => a.rewardPoints.compareTo(b.rewardPoints));
    notifyListeners();
  }

  void sortDescending() {
    _rewards.sort((a, b) => b.rewardPoints.compareTo(a.rewardPoints));
    notifyListeners();
  }
}
