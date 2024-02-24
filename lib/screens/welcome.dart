import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podify/screens/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/podcast2.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundColor: Color.fromARGB(255, 243, 219, 7),
                        child: Icon(Icons.mic_rounded),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 450,
                          width: 400,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 239, 222, 70),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 590,
            left: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: Container(
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 116, 33),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Now',
                        style: GoogleFonts.spaceGrotesk(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.arrow_right_alt_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 490,
            left: 40,
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: 'Discover and enjoy a world of podcasts \nwith ',
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'PODIFY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' for an unmatched audio \nexperience.',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 40,
            child: Center(
              child: Text(
                'Find your next \nobsession',
                style: GoogleFonts.spaceGrotesk(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 270,
            left: 10,
            child: Center(
              child: Image.asset(
                'assets/wave2.png',
                width: 400,
              ),
            ),
          ),
          Positioned(
            bottom: 370,
            right: 80,
            child: Image.asset(
              'assets/mic.png',
              height: 250,
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
