var url = "http://api.walmartlabs.com/v1/search?apiKey=spw36je9q66fe886224gu5te&query=abc";

function ItemSearchController($scope, $http) {
    $scope.item = "";
    $scope.getItem = function () {
        var item = $scope.item;
        console.log([item]);
        var URL = url.replace("abc", item);
        console.log(URL);

        $http.get(URL).success(function (response) {
            $scope.items = response.items;
            console.log($scope.items);

        });

    }
}

