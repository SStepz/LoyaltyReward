import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/common/components/reward_card.dart';
import 'package:loyalty_challenge/src/modules/home/home_view_model.dart';
import 'package:loyalty_challenge/src/modules/reward_detail/reward_detail_view.dart';

class WishlistView extends StatelessWidget {
  final User user;
  const WishlistView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final savedItems = viewModel.rewards.where((item) => item.isSaved).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: savedItems.isEmpty
          ? const Center(
              child: Text('No saved items'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: savedItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = savedItems[index];
                return RewardCard(
                  item: item,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RewardDetailView(
                        item: item,
                        user: viewModel.user,
                        viewModel: viewModel,
                      ),
                    ),
                  ),
                  onToggleSave: () => viewModel.toggleSave(item),
                );
              },
            ),
    );
  }
}
