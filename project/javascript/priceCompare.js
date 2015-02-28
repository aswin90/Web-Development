function PriceController($scope, $http) {
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
        console.log($scope.items);
        $scope.items = response.items; 
    })
    .error(function (err) {
        console.log("error");
        $scope.response = err;
    })

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
        console.log("amazon");
        console.log($.isArray(json.Items.Item));
        if (!$.isArray(json.Items.Item)) { 
            $scope.itemsAmazon = jQuery.makeArray(json.Items.Item);
        }
        else {
            $scope.itemsAmazon = json.Items.Item;
        }
                
    })
    .error(function (err) {
        console.log("error");
        $scope.response = err;
    })

    $http({
        method: 'POST',
        url: "API.aspx",
        data: $.param({
            searchItem: param,
            store: "ebay"
        }),
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
    .success(function (response) {
                
                
        $scope.itemsEbay = response.findItemsByKeywordsResponse[0].searchResult[0].item;
        console.log("eBay");
        console.log($scope.itemsEbay);
                
    })
    .error(function (err) {
        console.log("error");
        $scope.response = err;
    })
 
}
