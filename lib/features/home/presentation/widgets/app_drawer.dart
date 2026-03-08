import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../screens/dashboard_screen.dart';
import '../screens/transfer_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {

  final MenuItem currentPage;

  const AppDrawer({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [

          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF6A6A),
                  Color(0xFFFFB86C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(width: 15),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Admin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "admin@email.com",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text("Dashboard"),
              selected: currentPage == MenuItem.dashboard,
              selectedTileColor: const Color(0xFFFFE4D6),
              selectedColor: const Color(0xFFFF6A6A),
              onTap: () {

                if (currentPage == MenuItem.dashboard) {
                  Navigator.pop(context);
                  return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: const Icon(Icons.swap_horiz),
              title: const Text("Transferencias"),
              selected: currentPage == MenuItem.transfer,
              selectedTileColor: const Color(0xFFFFE4D6),
              selectedColor: const Color(0xFFFF6A6A),
              onTap: () {

                if (currentPage == MenuItem.transfer) {
                  Navigator.pop(context);
                  return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: const Icon(Icons.history),
              title: const Text("Historial"),
              selected: currentPage == MenuItem.history,
              selectedTileColor: const Color(0xFFFFE4D6),
              selectedColor: const Color(0xFFFF6A6A),
              onTap: () {

                if (currentPage == MenuItem.history) {
                  Navigator.pop(context);
                  return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Configuración"),
              selected: currentPage == MenuItem.settings,
              selectedTileColor: const Color(0xFFFFE4D6),
              selectedColor: const Color(0xFFFF6A6A),
              onTap: () {

                if (currentPage == MenuItem.settings) {
                  Navigator.pop(context);
                  return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}