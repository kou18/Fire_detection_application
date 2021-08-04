import 'package:flutter/material.dart';
import 'package:stage_prototype/NouveauMdp.dart';

class RecuperationMdp extends StatefulWidget {
  @override
  _RecuperationMdpState createState() => _RecuperationMdpState();
}

class _RecuperationMdpState extends State<RecuperationMdp> {

  late String _code;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Incendie'
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Un email de réinitialisation a été envoyé à votre adresse.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Vérifier le code :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Code'
                      ),
                      validator: (value) {
                        if(value== null || value.isEmpty){
                          return 'Veuillez entrer le code reçu par email';
                        }
                      },
                      onSaved:(value) {
                        if(value !=null) {
                          _code = value;
                          print(_code);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if(!_formKey.currentState!.validate()){
                            return;
                          }
                          _formKey.currentState!.save();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (context) => new NouveauMdp()));
                        },
                        child: Text(
                          'Valider',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
