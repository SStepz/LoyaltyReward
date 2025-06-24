import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loyalty_challenge/src/modules/reward_detail/reward_detail_view.dart';
import 'package:loyalty_challenge/src/common/components/reward_card.dart';
import 'package:loyalty_challenge/src/modules/login/login_view.dart';
import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/modules/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  final User user;
  const HomeView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${user.fullName}',
            ),
            Text(
              '${user.points} ${user.points == 1 ? 'point' : 'points'}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginView(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => viewModel.sortAscending(),
                child: const Text('Sort by Points (Ascending)'),
              ),
              TextButton(
                onPressed: () => viewModel.sortDescending(),
                child: const Text('Sort by Points (Descending)'),
              ),
            ],
          ),
          Expanded(
            child: viewModel.rewards.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: viewModel.rewards.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final item = viewModel.rewards[index];
                      return RewardCard(
                        item: item,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RewardDetailView(
                              item: item,
                              user: user,
                              viewModel: viewModel,
                            ),
                          ),
                        ),
                        onToggleSave: () => viewModel.toggleSave(item),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
