function ServicesCtrl($scope, $http) {
    console.log("Hello from ServicesCtrl");

    $scope.message = "Add to the class by entering your NU ID";
   
    $scope.renderServiceClients = function (response) {
        $scope.serviceClients = response;
    };

    $scope.create = function () {
        $http.post("/serviceClients", $scope.serviceClient)
            .success(function (response) {
                $scope.all();
            });
    };

    $scope.all = function () {
        $http.get("/serviceClients")
            .success($scope.renderServiceClients);
    }

    $scope.remove = function (id) {
        $http.delete("/serviceClients/" + id)
        .success(function (response) {
            $scope.all();
        });
    }

    $scope.all();

    

}