// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Provider/profile_notifier.dart';
import 'package:testapp/View/ProfilePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => ProfileNotifier()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'LogIn'),
      ),
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
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

  void validateInputs() {
    if (_formKey.currentState!.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState!.save();
      _autoValidate = false;
    } else {
      _autoValidate = true;
    }
  }
  String? validateName(String? value) {

  if (value!.length <= 2) {
    return "Enter Valid Name";
  }
  return null;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Full Name",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                          )),
                      ])),
                  ),
                    SizedBox(
                    height: 8,
                  ),
                   TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateName,
                     controller: context.read<ProfileNotifier>().empNmae,
                      decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.email),
                        labelText: 'Full Name',
                            enabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    ),
                
                
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Job Name",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                          )),
                      ])),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                   TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateName,
                    controller: context.read<ProfileNotifier>().empJobName,
                      decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.email),
                        labelText: 'Job Name',
                            enabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    ),
                
                ],
              ),
            ),
                 context.read<ProfileNotifier>().issubcatLoading == true?
                  Container(
                    height: MediaQuery.of(context).size.height *1,
                    color: Color.fromARGB(153, 199, 199, 199),
                    child: Center(
                      child: Container(
                        color: Colors.white10,
                        child: CircularProgressIndicator(

                        ),
                      ),
                    ),
                  ):Container()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: context.watch<ProfileNotifier>().issubcatLoading==true?
        Text(''):
        ElevatedButton(onPressed: ()async{
          validateInputs();
         if (_autoValidate) return;
             var res= await context.read<ProfileNotifier>().employeeSavedata();
             if(res!.statusCode==201){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomePage()),
              );
             }else{
            Fluttertoast.showToast(
        msg: "Something went wrong...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
             }
              
          },
          child: Text('submit'),),
      ),
    );
  }
}
