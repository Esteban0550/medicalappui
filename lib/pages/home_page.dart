import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Fondo gris claro
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar (Nombre + Ícono de perfil)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nombre
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Mitch Koko',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),

                  // Ícono de perfil
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person, size: 30),
                  ),
                ],
              ),

              SizedBox(height: 20), // Espaciado entre la barra superior y el card

              // Cómo te sientes (Tarjeta rosada)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink[100], // Fondo rosa
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Animación (Cuadrado morado)
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple, // Morado
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(width: 20), // Espaciado entre imagen y texto

                    // Textos
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How do you feel?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Fill out your medical card right now",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25), // Espaciado entre las tarjetas

              // Search bar
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 185, 252),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "How can we help you?",
                  ),
                ),
              ),
              SizedBox(height: 25), // Espaciado entre la barra inferior y el pie

              // Horizontal list -> Categorías: Dentist, Surgeon, etc.
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal, // Permite desplazamiento horizontal
                  children: const [
                    CategoryCard(
                      categoryName: "Dentist",
                      iconImagePath: 'assets/icons/tooth.png', // Icono de dentista
                    ),
                    CategoryCard(
                      categoryName: "Surgeon",
                      iconImagePath: 'assets/icons/surgeon.jpg', // Icono de cirujano
                    ),
                    CategoryCard(
                      categoryName: "Pharmacist",
                      iconImagePath: 'assets/icons/medicine.png', // Icono de farmacéutico
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Clase CategoryCard corregida para que funcione correctamente
class CategoryCard extends StatelessWidget {
  final String iconImagePath;
  final String categoryName;

  const CategoryCard({
    Key? key,
    required this.iconImagePath,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0), // Espaciado izquierdo
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
        ),
        child: Row(
          children: [
            Image.asset(
              iconImagePath,
              height: 30,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 30, color: Colors.red);
              },
            ),
            SizedBox(width: 10), // Espaciado entre imagen y texto
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}

//hoy to