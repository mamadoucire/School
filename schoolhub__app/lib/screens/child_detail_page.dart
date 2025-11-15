import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../viewmodels/child_viewmodel.dart';
import '../widgets/note_tile.dart';
import '../widgets/absence_tile.dart';
import '../models/child.dart';

class ChildDetailPage extends StatelessWidget {
  static const routeName = '/child';
  @override
  Widget build(BuildContext context) {
    final childId = ModalRoute.of(context)!.settings.arguments as String;
    final homeVm = Provider.of<HomeViewModel>(context);
    final child = homeVm.getChildById(childId)!;
    return ChangeNotifierProvider(
      create: (_) => ChildViewModel(child: child),
      child: _ChildDetailView(child: child),
    );
  }
}

class _ChildDetailView extends StatelessWidget {
  final ChildModel child;
  const _ChildDetailView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(child.fullName),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Hero(
                tag: 'avatar_${child.id}',
                child: CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Text(child.firstName[0],
                        style: TextStyle(
                            fontSize: 28, color: Colors.green.shade800)))),
            SizedBox(height: 10),
            Text('${child.classe} • ${child.age} ans',
                style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(height: 12),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('Moyenne générale',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('${child.average.toStringAsFixed(1)} / 20',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade800)),
                        ])),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/bulletin',
                          arguments: child.id),
                      child: Text('Voir bulletin'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Notes récentes',
                    style: Theme.of(context).textTheme.titleLarge)),
            SizedBox(height: 8),
            ...child.notes.map((n) => NoteTile(note: n)).toList(),
            SizedBox(height: 12),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Absences',
                    style: Theme.of(context).textTheme.titleLarge)),
            SizedBox(height: 8),
            ...child.absences.map((a) => AbsenceTile(absence: a)).toList(),
          ],
        ),
      ),
    );
  }
}
