import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/child_card.dart';

class ChildListPage extends StatelessWidget {
  static const routeName = '/children';
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final children = vm.children;
    return Scaffold(
      appBar: AppBar(title: Text('Mes enfants')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: children.length,
          itemBuilder: (ctx, i) => ChildCard(
            child: children[i],
            onTap: () => Navigator.pushNamed(context, '/child',
                arguments: children[i].id),
          ),
        ),
      ),
    );
  }
}
