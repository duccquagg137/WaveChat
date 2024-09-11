import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false; // Chuyển isDarkMode thành biến của class

  @override
  void initState() {
    super.initState();
    getThemeMode(); // Gọi hàm để kiểm tra theme mode khi khởi tạo
  }

  void getThemeMode() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    if (savedThemeMode == AdaptiveThemeMode.dark) {
      setState(() {
        isDarkMode = true;
      });
    } else {
      setState(() {
        isDarkMode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SwitchListTile(
            value: isDarkMode,
            title: const Text('Change Theme'),
            secondary: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              child: Icon(
                isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                color: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
              if (value) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
            },
          ),
        ),
      ),
    );
  }
}
