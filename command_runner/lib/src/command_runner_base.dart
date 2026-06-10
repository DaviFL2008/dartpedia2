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

*/
/*Versao 3 - 3.0 - 27/04/26 - 16:30 - Lucas Franco de Novais

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

// Add this class to the end of the file
class ArgResults {
  Command? command;
  String? commandArg;
  Map<Option, Object?> options = {};

  // Returns true if the flag exists.
  bool flag(String name) {
    // Only check flags, because we're sure that flags are booleans.
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      if (option.name == name) {
        return options[option] as bool;
      }
    }
    return false;
  }

  bool hasOption(String name) {
    return options.keys.any((option) => option.name == name);
  }

  ({Option option, Object? input}) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );

    return (option: mapEntry.key, input: mapEntry.value);
  }
}

*/
/*
-------------------------------------------------------------------------------------
Licenca de uso: Opensource

// ----------------------------------------------------- Feito por Thiago --------------------------------------------------------------


class CommandRunner {                                    // CommandRunner: é uma classe que serve como um stand-in simplificado por enquanto. O ITS correr método atualmente apenas imprime os argumentos que recebe.
                                                         // Executa a lógica de aplicação da linha de comando com os argumentos dados.

  Future<void> run(List<String> input) async {           // future void:  é um tipo de retorno que indica que este método pode realizar operações assíncronas, mas não retorna um valor.
    print('CommandRunner received arguments: $input');
  }
}

// ----------------------------------------------------- Feito por Thiago -------------------------------------------------------------
*/

/* versao 4 - atualização do comando class tarefa 5 parte 2 
feito - lucas franco - 16:00

// ----------------------------------------------------- Feito por Lucas -------------------------------------------------------------
*/
import 'dart:async'; // Add this line
import 'dart:collection';
import 'dart:io';

import 'arguments.dart';
import 'exceptions.dart'; // Add this line



class CommandRunner {
  // Add a constructor that accepts the optional callback.
  CommandRunner({this.onOutput, this.onError});

  /// If not null, this method is used to handle output. Useful if you want to
  /// execute code before the output is printed to the console, or if you
  /// want to do something other than print output the console.
  /// If null, the onInput method will [print] the output.
  FutureOr<void> Function(String)? onOutput;

  FutureOr<void> Function(Object)? onError;
  final Map<String, Command> _commands = <String, Command>{};

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(<Command>{..._commands.values});

  // Define the onError property.
  FutureOr<void> Function(Object)? onError;

  void addCommand(Command command) {
    _commands[command.name] = command;
    command.runner = this;
  }


  Future<void> run(List<String> input) async {
    try {
      final ArgResults results = parse(input);
      if (results.command != null) {
        Object? output = await results.command!.run(results);
        if (onOutput != null) {
          await onOutput!(output.toString());
        } else {
          print(output.toString());
        }
      }
    } on Exception catch (exception) {
      if (onError != null) {
        onError!(exception);
      } else {
        rethrow;
      }
    }
  }


// [Step 6 update] This method is replaced entirely.
ArgResults parse(List<String> input) {
  ArgResults results = ArgResults();
  if (input.isEmpty) return results;

  // Throw an exception if the command is not recognized.
  if (_commands.containsKey(input.first)) {
    results.command = _commands[input.first];
    input = input.sublist(1);
  } else {
    throw ArgumentException(
      'The first word of input must be a command.',
      null,
      input.first,
    );
  }

  // Throw an exception if multiple commands are provided.
  if (results.command != null &&
      input.isNotEmpty &&
      _commands.containsKey(input.first)) {
    throw ArgumentException(
      'Input can only contain one command. Got ${input.first} and ${results.command!.name}',
      null,
      input.first,
    );
  }

  // Section: Handle options, including flags.
  Map<Option, Object?> inputOptions = {};
  int i = 0;
  while (i < input.length) {
    if (input[i].startsWith('-')) {
      var base = _removeDash(input[i]);
      // Throw an exception if an option is not recognized for the given command.
      var option = results.command!.options.firstWhere(
        (option) => option.name == base || option.abbr == base,
        orElse: () {
          throw ArgumentException(
            'Unknown option ${input[i]}',
            results.command!.name,
            input[i],
          );
        },
      );

      if (option.type == OptionType.flag) {
        inputOptions[option] = true;
        i++;
        continue;
      }

      if (option.type == OptionType.option) {
        // Throw an exception if an option requires an argument but none is given.
        if (i + 1 >= input.length) {
          throw ArgumentException(
            'Option ${option.name} requires an argument',
            results.command!.name,
            option.name,
          );
        }
        if (input[i + 1].startsWith('-')) {
          throw ArgumentException(
            'Option ${option.name} requires an argument, but got another option ${input[i + 1]}',
            results.command!.name,
            option.name,
          );
        }
        var arg = input[i + 1];
        inputOptions[option] = arg;
        i++;
      }
    } else {
      // Throw an exception if more than one positional argument is provided.
      if (results.commandArg != null && results.commandArg!.isNotEmpty) {
        throw ArgumentException(
          'Commands can only have up to one argument.',
          results.command!.name,
          input[i],
        );
      }
      results.commandArg = input[i];
    }
    i++;
  }
  results.options = inputOptions;

  return results;
}

String _removeDash(String input) {
  if (input.startsWith('--')) {
    return input.substring(2);
  }
  if (input.startsWith('-')) {
    return input.substring(1);
  }
  return input;
}

String get usage {
    final exeFile = Platform.script.path.split('/').last;
    return 'Usage: dart bin/$exeFile <command> [commandArg?] [...options?]';
  }
}
                                                      
