//Parte feita por Davi Ferreira Leite
// ... (your existing printUsage() function)

Future<String> getWikipediaArticle(String articleTitle) async {
  //You'll add more code here soon
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  // ...
}

