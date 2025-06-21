import 'package:loyalty_challenge/src/data/models/reward_item.dart';

abstract class RewardServiceInterface {
  /// Returns a list of rewards. If no rewards are found, an empty list is returned.
  Future<List<RewardItem>> fetchRewards();
}
