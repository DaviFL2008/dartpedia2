/* 
------------------------------------------------------------------------------------------------------

$. /command_runner/lib/src/arguments.dart

Nome: arguments.dart

Site:

Programa auxiliar para acrecentar funcoes de variavel no Cli.dart

Responsavel: Lucas Franco de Novais

Email: l.novais@aluno.senai.br

Manutencao: Lucas Franco de Novais

------------------------------------------------------------------------------------------------------

Funcionamento:

Arquivo auxiliar sobre programacao orientada a objetos em Dart, incluindo classes abstratas, heranca, sobrescrita e enumeracoes. 

Obs: Importante! Este Arquivo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar!.

Ordem:
	$cd ./dartpedia
	$cd ./command_runner
	$cd ./lib
	$cd ./src
	$vim arguments.dart
	
	ou 
	
        $cd ./dartpedia
	$cd ./command_runner/lib/src
	$vim arguments.dart

Exemplo:

	$ ./command_runner/lib/src
	$ Dart run
	$ Saida   

------------------------------------------------------------------------------------------------------

Descrição Geral:

$./dartpedia Este eh o executavel , o nome do aplicativo.

help Este eh um comando , uma acao que voce deseja que o aplicativo execute.

--verbose: Trata-se de um sinalizador (um tipo de opcao que nao recebe um valor), que modifica o comportamento do comando.

--command=search Esta eh uma opcao que recebe um valor. Aqui, o option valor command eh search.

Enum representa o tipo de opcao, que pode ser um `Enum` flag (uma opcao booleana) ou um `Enum` option(uma opcao que aceita um valor). Enums sao uteis para representar um conjunto fixo de valores possiveis.

------------------------------------------------------------------------------------------------------

Dicionario de Historico:

V = versao;

1.0 = Inicio do Versionamento;

. = Implementacao de versionamento

1 = Proxima Versao  , 2, Proxima versao, assim por diante 



Historico de Versao:

Data de criacao: 14/04/2026

Versao 1 - 1.0 - 14/04/2026 - 16:47 - Lucas Franco de Novais

Primeira versao e comeco de desenvolvimento do codigo do projeto:

command_runner/lib/src/arguments.dart

enum Optiontype {flag, option}







 name eh algo String que identifica o argumento de forma unica.

. help eh um campo opcional String que fornece uma descricao.

. defaultValue eh do tipo Object? porque pode ser um bool(para bandeiras) ou um String.

. valueHelp Eh um parametro opcional String para dar uma dica sobre o valor esperado.

. O usage metodo getter fornecera uma string mostrando como usar o argumento.
------------------------------------------------------------------------------------------------------
Licença de Uso: Open Source


*/

//command_runner/lib/src/arguments.dart
import 'dart:async';
import 'command_runner_base.dart';

enum OptionType { flag, option }

abstract class Argument {
  String get name;
  String? get abbr; // ADICIONADO: O command_runner_base precisa disso
  String? get help;
  Object? get defaultValue;
  String? get valueHelp;
  String get usage;
}

class Option implements Argument {
  @override
  final String name;
  @override
  final String? abbr; // ADICIONADO
  @override
  final String? help;
  @override
  final Object? defaultValue;
  @override
  final String? valueHelp;
  final OptionType type;

  Option(
    this.name, { // Mudado para posicional para aceitar o formato do help_command
    this.abbr,
    this.help,
    this.defaultValue,
    this.valueHelp,
    required this.type,
  });

  @override
  String get usage => '  --$name\t\t${help ?? ''}';
}

class ArgResults {
  Command? command;
  String? commandArg; // ADICIONADO: Guarda argumentos extras passados ao comando
  Map<Option, Object?> options = {}; // Mudado para aceitar atribuição direta (results.options = ...)
}

abstract class Command {
  String get name;
  String get description;
  
  CommandRunner? runner;

  final List<Option> _options = [];
  List<Option> get options => _options;

  // Ajustado o primeiro parâmetro para posicional para bater com o help_command.dart
  void addFlag(String name, {String? abbr, String? help, bool? defaultValue}) {
    _options.add(Option(name, abbr: abbr, help: help, defaultValue: defaultValue ?? false, type: OptionType.flag));
  }

  void addOption(String name, {String? abbr, String? help, String? defaultValue, String? valueHelp}) {
    _options.add(Option(name, abbr: abbr, help: help, defaultValue: defaultValue, valueHelp: valueHelp, type: OptionType.option));
  }

  FutureOr<Object?> run(ArgResults args);

  String get usage => 'Usage: $name [options]';
}