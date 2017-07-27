(function() {
    app.factory('FetchFileFactory', ['$http',
        function($http) {
          var _factory = {};

          _factory.fetchFile = function(path) {
            return $http.get('fbe/api/getfile?path=' + encodeURIComponent(path));
          };

          return _factory;
        }
    ]);

}());
