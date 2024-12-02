import 'package:flutter/material.dart';

class YouTubeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(110); // Adjust height for AppBar and tabs

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black, // Updated to black background
      elevation: 0,
      title: Row(
        children: [
          // Logo and "Tube" text
          Image.asset(
            'assets/images/youtube.jpg',
            height: 30,
          ),
          const SizedBox(width: 5),
          const Text(
            'Tube',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          // Search Bar
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Darker search bar for black background
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.white, // Updated to white for better contrast
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.grey[700], // Darker background for avatar
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48), // Height for the TabBar
        child: Container(
          color: Colors.black, // Same black background as AppBar
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.red, // Highlight color
            labelColor: Colors.white, // White text for selected tab
            unselectedLabelColor: Colors.grey, // Grey text for unselected tabs
            labelStyle: const TextStyle(
              fontSize: 16, // Increased font size for tabs
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14, // Larger but less prominent unselected text
            ),
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Songs'),
              Tab(text: 'Mixes'),
              Tab(text: 'Movies'),
              Tab(text: 'Playlists'),
              Tab(text: 'Live'),
              Tab(text: 'Gaming'),
            ],
          ),
        ),
      ),
    );
  }
}
