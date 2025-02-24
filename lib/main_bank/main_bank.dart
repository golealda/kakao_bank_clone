import 'package:flutter/material.dart';
import 'package:voice_bank/main_bank/components/checking_account_card.dart';
import 'package:voice_bank/main_bank/components/main_app_bar.dart';
import 'package:voice_bank/main_bank/components/more_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343B57),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            constraints: BoxConstraints(
              maxWidth: 632,
            ),
            child: CustomScrollView(
              key: PageStorageKey<String>("main"),
              slivers: [
                SliverAppBar(
                  titleSpacing: 10,
                  title: MainAppBar(),
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 20),
                    SizedBox(height: 15),
                    CheckingAccountCard(),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    MoreButton(),
                    SizedBox(height: 50),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}