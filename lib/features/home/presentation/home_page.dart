import 'package:flutter/material.dart';
import 'package:limpio_ya/features/home/presentation/filter_page.dart';
import 'package:limpio_ya/shared/widgets/custom_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const _Header(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SearchBar(),
                  SizedBox(height: 32),
                  CustomTitle(title: 'Ofertas Especiales'),
                  SizedBox(height: 16),
                  _OffersPageView(),
                  SizedBox(height: 32),
                  CustomTitle(title: 'Categorias'),
                  SizedBox(height: 16),
                  _CategoriesList(),
                  SizedBox(height: 32),
                  Row(
                    children: [
                      CustomTitle(title: 'Servicios populares'),
                      Spacer(),
                      TextButton(onPressed: () {}, child: Text("Ver todo")),
                    ],
                  ),

                  SizedBox(height: 16),
                  _PopularServicesList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Hola, Julian",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Lima, Perú"),
              leading: const SizedBox(
                width: 64,
                height: 64,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/person.jpg"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.notifications, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FilterPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 250, 255, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 8,
            children: [
              Icon(Icons.search, color: Colors.grey),
              Expanded(child: Text('Buscar')),
              Icon(Icons.tune, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class _OffersPageView extends StatelessWidget {
  const _OffersPageView();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 32;
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) {
          return SizedBox(
            width: width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '40%',
                            style: TextStyle(color: Colors.white, fontSize: 48),
                          ),
                          Text(
                            'Descuento en tu primer servicio',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Válido hasta el 30 de septiembre',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/cleaner.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: const Icon(Icons.outlined_flag, color: Colors.green),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Reparación'),
            ],
          );
        }),
      ),
    );
  }
}

class _PopularServicesList extends StatelessWidget {
  const _PopularServicesList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 24,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 200,

            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/cleaner.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Limpieza de hogar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '\$100',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
