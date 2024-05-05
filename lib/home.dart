import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
  ];

  int currentIndex = 0;

  void showNextCard() {
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("110_No Cards"),
            content: const Text("You've reached the end of the cards."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  void showPreviousCard() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        // Do nothing or handle as per your requirement
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0D0D),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/location1.svg',
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "목이길어슬픈기린님의 새로운 스팟",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xff000000),
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Star 1.svg',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "323,233",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 150,
            child: Stack(
              children: [
                if (currentIndex < images.length)
                  Positioned.fill(
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! < 0) {
                          showNextCard();
                        } else if (details.primaryVelocity! > 0) {
                          // Dragged towards right, handle if needed
                        }
                      },
                      onVerticalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          showNextCard();
                        } else if (details.primaryVelocity! < 0) {
                          // Dragged upwards, handle if needed
                        }
                      },
                      child: Card(
                        margin: const EdgeInsets.all(20.0),
                        elevation: 5.0,
                        child: Image.asset(
                          images[currentIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: GestureDetector(
                      onTap: showPreviousCard,
                    ),
                  ),
                ),
                Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: GestureDetector(
                      onTap: showNextCard,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
