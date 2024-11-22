import 'package:flutter/material.dart';
import 'package:viacep/model/endereco_model.dart';

class HomeController extends ChangeNotifier {
  TextEditingController entradaCep = TextEditingController();
  String resultado = "";

    Future<String> buscarCep() async{
    // Instanciar OBJ:
    EnderecoModel endereco = EnderecoModel();
    endereco = await EnderecoModel.buscarCep(entradaCep.text);
    return  "CEP: ${endereco.cep}\n Logradouro: ${endereco.logradouro}";
 
   
  }
}
