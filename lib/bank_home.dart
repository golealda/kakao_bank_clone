import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_bank/blocs/home/home_cubit.dart';
import 'package:voice_bank/main_bank/main_bank.dart';

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (_, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              _changeBottomNav(context, index);
            },
            currentIndex: state,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.apps), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
            ],
          ),
        );
      },
    );
  }

  void _changeBottomNav(BuildContext context, int index) {
    final homeCubit = context.read<HomeCubit>();
    switch (index) {
      case 0:
        homeCubit.getMain();
        break;
      case 1:
        homeCubit.getCatalog();
        break;
      case 2:
        homeCubit.getNotification();
        break;
      case 3:
        homeCubit.getMore();
        break;
    }
  }

  Widget _buildBody(index) {
    switch (index) {
      case 0:
        return MainPage();
      default:
      return MainPage();
    }
  }
}