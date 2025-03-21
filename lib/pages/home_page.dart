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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.blue[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, EPM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.indigo,
                      ),
                    ),
                    // Se agrega Hero para animar el ícono al navegar al perfil
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProfilePage()),
                        );
                      },
                      child: Hero(
                        tag: 'profileHero',
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.person, size: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Tarjeta "How do you feel?"
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Imagen del corazón
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue[50],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset("assets/image/Corazon.png"),
                        ),
                      ),
                      SizedBox(width: 20),

                      // Texto y botón
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "How do you feel?",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Fill out your medical card right now",
                              style: TextStyle(fontSize: 14, color: Colors.indigo[700]),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                // Se muestra el formulario de datos de tarjeta de crédito al presionar Get Started
                                _showMedicalCard();
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Search bar mejorada
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.blue[300]),
                      border: InputBorder.none,
                      hintText: "How can we help you?",
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Sección de Categorías con barra desplazable (se agregó imagen actualizada para la categoría Nutritionist)
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategoryCard(
                        categoryName: "Dentist",
                        iconImagePath: 'assets/icons/tooth.png',
                      ),
                      CategoryCard(
                        categoryName: "Surgeon",
                        iconImagePath: 'assets/icons/ciru.png',
                      ),
                      CategoryCard(
                        categoryName: "Pharmacist",
                        iconImagePath: 'assets/icons/heri.png',
                      ),
                      CategoryCard(
                        categoryName: "Nutritionist",
                        iconImagePath: 'assets/icons/salud.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Lista de doctores con efecto 3D y animación
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Doctor list",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      AnimatedDoctorCardWrapper(
                        delay: 0,
                        child: DoctorCard(
                          imagePath: "assets/image/doctor1.jpeg",
                          name: "Dr. Arlene McCoy",
                          title: "Therapist, 7 y.e.",
                          rating: 4.9,
                        ),
                      ),
                      AnimatedDoctorCardWrapper(
                        delay: 200,
                        child: DoctorCard(
                          imagePath: "assets/image/doctor2.jpeg",
                          name: "Dr. Ian",
                          title: "Cardiologist, 10 y.e.",
                          rating: 4.7,
                        ),
                      ),
                      AnimatedDoctorCardWrapper(
                        delay: 400,
                        child: DoctorCard(
                          imagePath: "assets/image/doctor3.jpg",
                          name: "Dr. Fernely",
                          title: "Gynecologist, 9 y.e.",
                          rating: 4.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // FloatingActionButton que muestra un Daily Health Tip
      floatingActionButton: FloatingActionButton(
        onPressed: _showDailyTip,
        backgroundColor: Colors.blue[200],
        child: Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }

  // Método que muestra el formulario para ingresar datos de la tarjeta de crédito con validaciones
  void _showMedicalCard() {
    final _cardFormKey = GlobalKey<FormState>();
    final TextEditingController _cardNumberController = TextEditingController();
    final TextEditingController _expiryController = TextEditingController();
    final TextEditingController _cvvController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _cardFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Datos de Tarjeta de Crédito",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                      labelText: "Número de Tarjeta",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 12,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      if (value.length != 12) {
                        return "El número de tarjeta debe tener 12 dígitos";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _expiryController,
                    decoration: InputDecoration(
                      labelText: "Fecha de Vencimiento (MM/AA)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      RegExp exp = RegExp(r'^\d{2}/\d{2}$');
                      if (!exp.hasMatch(value)) {
                        return "El formato debe ser MM/AA";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _cvvController,
                    decoration: InputDecoration(
                      labelText: "CVV",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      if (value.length != 3) {
                        return "El CVV debe tener 3 dígitos";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_cardFormKey.currentState!.validate()) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Datos de tarjeta de crédito enviados"),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: Text("Enviar"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Método que muestra un ModalBottomSheet con un tip de salud diario
  void _showDailyTip() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Daily Health Tip",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Stay hydrated and take a 5 minute break every hour to refresh your mind.",
                style: TextStyle(fontSize: 16, color: Colors.indigo[700]),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Tarjeta de Categoría con interactividad agregada
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
    return GestureDetector(
      onTap: () {
        String message;
        if (categoryName == "Dentist") {
          message = "Cuidado dental y consultas.";
        } else if (categoryName == "Surgeon") {
          message = "Cirugías y procedimientos médicos.";
        } else if (categoryName == "Pharmacist") {
          message = "Dispensa y asesoramiento farmacéutico.";
        } else if (categoryName == "Nutritionist") {
          message = "Consejos para una nutrición saludable.";
        } else {
          message = "Categoría: $categoryName";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message, style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          width: 120,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconImagePath,
                  height: 40, width: 40, fit: BoxFit.contain),
              SizedBox(height: 8),
              Text(
                categoryName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tarjeta de Doctor con efecto 3D actualizada (color de fondo modificado)
class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String title;
  final double rating;

  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(width: 5),
              Text(
                rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigo[900]),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.indigo[900]),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.indigo[700]),
          ),
        ],
      ),
    );
  }
}

// Widget que envuelve cada DoctorCard y le aplica una animación de escala con retardo
class AnimatedDoctorCardWrapper extends StatefulWidget {
  final Widget child;
  final int delay;
  const AnimatedDoctorCardWrapper({super.key, required this.child, this.delay = 0});
  
  @override
  _AnimatedDoctorCardWrapperState createState() => _AnimatedDoctorCardWrapperState();
}

class _AnimatedDoctorCardWrapperState extends State<AnimatedDoctorCardWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    final curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animation = Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation);
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}

// Nueva pantalla de Perfil (ProfilePage) con animaciones chidas y opción para agregar nombre y foto
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
//esto es solo un commit 
class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  // Nuevas variables de estado para el nombre y la foto del perfil
  String _profileName = "";
  ImageProvider? _profileImage;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se mantiene el AppBar original
      appBar: AppBar(
        title: Text("Perfil", style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hero para animar el ícono del perfil, se muestra la foto si se ha seleccionado
                Hero(
                  tag: 'profileHero',
                  child: GestureDetector(
                    onTap: () {
                      // Opcional: se puede agregar acción al tocar la foto
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[50],
                      ),
                      child: _profileImage == null
                          ? Icon(Icons.person, size: 80, color: Colors.blue[300])
                          : CircleAvatar(
                              radius: 40,
                              backgroundImage: _profileImage,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Bienvenido a tu perfil",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
                SizedBox(height: 10),
                // Botón interactivo que muestra un SnackBar con una adivinanza
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Adivinanza: Tengo agujas pero no pincho, ¿qué soy?", style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Text("Presiona para una adivinanza"),
                ),
                // NUEVA SECCIÓN: Formulario para agregar nombre y cambiar foto sin quitar nada del código original
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Ingresa tu nombre",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _profileName = _nameController.text;
                    });
                  },
                  child: Text("Guardar nombre"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Simulación de selección de foto: se asigna una imagen de assets
                      _profileImage = AssetImage("assets/image/est.jpg");
                    });
                  },
                  child: Text("Cambiar foto"),
                ),
                SizedBox(height: 20),
                Text(
                  _profileName.isEmpty ? "Bienvenido a tu perfil" : "Bienvenido, $_profileName",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//COMMIT EXTRA