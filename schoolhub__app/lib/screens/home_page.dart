import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/child_card.dart';
import '../widgets/bottom_nav_bar.dart';
import '../core/app_colors.dart';
import '../models/child.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final children = vm.children;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bonjour, Parent'),
        backgroundColor: AppColors.pastelGreen,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            // Cards for quick stats
            Row(
              children: [
                Expanded(
                    child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(Icons.bar_chart,
                            size: 28, color: AppColors.darkGreen),
                        SizedBox(height: 6),
                        Text('Moyenne',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text(
                            '${_globalAverage(vm.children).toStringAsFixed(1)} / 20',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGreen)),
                      ],
                    ),
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(Icons.check_circle,
                            size: 28, color: AppColors.darkGreen),
                        SizedBox(height: 6),
                        Text('Présence',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text('96%',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGreen)),
                      ],
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(height: 14),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Mes enfants',
                    style: Theme.of(context).textTheme.titleLarge)),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: children.length,
                itemBuilder: (ctx, i) {
                  final c = children[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ChildCard(
                      child: c,
                      onTap: () {
                        Navigator.pushNamed(context, '/child', arguments: c.id);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (idx) {
            setState(() => _currentIndex = idx);
            switch (idx) {
              case 0:
                break;
              case 1:
                Navigator.pushNamed(context, '/notes');
                break;
              case 2:
                Navigator.pushNamed(context, '/absences');
                break;
              case 3:
                Navigator.pushNamed(context, '/bulletins');
                break;
              case 4:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGreen,
        child: Icon(Icons.notifications),
        onPressed: () => Navigator.pushNamed(context, '/notifications'),
      ),
    );
  }

  double _globalAverage(List<ChildModel> children) {
    if (children.isEmpty) return 0;
    double sum = 0;
    for (final c in children) sum += c.average;
    return sum / children.length;
  }
}
