Package.describe({
  name: 'spastai:flow-controll',
  summary: 'Queues to controll the flow - postpone slowdonw execution',
  version: '0.0.1',
  git: ' /* Fill me in! */ '
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');
  api.use(["coffeescript", "underscore" ], ["client", "server"]);
  api.add_files('SlowQueue.js', 'client');
  api.add_files('ParallelQueue.coffee', 'client');

  api.export(['ParallelQueue'], 'client');
});

Package.onTest(function(api) {
  api.use(["coffeescript", 'tinytest', "test-helpers"]);
  api.use('spastai:flow-controll');
  api.addFiles('flow-controll-tests.coffee');
});
