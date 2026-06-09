class ArchitectureSignalBuilder {
  String build(List<String> files, List<String> dependencies) {
    int repositories = 0;
    int providers = 0;
    int blocs = 0;
    int cubits = 0;
    int viewModels = 0;
    int services = 0;

    for (final file in files) {
      final lower = file.toLowerCase();

      if (lower.contains('repository')) {
        repositories++;
      }

      if (lower.contains('provider')) {
        providers++;
      }

      if (lower.contains('bloc')) {
        blocs++;
      }

      if (lower.contains('cubit')) {
        cubits++;
      }

      if (lower.contains('viewmodel') || lower.contains('view_model')) {
        viewModels++;
      }

      if (lower.contains('service')) {
        services++;
      }
    }

    bool hasFeatures = files.any((f) => f.contains('features'));

    bool hasDomain = files.any((f) => f.contains('domain'));

    bool hasData = files.any((f) => f.contains('data'));

    bool hasPresentation = files.any((f) => f.contains('presentation'));

    bool hasCore = files.any((f) => f.contains('core'));

    bool hasShared = files.any((f) => f.contains('shared'));

    bool hasWidgets = files.any((f) => f.contains('widgets'));

    bool hasScreens = files.any((f) => f.contains('screens'));

    bool hasPages = files.any((f) => f.contains('pages'));

    final lowerDeps = dependencies.map((e) => e.toLowerCase()).toList();
    final hasProvider = lowerDeps.contains('provider');

    final hasRiverpod = lowerDeps.any(
      (d) =>
          d == 'riverpod' || d == 'flutter_riverpod' || d == 'hooks_riverpod',
    );

    final hasBloc = lowerDeps.any(
      (d) => d.contains('flutter_bloc') || d.contains('bloc'),
    );

    final hasGetX = lowerDeps.contains('get');

    final hasMobX = lowerDeps.any((d) => d.contains('mobx'));

    final hasRedux = lowerDeps.any((d) => d.contains('redux'));

    final hasStacked = lowerDeps.contains('stacked');

    return '''
Architecture Signals

Repositories: $repositories
Providers: $providers
Blocs: $blocs
Cubits: $cubits
ViewModels: $viewModels
Services: $services

Folders

Features: $hasFeatures
Domain: $hasDomain
Data: $hasData
Presentation: $hasPresentation
Core: $hasCore
Shared: $hasShared
Widgets: $hasWidgets
Screens: $hasScreens
Pages: $hasPages

State Management

Provider: $hasProvider
Riverpod: $hasRiverpod  
Bloc: $hasBloc
GetX: $hasGetX
MobX: $hasMobX
Redux: $hasRedux
Stacked: $hasStacked
  

''';
  }
}
