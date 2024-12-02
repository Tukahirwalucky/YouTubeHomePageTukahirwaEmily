import 'package:flutter/material.dart';
import 'app_bar.dart'; // Custom app bar file (YouTubeAppBar)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Number of tabs in YouTubeAppBar
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: YouTubeAppBar(), // Updated AppBar
        body: TabBarView(
          children: [
            _buildMainContent(), // Main Content for "All"
            _buildCategoryContent('Songs'),
            _buildCategoryContent('Mixes'),
            _buildCategoryContent('Movies'),
            _buildCategoryContent('Playlists'),
            _buildCategoryContent('Live'),
            _buildCategoryContent('Gaming'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Shorts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: 'Subscriptions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'You',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Featured Videos",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          _buildVideoCard(
            imagePath: 'assets/images/happiness.jpg',
            title: 'Happiness: A Journey to Joy',
            uploader: 'Joyful Life',
            views: '1.2M views',
            likes: '25K',
            comments: '2.3K comments',
            subscribers: '10.5K subscribers',
          ),
          _buildVideoCard(
            imagePath: 'assets/images/hapi_ness.jpg',
            title: 'The Art of Being Happy',
            uploader: 'Happiness Guru',
            views: '850K views',
            likes: '18K',
            comments: '1.8K comments',
            subscribers: '12K subscribers',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContent(String category) {
    return Center(
      child: Text(
        '$category Content Coming Soon!',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildVideoCard({
    required String imagePath,
    required String title,
    required String uploader,
    required String views,
    required String likes,
    required String comments,
    required String subscribers,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                uploader,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const Spacer(),
              Text(
                subscribers,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          Text(
            views,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Text(
            'Likes: $likes | Comments: $comments',
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
