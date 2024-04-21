import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUsers(String email, String password, String fullName,
      String phoneNumber) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        res = 'scuccess';

        await _firestore.collection('buyers').doc(cred.user!.uid).set({
          'email': email,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'buyerId': cred.user!.uid,
          'adderss': ''
        });
        res = 'scuccess';
      } else {
        res = 'Please Fields must not be empty';
      }
    } catch (e) {}
    return res;
  }

  Future<String>  loginUsers(String email, String password) async {
    String res = 'somthig went worng';
    
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'success';
      } else {
        res = 'please fileds must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
