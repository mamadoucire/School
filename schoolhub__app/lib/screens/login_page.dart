import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../core/app_colors.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final auth = Provider.of<AuthViewModel>(context, listen: false);
    final ok = await auth.login(
        email: _emailCtrl.text.trim(), password: _passCtrl.text);
    setState(() => _loading = false);
    if (ok) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Identifiants invalides')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pastelGreen,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                Icon(Icons.school, size: 80, color: AppColors.darkGreen),
                SizedBox(height: 16),
                Text('SchoolHub',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppColors.darkGreen)),
                SizedBox(height: 8),
                Text('Espace Parent',
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 28),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          ToggleButtons(
                            isSelected: [false, true],
                            onPressed: (_) {},
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text('Élève')),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text('Parent'))
                            ],
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _emailCtrl,
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) => (v == null || v.isEmpty)
                                ? 'Email requis'
                                : null,
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _passCtrl,
                            decoration:
                                InputDecoration(labelText: 'Mot de passe'),
                            obscureText: true,
                            validator: (v) => (v == null || v.length < 4)
                                ? 'Mot de passe trop court'
                                : null,
                          ),
                          SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _loading ? null : _submit,
                              child: _loading
                                  ? CircularProgressIndicator(
                                      color: Colors.white)
                                  : Text('Se connecter'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Démo: email: demo@parent.com  mdp: 1234',
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
