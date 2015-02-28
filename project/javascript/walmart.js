function WalmartController($scope, $http) {
    var url = window.location.search;
    var param = decodeURIComponent(url.split("=")[1]);

    $http({
        method: 'POST',
        url: "API.aspx",
        data: $.param({
            searchItem: param,
            store: "walmart"
        }),
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
    .success(function (response) {
        $scope.response = response;
        $scope.items = response.items;
        console.log($scope.items);
    })
    .error(function (err) {
        console.log("error");
        $scope.response = err;
    })

    var value = new Object;
    value.username = $('#ValueHiddenField').val();
    console.log(value);
    $http.post("walmart.aspx/loadSavedStores", value).
    success(function (data) {
        if (JSON.parse(data.d)) {
            $scope.products = JSON.parse(data.d);
        }
        else {
            alert("There is no data ");
        }
        console.log(JSON.parse(data.d));
    });

}