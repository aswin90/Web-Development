function amazonController($scope, $http) {
    var url = window.location.search;
    var param = decodeURIComponent(url.split("=")[1]);
    console.log(param);

    $http({
        method: 'POST',
        url: "API.aspx",
        data: $.param({
            searchItem: param,
            store: "amazon"
        }),
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
    .success(function (response) {
        var json = $.xml2json(response);
                
        if (!$.isArray(json.Items.Item)) {
            $scope.itemsAmazon = jQuery.makeArray(json.Items.Item);
            console.log($scope.itemsAmazon);
        }
        else {
            $scope.itemsAmazon = json.Items.Item;
            console.log($scope.itemsAmazon);
        }
    })
    .error(function (err) {
        console.log("error");
        $scope.response = err;
    })

    var value = new Object;
    value.username = $('#ValueHiddenField').val();
    console.log(value);
    $http.post("amazon.aspx/loadSavedStores", value).
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
