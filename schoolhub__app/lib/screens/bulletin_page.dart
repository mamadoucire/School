import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../models/bulletin.dart';

class BulletinPage extends StatelessWidget {
  static const routeName = '/bulletin';
  @override
  Widget build(BuildContext context) {
    final childId = ModalRoute.of(context)!.settings.arguments as String?;
    final homeVm = Provider.of<HomeViewModel>(context);
    final child = childId != null ? homeVm.getChildById(childId) : null;

    return Scaffold(
      appBar: AppBar(title: Text('Bulletin')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: child == null
            ? Center(
                child: Text('Sélectionnez un enfant pour voir le bulletin.'))
            : Column(
                children: [
                  Text('Bulletins de ${child.fullName}',
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: child.bulletins.length,
                      itemBuilder: (ctx, i) {
                        final BulletinModel b = child.bulletins[i];
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Trimestre ${b.trimester}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                                SizedBox(height: 8),
                                ...b.subjectAverages.entries
                                    .map((e) => ListTile(
                                          title: Text(e.key),
                                          trailing: Text(
                                              '${e.value.toStringAsFixed(1)}/20'),
                                        )),
                                Divider(),
                                Text(
                                    'Moyenne générale: ${b.overallAverage.toStringAsFixed(1)}/20',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
