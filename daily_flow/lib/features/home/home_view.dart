import 'package:daily_flow/features/home/widgets/habit_card.dart';
import 'package:daily_flow/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF71BED2),
        title: AppLogo(),
        toolbarHeight: 56.0,
      ),
      backgroundColor: Color(0xFFE5F2F8),
      body: SoftEdgeBlur(
        edges: [
          EdgeBlur(
            type: EdgeType.bottomEdge,
            size: 80, // Tamanho do efeito de blur
            sigma: 20, // Intensidade do desfoque
            tintColor: Color(0xFFE5F2F8).withAlpha(204), // Sua cor de fundo com transparência
            controlPoints: [
              ControlPoint(position: 0.4, type: ControlPointType.visible),
              ControlPoint(position: 1.0, type: ControlPointType.transparent),
            ],
          ),
        ],
        child: ListView.separated(
          padding: EdgeInsets.all(16),
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemBuilder: (context, index) {
            return HabitCard();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFF1D35B),
        foregroundColor: Color(0xFF171717),
        shape: CircleBorder(),
        child: Center(
          child: Icon(Icons.add, color: Colors.black),
        )
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
          backgroundColor: Color(0xFFE5F2F8),
          selectedItemColor: Color(0xFFF1D35B),
          unselectedItemColor: Colors.grey[600],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insights_outlined),
              activeIcon: Icon(Icons.insights_rounded),
              label: 'Estatísticas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}