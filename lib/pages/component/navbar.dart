import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final List<NavItem> navItems;
  final int selectedIndex;
  final Function(int) onItemSelected;

  Navbar({
    required this.navItems,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
        ),
        color: Colors.white,
      ),
      height: 80,
      padding: EdgeInsets.only(bottom: 14), // Reduced padding to 10 pixels
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          navItems.length,
          (index) => NavBarItem(
            navItem: navItems[index],
            isSelected: index == selectedIndex,
            onTap: () => onItemSelected(index),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;

  const NavItem({
    required this.icon,
    required this.label,
  });
}

class NavBarItem extends StatelessWidget {
  final NavItem navItem;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    Key? key,
    required this.navItem,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            navItem.icon,
            color: isSelected ? Color.fromARGB(255, 0, 0, 255) : Colors.grey,
          ),
          Text(
            navItem.label,
            style: TextStyle(
              color: isSelected ? Color.fromARGB(255, 0, 0, 255) : Colors.grey,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
