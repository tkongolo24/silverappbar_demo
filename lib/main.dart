import 'package:flutter/material.dart';

void main() => runApp(const SliverAppBarApp());

class SliverAppBarApp extends StatelessWidget {
  const SliverAppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverAppBar Demo',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // ---- PROPERTY 1: expandedHeight ----
            // Default: null (bar stays at normal toolbar height, no expansion)
            expandedHeight: 150,

            // ---- PROPERTY 2: pinned ----
            // Default: false (bar scrolls completely off screen)
            pinned: true,

            // floating left off (default false) so the header only reappears
            // by scrolling back to the top, not on a small upward flick
            floating: false,

            // ---- PROPERTY 3: flexibleSpace ----
            // Default: null (no background/title area, just a plain bar)
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Tumba Z.M Kongolo'),
              centerTitle: true,
              background: Image.network(
                'https://picsum.photos/800/400',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // The scrollable content below the header
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: const Icon(Icons.article_outlined),
                title: Text('Post ${index + 1}'),
                subtitle: const Text('Scroll to see the app bar collapse'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}