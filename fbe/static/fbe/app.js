(function() {
    var app = angular.module('fileBrowserApp');

    app.controller('HomeCtrl', ['$scope', 'FetchFileFactory',
        function($scope, FetchFileFactory) {

            $scope.editor = ace.edit("editor");

            $scope.nodeSelected = function(e, data) {
                var _l = data.node.li_attr;
                if (_l.isLeaf) {
                    FetchFileFactory.fetchFile(_l.file_path).then(function(data) {
                        $scope.editor.setValue(data.data.content);
                    });
                } else {
                $scope.$apply(function() {
                    $scope.fileViewer = 'Please select a file to view its contents';
                });
                }
            };
        }
    ]);
 
}());

