import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                          SizedBox(height: 25), // Espaciado entre botones
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

              // Doctor list (Texto debajo de la lista horizontal)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Doctor list",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25), // Espaciado entre la lista horizontal y los doctores

              Container(
                child: Column(
                  children: [
                    // picture of doctor
                    Image.asset(
                     " assets/image/doctor1.jpeg",
                      height: 40,
                    ), // Image.asset

                    // rating out of 5
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text("4.9"),
                      ],
                    ),
                  ],
                ),
              ),
              // doctor name
              Text("Dr. Ian"),

              // doctor title
              Text("Therapist, 7 y.e"),

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
    super.key,
    required this.iconImagePath,
    required this.categoryName,
  });

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
             ),
            SizedBox(width: 10), // Espaciado entre imagen y texto
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
 