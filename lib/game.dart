import 'dart:math';
import 'package:flutter/material.dart';

class jogo extends StatefulWidget {
  const jogo({ Key? key }) : super(key: key);

  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {

var _imagemApp = AssetImage('images/padrao.png');
var _mensagem = 'Escolha uma opção abaixo';

void _opcaoSelecionada(String escolhaUsuario){
   
  var opcoes = ["pedra", 'papel', 'tesoura'];
  var numeros = Random().nextInt(3);
  var escolhaApp = opcoes[numeros];

/*
print("escolha do app "+ escolhaApp);
print("escolha do Usuario " + escolhaUsuario);
*/

//Exibição escolhaApp

  switch (escolhaApp){
    case 'pedra':
    setState(() {
      this._imagemApp = AssetImage('images/pedra.png');
    });
    break;

case 'papel':
    setState(() {
      this._imagemApp = AssetImage('images/papel.png');
    });
    break;

case 'tesoura':
    setState(() {
      this._imagemApp = AssetImage('images/tesoura.png');
    });
    break;
  }

// validação Usuário ganhador
 if((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
    (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
    (escolhaUsuario == 'papel' && escolhaApp == 'pedra'))
 { 
 _mensagem = 'Você Ganhou :)';
//Validação maquina ganhador
 } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
           (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
           (escolhaApp == 'papel' && escolhaUsuario == 'pedra'))
           {
             _mensagem = 'Você perdeu :(';
//Empate
 }else {

   _mensagem = 'EMPATE';

 }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //text
              Text('Escolha do App',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //image
              Padding(
                padding: const EdgeInsets.all(8.0),
               
              ),
             Image(image: this._imagemApp,height: 95,),
              //text resultado
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this._mensagem,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              //linha 3 imagens
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               GestureDetector(
                 onTap: () => _opcaoSelecionada('pedra'),
                 child: Image.asset('images/pedra.png', height: 95,)),
              GestureDetector(
                 onTap: () => _opcaoSelecionada('papel'),
                 child: Image.asset('images/papel.png', height: 95,)),
              GestureDetector(
                 onTap: () => _opcaoSelecionada('tesoura'),
                 child: Image.asset('images/tesoura.png', height: 95,)),
              ],
            )

            ],
          ),
        ),
      ),
    );
  }
}