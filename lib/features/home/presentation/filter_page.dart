import 'package:flutter/material.dart';
import 'package:limpio_ya/shared/widgets/custom_title.dart';
import 'package:limpio_ya/shared/widgets/price_range_picker.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Filtros',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(249, 250, 255, 1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  CustomTitle(title: 'Ubicación'),

                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(249, 250, 255, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        spacing: 8,
                        children: [
                          Expanded(child: Text('Lima, Perú')),
                          Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  CustomTitle(title: 'Categorias'),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(249, 250, 255, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 100,

                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Icon(
                                      Icons.clean_hands,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Limpieza ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomTitle(title: 'Rango de precios'),
                  PriceRangePicker(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
