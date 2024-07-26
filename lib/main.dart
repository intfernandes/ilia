import 'package:flutter/material.dart';
import 'package:ilia/domain/usecases/create_transaction_uc.dart';

import 'package:ilia/external/external.dart';
import 'package:ilia/infra/infra.dart';

late IInjector injector;

void main() async {
  /* Olá pessoal da Ília, Deixei ambas implementações 
  para demonstrar o uso de interfaces e inversão de dependências
  apesar do exemplo do getit ter ficado mais burocrático,
  em um caso real de uso, eu utilizaria também o injectable
  https://pub.dev/packages/injectable */

  injector = AutoInjectorImpl(); // GetItImpl(); //

  final createTransaction = injector.get<CreateTransactionUc>();

  final transaction = await createTransaction(
    customer: UserModel(),
    product: ProductModel(),
    seller: UserModel(),
  );

  final endpoint = await Endpoint()

  debugPrint('transaction: $transaction');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
