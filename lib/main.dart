import 'package:flutter/material.dart';

main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  //constructor
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final List<String> outputs = [];

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void _addEntry() {
    final String firstName = firstNameController.text.trim();
    final String lastName = lastNameController.text.trim();
    final String email = emailController.text.trim();
    final int? age = int.tryParse(ageController.text.trim());
    final String year = yearController.text.trim();

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        age == null ||
        year.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please input needed fields')),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    String remarks = age <= 17
        ? "you're too young for a drink"
        : "Let's have a drink!";
    String status = age <= 17 ? "MINOR" : "ADULT";

    String result =
        "Hi $firstName $lastName $remarks, born on the $year. $email : [$status]";

    setState(() {
      outputs.add(result);
    });
    firstNameController.clear();
    lastNameController.clear();
    ageController.clear();
    yearController.clear();
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F4272),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {},
            ),

            IconButton(
              icon: const Icon(Icons.pets_sharp, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PokemonScreen()),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.cookie_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FortuneCookie()),
                );
              },
            ),

            IconButton(
              icon: const Icon(
                Icons.person_2_rounded,
                color: Color(0xFFFDF0F0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
        backgroundColor: const Color(0xFF132043),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //LANDING PAGE
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ROUTING APP',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFFDF0F0),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'INF222_LongAct2_ILUSTRE_SOFIA_jgKl1MlHsjwTpxM222',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFFFDF0F0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'img/megumi.jpg',
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: double.infinity, // width
                height: 50, // height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF132043),
                    foregroundColor: const Color(0xFFFFDF0F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PokemonScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'GO TO POKEMONS!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            //END OF LANDING PAGE
          ],
        ),
      ),
    );
  }
}

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _elementController = TextEditingController();

  final List<String> pokemonNames = [];
  final List<String> pokemonElements = [];
  final List<Image> pokemonImages = [];

  Image getPokemonImage(String element) {
    switch (element.toLowerCase()) {
      case 'bug':
        return Image.asset('img/bug.png', width: 40, height: 40);
      case 'dark':
        return Image.asset('img/dark.png', width: 40, height: 40);
      case 'dragon':
        return Image.asset('img/dragon.png', width: 40, height: 40);
      case 'electric':
        return Image.asset('img/electric.png', width: 40, height: 40);
      case 'fairy':
        return Image.asset('img/fairy.png', width: 40, height: 40);
      case 'fighting':
        return Image.asset('img/fighting.png', width: 40, height: 40);
      case 'fire':
        return Image.asset('img/fire.png', width: 40, height: 40);
      case 'flying':
        return Image.asset('img/flying.png', width: 40, height: 40);
      case 'ghost':
        return Image.asset('img/ghost.png', width: 40, height: 40);
      case 'grass':
        return Image.asset('img/grass.png', width: 40, height: 40);
      case 'ground':
        return Image.asset('img/ground.png', width: 40, height: 40);
      case 'ice':
        return Image.asset('img/ice.png', width: 40, height: 40);
      case 'normal':
        return Image.asset('img/normal.png', width: 40, height: 40);
      case 'poison':
        return Image.asset('img/poison.png', width: 40, height: 40);
      case 'psychic':
        return Image.asset('img/psychic.png', width: 40, height: 40);
      case 'rock':
        return Image.asset('img/rock.png', width: 40, height: 40);
      case 'steel':
        return Image.asset('img/steel.png', width: 40, height: 40);
      case 'water':
        return Image.asset('img/water.png', width: 40, height: 40);
      default:
        return Image.asset('img/normal.png', width: 40, height: 40);
    }
  }

  void addPokemon() {
    String name = _nameController.text.trim();
    String element = _elementController.text.trim();

    if (name.isEmpty || element.isEmpty) return;

    setState(() {
      pokemonNames.add(name);
      pokemonElements.add(element);
      pokemonImages.add(getPokemonImage(element));
      _nameController.clear();
      _elementController.clear();
    });
  }

  Color getElementColor(String element) {
    switch (element.toLowerCase()) {
      case 'bug':
        return Colors.lightGreen.shade400;
      case 'dark':
        return Colors.brown.shade600;
      case 'dragon':
        return Colors.blue.shade600;
      case 'electric':
        return Colors.yellow;
      case 'fairy':
        return Colors.pink.shade100;
      case 'fighting':
        return Colors.orange.shade200;
      case 'fire':
        return Colors.orange.shade800;
      case 'flying':
        return Colors.lightBlue.shade100;
      case 'ghost':
        return Colors.deepPurple.shade800;
      case 'grass':
        return Colors.green.shade800;
      case 'ground':
        return const Color.fromARGB(255, 201, 144, 59);
      case 'ice':
        return Colors.lightBlue.shade300;
      case 'normal':
        return Colors.grey;
      case 'poison':
        return Colors.purple.shade400;
      case 'psychic':
        return Colors.pink.shade400;
      case 'rock':
        return const Color.fromARGB(255, 252, 225, 184);
      case 'steel':
        return const Color.fromARGB(255, 150, 190, 211);
      case 'water':
        return Colors.blue.shade700;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.cookie_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PokemonScreen()),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.cookie_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FortuneCookie()),
                );
              },
            ),

            IconButton(
              icon: const Icon(
                Icons.person_2_rounded,
                color: Color(0xFFFDF0F0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
        backgroundColor: const Color(0xFF132043),
      ),

      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Pokemon Name',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color(0xFFFDF0F0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _elementController,
                      decoration: const InputDecoration(
                        labelText: 'Element',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color(0xFFFDF0F0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: addPokemon,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemonNames.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      leading: pokemonImages[index],
                      title: Text(pokemonNames[index]),
                      subtitle: Text(
                        pokemonElements[index],
                        style: TextStyle(
                          color: getElementColor(pokemonElements[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FortuneCookie extends StatefulWidget {
  const FortuneCookie({super.key});

  @override
  State<FortuneCookie> createState() => _FortuneCookieState();
}

class _FortuneCookieState extends State<FortuneCookie> {
  final List<String> fortunes = [
    "You will find great success in your career.",
    "A thrilling time is in your immediate future.",
    "Your ability to juggle many tasks will take you far.",
    "Now is the time to try something new.",
    "You will make a change for the better.",
    "A fresh start will put you on your way.",
    "Adventure can be real happiness.",
    "Your life will be happy and peaceful.",
    "A new perspective will come with the new year.",
    "You will conquer obstacles to achieve success.",
  ];

  String selectedFortune = "";

  void pickFortune() {
    setState(() {
      fortunes.shuffle();
      selectedFortune = fortunes.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.pets_sharp, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PokemonScreen()),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.cookie_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FortuneCookie()),
                );
              },
            ),

            IconButton(
              icon: const Icon(
                Icons.person_2_rounded,
                color: Color(0xFFFDF0F0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
        backgroundColor: const Color(0xFF132043),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('img/cookie.png', width: 200, height: 200)),
          const SizedBox(height: 20),
          Text(
            selectedFortune,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 19, 32, 67),
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF132043),
              foregroundColor: const Color(0xFFFFDF0F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
            ),
            onPressed: pickFortune,
            child: const Text(
              'Click for a Fortune!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.pets_sharp, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PokemonScreen()),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.cookie_rounded, color: Color(0xFFFDF0F0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FortuneCookie()),
                );
              },
            ),

            IconButton(
              icon: const Icon(
                Icons.person_2_rounded,
                color: Color(0xFFFDF0F0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
        backgroundColor: const Color(0xFF132043),
      ),

      backgroundColor: const Color.fromARGB(255, 31, 66, 114),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image(
                image: AssetImage("img/maki.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 15.0,
                top: 15.0,
                left: 30.0,
              ),
              child: const Text(
                'SOFIA SIMOUNE G. ILUSTRE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFFFDF0F0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15.0, left: 30.0),
              child: const Text(
                'MAY 29, 2003',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFFFDF0F0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15.0, left: 30.0),
              child: const Text(
                'GEMINI ♊',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFFFDF0F0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15.0, left: 30.0),
              child: const Text(
                'KUNG KAYA NG IBA, IPAGAWA MO SA KANILA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Color(0xFFFDF0F0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
