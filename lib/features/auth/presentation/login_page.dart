import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:limpio_ya/shared/widgets/form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
                Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(),
                CustomFormField(
                  label: 'Correo electrónico',
                  controller: TextEditingController(),
                ),
                CustomFormField(
                  label: 'Contraseña',
                  controller: TextEditingController(),
                  isPassword: true,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (val) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Text("Recuerdame"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/auth/forgot-password");
                      },
                      child: const Text(
                        "Olvidé mi contraseña",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Iniciar sesión'),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[300]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("ó", style: TextStyle(color: Colors.black54)),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[300]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    _socialButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "No tienes una cuenta? ",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Regístrate",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, "/auth/register");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton({required Widget icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 50,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
