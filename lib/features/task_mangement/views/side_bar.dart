import 'package:flutter/material.dart';

class NabuDashboard extends StatelessWidget {
  const NabuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.grey[100],
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nabu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem('Search', Icons.search),
                    _buildNavItem('Home', Icons.home),
                    _buildNavItem('Favorites', Icons.favorite),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 8.0),
                      child: Text(
                        'Task Management',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    _buildNavItem('Tasks', Icons.task),
                    _buildNavItem('Projects', Icons.assignment),
                    _buildNavItem('Departments', Icons.people),
                    _buildNavItem('Support tickets', Icons.support_agent),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 8.0),
                      child: Text(
                        'Sales',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    _buildNavItem('Point of Sale', Icons.point_of_sale),
                    _buildNavItem('Purchases', Icons.shopping_cart),
                    _buildNavItem('Inventory', Icons.inventory),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 8.0),
                      child: Text(
                        'Finance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    _buildNavItem('Accounting', Icons.account_balance),
                    _buildNavItem('Employees', Icons.people_outline),
                    _buildNavItem('Reports', Icons.bar_chart),
                    _buildNavItem('Settings', Icons.settings),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title),
      onTap: () {
        // Handle navigation
      },
    );
  }
}
