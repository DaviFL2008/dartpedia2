/*
=================================================================================================================================================================================================================
 $. /dartpedia/cli/bin

Nome: Cli.dart 

Site: 

Programa para dar uma saia output Hello Word 

responsavel: Lucas Franco de Novais

email:l.novais@aluno.senai.br 

Manutencao: Lucas Franco de Novais
=================================================================================================================================================================================================================

Funcionamento:

Inicialmente o cli, ao ser executado, mostra uma saudacao na tela, por exemplo:

Dentro da pasta dartpedia em /home/lucas.novais/dartpedia/cli rode o comando
dart run; deve aparecer a mensagem de saudacao, "Hello, Dart!"

Obs. Importante ! Este aplicativo este em desenvolvimento e ao longo do tempo o
comportamento do aplicativo pode mudar.


Ordem:

	$cd ./dartpedia

	$cd cli

	$./dartpedia/cli
	$cd bin

	$./dartpedia/cli/bin

	$ vim cli.dart


Exemplo:
	
	$ ./dartpedia/cli/bin

	$ Dart run	

	$ Hello world: 42


=================================================================================================================================================================================================================

Dicionario de Historico: 

v = versao

1.0 = Inicio do versionamento

. = Implementacao de versionamento

1 = Proxima versao, 2, proxima versao, e assim por diante.



Historico de Versao:


 Data criação: 30/03/26

Versoes disponiveis: 9

Versao 1 - 1.0 30/03/26, 15:39, Lucas Franco de Novais
 
 Primeira versao do codigo do projeto:

void main(List<String> arguments) {
  print('Hello world: ${cli.calculate()}!');
}


Saida padrao ao executar o codigo: 

Building package executable...
Built cli:cli.
Hello world: 42!

----------------------------------------------------------

Versao 2 - v1.1 30/03/26, 15:47, Lucas Franco de Novais 

atualizacao do codigo para uma nova versao

const version ='0.0.2';

void main(List<String> arguments) {
  print('Hello, Dart!'); // Change this line
}

Saida padrao ao executar o codigo:

Building package executable...
Built cli:cli.
Hello, Dart!

----------------------------------------------------------

Versao 3 - v1.2 30/03/26, 15:57, Lucas Franco de Novais

Adicao do const version e operacoes de decisao

const version = '0.0.3'; // Add this line

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello, Dart!');
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
 }

Saida ao executar o codigo: 
dart bin/cli.dart version. Obs. Importate !! Se voce executar seu aplicativo sem argumentos, ainda vera "Ola, Dart!". 

Voce devera ver agora:

Dartpedia CLI version 0.0.2

----------------------------------------------------------


Versao 4 -  v1.3 30/03/26, 16:33, Lucas Franco de Novais

atualizacao do codigo com a def o printusage

const version = '0.0.4'; // Add this line


void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage(); // Change this from 'Hello, Dart!'
   } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else {
    printUsage(); // Catch-all for any unrecognized command.
  }
}

Saida ao executar o codigo:

 Perguntas: O que acontece ao executar este codigo, com o comando Dart run ?
R: vai funcionar  mostrando os comando validos.
 E o comando dart run cli.dart version ?
R: mostra a versao
 Como executo o help ? E o search ?
dart cli.dart help | dart cli.dart search
----------------------------------------------------------

Versao 5 - 1.4 06/04/2026, 15:45, Lucas Franco de Novais

Integrado o comando search

const version = '0.0.5'; //Add this line


void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    print('Search command recognized!');
  } else {
    printUsage();
  }
}

Saida ao executar o codigo: 1 -> dart bin/cli.dart help. Tente tambem, 2 -> dart bin/cli.dart.

Saida 1 -> The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>

Saida 2 -> The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>

----------------------------------------------------------

Versao 6 - 1.5 06/04/26, 16:09, Lucas Franco de Novais

Definicao da funcao searchwikipedia

const String version = '0.0.6';

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    print('Search command recognized!');
    searchWikipedia(arguments.skip(1).toList());
  } else {
    printUsage();
  }


void searchWikipedia(List<String>? arguments) {
  if (arguments == null || arguments.isEmpty) {
    print('Nenhum termo de busca foi fornecido.');
    return;
  }
  
  print('searchWikipedia received arguments: $arguments');
}


Saida ao executar o codigo: Teste o novo comando: Execute sua aplicacao com o search comando:

dart bin/cli.dart search

Voce devera ver:

Search command recognized!

----------------------------------------------------------

Versao 7 - 1.6 06/04/26, 16:24, Lucas Franco de Novais

Atualizacao do codigo  chamando as funcoes pela mainfuncao

const version = '0.0.7'; // Add this line

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) { // Add this new function and add ? to arguments type
  print('searchWikipedia received arguments: $arguments');
}

Saida: 

dart bin/cli.dart search

Voce deveria ver:

searchWikipedia received arguments: null

----------------------------------------------------------

Versao 8 - 1.7 06/04/26, 16:35, Lucas Franco de Novais

Atualizacao do codigo  para lidar com a falta de titulo usando import dart:io

import 'dart:io'; //add this line at the top

const version = '0.0.8'; // Add this line

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}
void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    articleTitle = arguments.join(' ');
  }

  print('Current article title: $articleTitle');
}

Saida: 

Caso faltem argumentos, o programa solicita informacoes ao usuario, le a entrada usando `read` stdin.readLineSync()e lida de forma segura com os casos em que nenhuma entrada eh fornecida.

Caso existam argumentos , ele arguments.join(' ') os combina em uma unica string de busca.

dart bin/cli.dart search

Please provide an article title.

Input do usuario: Flutter SDK

Current article title: Flutter SDK

----------------------------------------------------------

Versao 9 - 1.8 06/04/26, 16:45, Lucas Franco de Novais

Atualizacao do codigo para ter imagem no comando search
*/

import 'dart:io'; // Add this line at the top
import 'package:http/http.dart' as http;

const version = '0.0.9'; // Add this line

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}


Future<String> getWikipediaArticle(String articleTitle) async {
  'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  final response = await http.get(url); // faz a http request

  if (response.statusCode == 200) {
   return response.body;	
}

 return 'Erro: falha em pega o article  "$articleTitle". Status code: ${response.statusCode}';

}

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync(); // Read input
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return; // Exit the function if no valid input
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}




/*
Saida:

dart bin/cli.dart search Dart Programming

Voce deveria ver:

Looking up articles about "Dart Programming". Please wait.
Here ya go!
(Pretend this is an article about "Dart Programming")


==================================================================================================================================================================================================================================================================================================
*/



