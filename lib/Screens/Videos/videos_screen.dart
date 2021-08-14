import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Para_ti/components/menu_lateral.dart';
import 'package:flutter_auth/Screens/Videos/components/lista_videos_screen.dart';

import '../../constants.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      body: VideoListScreen(),
      backgroundColor: kWhiteColor,
    );
  }
}
