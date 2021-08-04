import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stage_prototype/FormScreen.dart';
import 'package:stage_prototype/RecuperationMdp.dart';
import 'package:stage_prototype/Videosurveillance.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String _email;
  late String _mdp;
  bool connecte= false;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email'
      ),
      validator: (value) {
        if(value== null || value.isEmpty){
          return 'Le champs Email est obligatoire';
        }
        if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)){
          return 'Entrer une adresse email valide';
        }
      },

      onSaved:(value) {
        if(value !=null) {
          _email = value;
        }
      },
    );
  }

  Widget _buildMdp(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Mot de passe'
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) {
        if(value== null || value.isEmpty){
          return 'Le champs Mot de passe est obligatoire';
        }
      },
      onSaved:(value) {
        if(value !=null) {
          _mdp = value;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Incendie',
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(25,10,25,10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                    image: AssetImage('assets/db.png'),
                    height:100,
                    width: 50),
                SizedBox(height: 20),
                _buildEmail(),
                _buildMdp(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                        value: connecte,
                        onChanged: (bool? value) {
                          setState(() {
                            connecte = value!;
                          });
                        },
                        checkColor: Colors.white,

                    ),
                    Text(
                        'Rester Connecté ?',
                         style: TextStyle(
                           fontSize: 14,
                           color: Colors.black,
                         ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: (){
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    _formKey.currentState!.save();
                    print(_email);
                    print(_mdp);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new VideoSurveillance()));
                  },
                  child: Text(
                    'Se Connecter',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'OU',
                  textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                   ),),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new FormScreen()));
                  },
                  child: Text(
                    'Créer un compte',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.right,
                    text: TextSpan(
                          text: 'Mot de passe oublié ?',
                          recognizer: TapGestureRecognizer()
                          ..onTap= () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(builder: (context) => new RecuperationMdp()));
                          },
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),

                    ) )
              ],
            ),),
        ),
      ),
    );
  }
}

