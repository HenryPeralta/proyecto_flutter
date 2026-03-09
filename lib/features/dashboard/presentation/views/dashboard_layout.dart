import 'package:flutter/material.dart';
import 'dashboard_view.dart';
import '../../../history/presentation/views/history_trans_view.dart';
import '../../../transfers/presentation/views/transfers_view.dart';

enum MenuItem {
  dashboard,
  transfer,
  history,
  settings,
}

class DashboardLayout extends StatefulWidget {
  final String userName;
  final String userEmail;

  const DashboardLayout({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  MenuItem currentPage = MenuItem.dashboard;

  // Lista de vistas disponibles
  late Map<MenuItem, Widget> _views;

  @override
  void initState() {
    super.initState();
    _views = {
      MenuItem.dashboard: DashboardView(
        userName: widget.userName,
        userEmail: widget.userEmail,
      ),
      MenuItem.history: const HistoryTransView(),
      MenuItem.transfer: const Transfers(),
    };
  }

  void _navigateToPage(MenuItem page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar con botones laterales
          _buildSidebar(),
          // Contenido principal
          Expanded(
            child: _views[currentPage] ?? _views[MenuItem.dashboard]!,
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 280,
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
      child: Column(
        children: [
          // Header del sidebar
          Container(
            padding: const EdgeInsets.all(20),
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.userEmail,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Botones de navegación
          _buildSidebarButton(
            icon: Icons.dashboard_outlined,
            title: "Dashboard",
            page: MenuItem.dashboard,
          ),

          const SizedBox(height: 5),

          _buildSidebarButton(
            icon: Icons.swap_horiz,
            title: "Transferencias",
            page: MenuItem.transfer,
          ),

          const SizedBox(height: 5),

          _buildSidebarButton(
            icon: Icons.history,
            title: "Historial",
            page: MenuItem.history,
          ),

          const SizedBox(height: 5),

          _buildSidebarButton(
            icon: Icons.settings_outlined,
            title: "Configuración",
            page: MenuItem.settings,
          ),

          const Spacer(),

          // Botón de logout
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                "Cerrar Sesión",
                style: TextStyle(color: Colors.white),
              ),
              onTap: _handleLogout,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarButton({
    required IconData icon,
    required String title,
    required MenuItem page,
  }) {
    final isSelected = currentPage == page;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Icon(
          icon,
          color: isSelected ? const Color(0xFFFF6A6A) : Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFF6A6A) : Colors.white,
          ),
        ),
        selected: isSelected,
        selectedTileColor: const Color(0xFFFFE4D6),
        onTap: () => _navigateToPage(page),
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cerrar sesión'),
          content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Salir'),
            ),
          ],
        );
      },
    );
  }
}