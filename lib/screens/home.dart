import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:podify/screens/play.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int selectedTab = 0;

  List<Map<String, dynamic>> podcastList = [
    {
      "id": 0,
      "title": "Legit online",
      "subtitle": "Henry Mark",
      "img": "assets/podcast9.png",
    },
    {
      "id": 0,
      "title": "Duncan Kidd",
      "subtitle": "Jennifer adkins",
      "img": "assets/podcast13.png",
    },
    {
      "id": 1,
      "title": "Swift Design",
      "subtitle": "Harry Smith",
      "img": "assets/design.jpg",
    },
    {
      "id": 1,
      "title": "Figma Wireframe",
      "subtitle": "Kelvin Mosh",
      "img": "assets/design2.png",
    },
    {
      "id": 2,
      "title": "Music Beat",
      "subtitle": "Paul Barrenson",
      "img": "assets/music.jpg",
    },
    {
      "id": 2,
      "title": "Young Talent",
      "subtitle": "ID Cabasa",
      "img": "assets/music2.webp",
    },
    {
      "id": 3,
      "title": "Politics Today",
      "subtitle": "Adams Mathison",
      "img": "assets/politics.jpg",
    },
    {
      "id": 3,
      "title": "Our Leaders",
      "subtitle": "Nicholas Brady",
      "img": "assets/politics2.jpg",
    },
    {
      "id": 4,
      "title": "The Obi One",
      "subtitle": "Mikel Obi",
      "img": "assets/sport.png",
    },
    {
      "id": 4,
      "title": "Young Talent",
      "subtitle": "Harry Joe",
      "img": "assets/sport2.png",
    },
  ];

  List<Map<String, String>> categories = [
    {'name': 'All podcast'},
    {'name': 'Design'},
    {'name': 'Music'},
    {'name': 'Politics'},
    {'name': 'Sport'},
    {'name': 'Reality'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GNav(
        backgroundColor: Color.fromARGB(243, 223, 105, 2),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.black,
        padding: EdgeInsets.all(20),
        tabs: [
          GButton(icon: Icons.home_outlined),
          GButton(icon: Icons.explore_outlined),
          GButton(icon: Icons.favorite_outline_sharp),
          GButton(icon: Icons.person_2_outlined),
        ],
      ),
      body: Stack(
        children: [
          Container(color: Colors.black),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 5),
                  _buildHeaderText(),
                  const SizedBox(height: 5),
                  _buildArtistListAvatar(),
                  const SizedBox(height: 5),
                  _buildPodcastCategoriesHeaderText(),
                  const SizedBox(height: 5),
                  _buildPodcastCategoriesHeader(),
                  const SizedBox(height: 5),
                  Expanded(child: _buildPodcastListView()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 15,
              backgroundColor: Color.fromARGB(255, 243, 219, 7),
              child: Icon(Icons.mic_rounded),
            ),
            const SizedBox(width: 3),
            Text(
              'podify',
              style: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _buildIconButton(Icons.search_sharp, Colors.grey),
            const SizedBox(width: 10),
            _buildIconButton(Icons.notifications_none, Colors.black),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderText() {
    return Row(
      children: [
        Text(
          'Popular artist',
          style: GoogleFonts.spaceGrotesk(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildArtistListAvatar() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast.jpeg'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast3.jpg'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast4.webp'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast5.webp'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast6.png'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast7.jpeg'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast8.webp'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast10.png'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/podcast13.png'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/sport.png'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/music2.webp'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/design2.png'),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/politics.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildPodcastCategoriesHeaderText() {
    return Row(
      children: [
        Text(
          'Top podcast of this week',
          style: GoogleFonts.spaceGrotesk(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPodcastCategoriesHeader() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 150,
              height: 45,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? const Color.fromARGB(255, 243, 219, 7)
                    : const Color.fromARGB(84, 158, 158, 158),
              ),
              child: Center(
                child: Text(
                  categories[index]['name']!,
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: TextStyle(
                      color:
                          selectedIndex == index ? Colors.black : Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 55,
      decoration: BoxDecoration(
        color:
            color == Colors.grey ? Colors.white.withOpacity(0.2) : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildPodcastListView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final podcast in podcastList)
            if (selectedIndex == 0 || podcast['id'] == selectedIndex)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPodcastItem(podcast),
              ),
        ],
      ),
    );
  }

  Widget _buildPodcastItem(Map<String, dynamic> podcast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Play(
                        podcast: podcast,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 180,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(podcast['img']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                podcast['title'],
                style: GoogleFonts.spaceGrotesk(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                podcast['subtitle'],
                style: GoogleFonts.spaceGrotesk(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
