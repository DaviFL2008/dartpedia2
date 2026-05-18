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

// Paste this new class below the enum you added
abstract class Argument {
  String get name;
  String? get help;

  // In the case of flags, the default value is a bool.
  // In other options and commands, the default value is a String.
  // NB: flags are just Option objects that don't take arguments
  Object? get defaultValue;
  String? get valueHelp;

  String get usage;


 name eh algo String que identifica o argumento de forma unica.

. help eh um campo opcional String que fornece uma descricao.

. defaultValue eh do tipo Object? porque pode ser um bool (para bandeiras) ou um String.

. valueHelp Eh um parametro opcional String para dar uma dica sobre o valor esperado.

. O usage metodo getter fornecera uma string mostrando como usar o argumento.

Versao 2 - 2.0 - 27/04/2026 - 16:19 - Lucas Franco de Novais

command_runner/lin/src/arguments.dart

enum OptionType { flag, option }

// Paste this new class below the enum you added
abstract class Argument {
  String get name;
  String? get help;

  // In the case of flags, the default value is a bool.
  // In other options and commands, the default value is a String.
  // NB: flags are just Option objects that don't take arguments
  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}

class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;

  final OptionType type;

  @override
  final String? help;

  final String? abbr;

  @override
  final Object? defaultValue;

  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}


Versao 3 - 3.0 - 27/04/26 - 16:30 - Lucas Franco de Novais

command_runner/lib/src/arguments.dart

import '../command_runner.dart';
import 'dart:collection'; // New import
import 'dart:async'; // New import


enum Optiontype { flag, optiom }

// Paste this new class below the enum you added
abstract class Argument {
  String get name;
  String? get help;

  // In the case of flags, the default value is a bool.
  // In other options and commands, the default value is a String.
  // NB: flags are just Option objects that don't take arguments
  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}

class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;

  final OptionType type;

  @override
  final String? help;

  final String? abbr;

  @override
  final Object? defaultValue;

  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}
// Add this class below the Option class
abstract class Command extends Argument {
  // Properties and methods will go here
}

abstract class Command extends Argument {
  @override
  String get name;

  String get description;

  bool get requiresArgument => false;

  late CommandRunner runner;

  @override
  String? help;

  @override
  String? defaultValue;

  @override
  String? valueHelp;
}

  final List<Option> _options = [];

  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());
}

    // A flag is an [Option] that's treated as a boolean.
  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: false,
        valueHelp: valueHelp,
        type: OptionType.flag,
      ),
    );
  }

  // An option is an [Option] that takes a value.
  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
  }) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }
}

  FutureOr<Object?> run(ArgResults args);

  @override
  String get usage {
    return '$name:  $description';
  }
}



run(ArgResults args) Este metodo abstrato eh onde reside a logica de um comando. As subclasses concretas devem implementa-lo.

usage Este getter fornece uma string de uso simples, combinando o comando name e description.


-------------------------------------------------------------------------------------
Licenca de uso: Opensource

PARTE DA TASK 5 ACIMA (PROVAVELMENTE)
*/ 

                                                      
