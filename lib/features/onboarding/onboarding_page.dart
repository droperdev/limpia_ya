import 'package:flutter/material.dart';
import 'package:limpio_ya/core/injection/injection.dart';
import 'package:limpio_ya/core/theme/theme_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final onboarding = const [
    {
      'image': 'assets/images/onboarding_1.png',
      'title': 'Bienvenido a LimpiaYa tu app de limpieza',
      'subtitle': 'Tu viaje hacia un entorno más limpio comienza aquí.',
    },
    {
      'image': 'assets/images/onboarding_2.png',
      'title': 'Profesionales que te ayudan a limpiar tu casa',
      'subtitle': 'Tu viaje hacia un entorno más limpio comienza aquí.',
    },
  ];

  int pageIndex = 0;
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (pageIndex < onboarding.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.of(context).pushNamed('/auth/login');
    }
  }

  void prevPage() {
    if (pageIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboarding.length,
                onPageChanged: (i) => setState(() => pageIndex = i),
                itemBuilder: (context, index) =>
                    _OnboardingItem(data: onboarding[index]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pageIndex > 0
                      ? TextButton(
                          onPressed: prevPage,
                          child: const Text(
                            'Anterior',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : const SizedBox.shrink(),

                  ElevatedButton(
                    onPressed: nextPage,
                    child: Text(
                      pageIndex == onboarding.length - 1
                          ? 'Empezar'
                          : 'Siguiente',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingItem extends StatelessWidget {
  final Map<String, String> data;
  const _OnboardingItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(data['image']!, fit: BoxFit.cover)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.2, 0.78],
                colors: const [Colors.transparent, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  data['title']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(data['subtitle']!, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
