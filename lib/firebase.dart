import 'package:firebase/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class firebase extends StatefulWidget {
  const firebase({Key? key}) : super(key: key);

  @override
  State<firebase> createState() => _firebaseState();
}

class _firebaseState extends State<firebase> {
final TextEditingController email=TextEditingController();
final TextEditingController password=TextEditingController();
Future<String?>LOGIN
    ({
  required String email,
  required String password,
})
async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return 'Success';
  }
  on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'no user found for that email';
    }
    else if (e.code == 'wrong-password') {
      return 'wrong password provided for that user';
    }
    else {
      return e.message;
    }
  }
  catch (e) {
    return e.toString();
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
           controller: email,
        decoration: InputDecoration(
        filled: true,
          fillColor: Colors.purple.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: 'Email',
        ),
      ),
      SizedBox(
        height: 30,
      ),
      TextField(
        controller: password,
        obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.purple.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: 'password',
      ),
    ),
    SizedBox(
    height: 30,
    ),
            TextButton(
                style:TextButton.styleFrom(backgroundColor: Colors.black,fixedSize: Size(120, 35)),
                onPressed: (){Navigator.pushReplacement(
                    context, MaterialPageRoute(builder:
                    (context)=>home()));}, child: Text('LOGIN',
                style:TextStyle(color:Colors.white )))
          ],
        ),
      ),
    );
  }
}
