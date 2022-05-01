import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos (){
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if( nome.length > 3){
      if( email.length > 3 && email.contains("@")){
        if( senha.length > 6){
          setState(() {
            _mensagemErro = "";
            _cadastrarUsuario();
          });
        }else{
          setState(() {
            _mensagemErro = "Sua senha precisa ter no minimo 7 Caracteres ";
          });
        }
      }else{
        setState(() {
          _mensagemErro = "Preencha o Email Utilizando @";
        });
      }
    }else{
      setState(() {
        _mensagemErro = "Nome precisa ter mais que 3 Caracteres";
      });
    }
  }
  _cadastrarUsuario(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Color(0xff075E54),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54) ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(padding:EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "imagens/usuario.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 20, 32, 20),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)
                        )
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 20, 32, 20),
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)
                        )
                    ),
                  ),
                ),
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 20, 32, 20),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    child: Text("Cadastrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(162, 20, 162, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    onPressed: (){
                      _validarCampos();
                    },
                  ),
                ),
                Text(
                  _mensagemErro,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 15
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
