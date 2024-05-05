// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/chat.dart';
import 'package:luvit/home.dart';
import 'package:luvit/liked.dart';
import 'package:luvit/location.dart';
import 'package:luvit/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const Profile();
      case 2:
        return const Location();
      case 3:
        return const Chat();
      case 4:
        return const Liked();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedIndex),
      //backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: 80,
        //padding: EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Stack(clipBehavior: Clip.none, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 60, left: 20),
                child: GestureDetector(
                    onTap: () => _onItemTapped(0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Vector.svg',
                          color: _selectedIndex == 0
                              ? const Color(0xffFF016B)
                              : Colors.grey,
                        ),
                        Text(
                          "홈",
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? const Color(0xffFF016B)
                                : Colors.grey,
                          ),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 50),
                child: GestureDetector(
                    onTap: () => _onItemTapped(1),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location2.svg',
                          color: _selectedIndex == 1
                              ? const Color(0xffFF016B)
                              : Colors.grey,
                        ),
                        Text(
                          "스팟",
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? const Color(0xffFF016B)
                                : Colors.grey,
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 50),
                child: GestureDetector(
                    onTap: () => _onItemTapped(2),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_GNB.svg',
                          color: _selectedIndex == 2
                              ? const Color(0xffFF016B)
                              : Colors.grey,
                        ),
                        Text(
                          "채팅",
                          style: TextStyle(
                            color: _selectedIndex == 2
                                ? const Color(0xffFF016B)
                                : Colors.grey,
                          ),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: GestureDetector(
                    onTap: () => _onItemTapped(3),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/pro.svg',
                          color: _selectedIndex == 3
                              ? const Color(0xffFF016B)
                              : Colors.grey,
                        ),
                        Text(
                          "마이",
                          style: TextStyle(
                            color: _selectedIndex == 3
                                ? const Color(0xffFF016B)
                                : Colors.grey,
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
          Positioned(
            top: -10,
            left: 170,
            child: GestureDetector(
              onTap: () => _onItemTapped(4),
              child: Stack(children: [
                SvgPicture.asset(
                  'assets/icons/ell1.svg',
                  color: _selectedIndex == 4 ? const Color(0xffFF016B) : null,
                ),
                Positioned(
                  left: 0,
                  top: 20,
                  right: 5,
                  child: SvgPicture.asset(
                    'assets/icons/star11.svg',
                  ),
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
