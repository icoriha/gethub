import 'dart:io';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/domain/i_api/i_github_api.dart';
import 'package:gethub/foundation/typedefs.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/infra/entity/github_repo_entity.dart';

final gitHubAPIProvider = Provider.autoDispose(((_) => GitHubAPI()));

class GitHubAPI implements IGitHubAPI {
  static const url = 'https://api.github.com/search/repositories';

  @override
  Future<List<GitHubRepo>> searchRepos(String searchWord) async {
    final httpClient = HttpClient();
    try {
      final query = '?q=$searchWord';

      final request = await httpClient.getUrl(Uri.parse(url + query));
      final response = await request.close();
      final content = await response.transform(utf8.decoder).join();
      final data = json.decode(content);

      final Iterable items = data['items'];
      final gitHubRepos = items
          .map((item) => GitHubRepoEntity.fromJson(Json.from(item)).toModel())
          .toList();
      return gitHubRepos;
    } on Exception {
      rethrow;
    } finally {
      httpClient.close();
    }
  }
}
