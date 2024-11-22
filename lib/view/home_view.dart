import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:smart_alert_dialog/models/alert_dialog_text.dart';
import 'package:viacep/controller/home_controller.dart';
import 'package:smart_alert_dialog/smart_alert_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //iniciar o controller
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Image.asset('assets/images/maps.png'),
          Text(
            'Buscador de CEP',
            style: TextStyle(fontSize: 20),
          ),
          Center(
            child: MaskedTextField(
              textFieldController: controller.entradaCep,
              inputDecoration: const InputDecoration(
                  hintText: '12345-456.', counterText: ""),
              autofocus: true,
              mask: 'xxxxx-xxx',
              maxLength: 15,
              keyboardType: TextInputType.number,
              onChange: (value) {},
            ),
          ),
          ElevatedButton.icon(
              onPressed: () async {
                controller.resultado = await controller.buscarCep();
                setState(() {
                  print(controller.resultado);

                  showDialog(
                    context: context,
                    builder: (_) => SmartAlertDialog(
                      title: "Endereço encontrado:",
                      text: AlertDialogText(),
                      message:
                           controller.resultado,
                      onConfirmPressed: () => print("do something on confirm"),
                      onCancelPressed: () => print("do something on cancel"),
                    ),
                  );
                });
              },
           
              icon: Icon(Icons.search),

              label: Text('Pesquisar')
          
              ),
        ],
      ),
    );
  }
}
