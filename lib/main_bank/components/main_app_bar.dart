import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            '박시형',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Color(0xff2B3044),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '내 계좌',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/image/si.jpeg'),
            radius: 18,
          ),
        ],
      ),
    );
  }
}
