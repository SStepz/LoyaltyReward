import 'package:flutter/material.dart';
import 'package:loyalty_challenge/src/data/models/reward_item.dart';
import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/modules/home/home_view_model.dart';

class RewardDetailView extends StatefulWidget {
  final RewardItem item;
  final User user;
  final HomeViewModel viewModel;

  const RewardDetailView({
    super.key,
    required this.item,
    required this.user,
    required this.viewModel,
  });

  @override
  State<RewardDetailView> createState() => _RewardDetailViewState();
}

class _RewardDetailViewState extends State<RewardDetailView> {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = widget.item.isSaved;
  }

  void _toggleSave() {
    setState(() {
      isSaved = !isSaved;
      widget.viewModel.toggleSave(widget.item);
    });
  }

  void _redeemReward() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirm Reward Redemption',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Redeem "${widget.item.name}" for ${widget.item.rewardPoints} points?',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context, false),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );

    if (!mounted) return;

    if (confirmed == true) {
      setState(() {
        widget.viewModel.redeemReward(widget.item);
      });

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reward redeemed successfully!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canRedeem = widget.user.points >= widget.item.rewardPoints;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.item.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.item.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          isSaved ? Icons.favorite : Icons.favorite_border,
                          color: isSaved ? Colors.red : Colors.grey,
                        ),
                        onPressed: _toggleSave,
                      )
                    ],
                  ),
                  Text(
                    '${widget.item.rewardPoints} ${widget.item.rewardPoints == 1 ? 'Point' : 'Points'}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Detail',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item.rewardDesc,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: canRedeem
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: canRedeem ? _redeemReward : null,
            child: Text(
              'Redeem',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: canRedeem
                    ? Theme.of(context).colorScheme.onPrimary
                    : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
