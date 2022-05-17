import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, required this.material3})
      : super(key: key);

  final String title;
  final ValueNotifier<bool> material3;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dialog Material You'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Esta é a aparência do Alert Dialog'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Entendi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _showMyDialog, icon: const Icon(Icons.message))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Os botões foram pressionados:',
                      ),
                      Text(
                        '$_counter vezes',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  title: const Text('Mudar para Material 3'),
                  trailing: Switch(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: widget.material3.value,
                    onChanged: (value) => widget.material3.value = value,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: widget.material3.value
          ? NavigationBar(
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: 'Configurações',
                ),
              ],
              selectedIndex: 0,
            )
          : BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Configurações',
                ),
              ],
            ),
    );
  }
}
