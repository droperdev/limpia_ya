import 'package:flutter/material.dart';
import 'package:limpio_ya/shared/widgets/form_field.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

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
                  'Nueva contraseña',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(),
                CustomFormField(
                  label: 'Contraseña',
                  controller: TextEditingController(),
                ),
                CustomFormField(
                  label: 'Confirmar contraseña',
                  controller: TextEditingController(),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "/auth/login",
                        (route) => false,
                      );
                    },
                    child: Text('Crear nueva contraseña'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
