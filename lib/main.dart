import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'NextPage.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'flutter Sharedpreference '),
    );
  }
}
class MyHomePage extends StatefulWidget {
 // var nameController=TextEditingController();
   MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var nameController=TextEditingController();
  static const String KEYNAME="name";
  var nameValue="No Value Saved";
  // var Sharedpreferences;
  @override
  void initState() {
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 340,
        height: 40,
        child:TextField(
              controller:nameController,
              decoration: InputDecoration(
                label: Text('Enter any Text'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
            ),
            Container(height: 20,),
            ElevatedButton(onPressed: () async{
            //  var name=nameController.text.toString();
              var prefs=await SharedPreferences.getInstance();
              prefs.setString(KEYNAME,nameController.toString());

            },
             // style: ElevatedButton.styleFrom(primary: Colors.pink,padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20)),
              child:const Text( 'Save',style: TextStyle(fontSize: 20,color: Colors.pink),),
            ),
            SizedBox(height: 20,),
            Text('Saved Value'),
          ],
        ),
      ),
    );
  }
 void getValue() async {
    //var Sharedpreferences;
    var prefs=await SharedPreferences.getInstance();
    var getName=prefs.getString(KEYNAME);
      setState(() {
      nameValue=getName ?? "No Value Saved ";
    });
  }
}