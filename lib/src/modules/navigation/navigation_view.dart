import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/modules/home/home_view_model.dart';
import 'package:loyalty_challenge/src/modules/home/home_view.dart';
import 'package:loyalty_challenge/src/modules/wishlist/wishlist_view.dart';

class NavigationView extends StatefulWidget {
  final User user;
  const NavigationView({
    super.key,
    required this.user,
  });

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _currentIndex = 0;
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(user: widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            HomeView(user: widget.user),
            WishlistView(user: widget.user),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
          ],
        ),
      ),
    );
  }
}
