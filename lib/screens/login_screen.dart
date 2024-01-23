import 'package:flutter/material.dart';
import 'package:uts_flutter/screens/forgot_password_screen.dart';
import 'package:uts_flutter/screens/register_screen.dart';
import 'package:uts_flutter/screens/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:uts_flutter/providers/auth.dart';
import 'package:uts_flutter/utils/http_exception.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final Map<String, String> _authData = {'username': '', 'password': ''};

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      //invalid
      return;
    }
    _formKey.currentState?.save();
    try {
      // await Provider.of<Auth>(context, listen: false)
      //     .login(_authData['email']!, _authData['password']!);
      final response = await http.post(
        Uri.parse(
            'https://api-flutter-deri.000webhostapp.com/api-v2/login.php'),
        headers: {'Cookie': 'PHPSESSID=mnl9b31m5vu2pns94ss7j3rkr7'},
        body: {
          'username': _authData['username']!,
          'password': _authData['password']!,
        },
      );
      // } on HttpException catch (e) {
      //   var errorMessage = 'Authentifikasi gagal';
      //   if (e.toString().contains('INVALID_EMAIL')) {
      //     errorMessage = 'username salah';
      //     _showerrorDialog(errorMessage);
      //   } else if (e.toString().contains('EMAIL_NOT_FOUND')) {
      //     errorMessage = 'username tidak ditemukan';
      //     _showerrorDialog(errorMessage);
      //   } else if (e.toString().contains('INVALID_PASSWORD')) {
      //     errorMessage = 'Password Salah';
      //     _showerrorDialog(errorMessage);
      //   }
      // } catch (error) {
      //   var errorMessage = 'Silahkan ulangi kembali';
      //   _showerrorDialog(errorMessage);
      // }
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyButtomNavBar()),
        );
      } else {
        // Handle unsuccessful login
        print('Authentication failed: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle general errors
      print('Error: $error');
      var errorMessage = 'Silahkan ulangi kembali';
      _showerrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(360),
                      bottomRight: Radius.circular(360)),
                  color: Colors.green),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 50, left: 20, right: 20, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "STTB Bandung",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Selamat Datang di Aplikasi Kemahasiswaan",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Username",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                )),
                            // validator: (value) {
                            //   if (value!.isEmpty || !value.contains('@')) {
                            //     return 'email salah';
                            //   }
                            //   return null;
                            // },
                            onSaved: (value) {
                              _authData['username'] = value!;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          TextFormField(
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.white,
                                )),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'Password terlalu pendek';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value!;
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 40),
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                _submit();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const RegisterScreen()));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(top: 90),
                                child: const Text(
                                  "Registrasi",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showerrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'An Error Occurs',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
