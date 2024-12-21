import 'package:flutter/material.dart';
import 'package:tinder/tabScreen/favorite_sent_favorite_received_screen.dart';
import 'package:tinder/tabScreen/like_sent_like_received_screen.dart';
import 'package:tinder/tabScreen/swipping_screen.dart';
import 'package:tinder/tabScreen/user_details_screen.dart';
import 'package:tinder/tabScreen/view_sent_view_received_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   
   int screenIndex = 0;
   List  tabScreenList =  [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavoriteSentFavoriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen()
   ];



  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child:   Text('Welcome ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color:Colors.white
        ),),
      ),
    );
  }
}