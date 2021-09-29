import 'package:hive/hive.dart';

import 'lib_exp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveUtil.initHive();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    HiveUtil.closeHive();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Hive Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _addNewUser() async {
    await HiveMyUserCtrl.add('name');
  }

  Future<void> _updateUser(final myUserFromBox) async {
    myUserFromBox.name = myUserFromBox.name + ' name';

    await HiveMyUserCtrl.update(myUserFromBox);
  }

  Future<void> _deleteUser(int id) async {
    await HiveMyUserCtrl.delete(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<Box<MyUser>>(
        valueListenable: HiveMyUserCtrl.all,
        builder: (context, box, child) => ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) => ListTile(
            onLongPress: () => _deleteUser(box.values.elementAt(index).id),
            onTap: () => _updateUser(box.values.elementAt(index)),
            title: Text(
              box.values.elementAt(index).name,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewUser,
        child: Icon(Icons.add),
      ),
    );
  }
}
