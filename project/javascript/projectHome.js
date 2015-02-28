$(document).ready(function () {

    $(".result").hide();
            
});

function ItemSearchController($scope, $http) {

$scope.getItem = function () {

    searchItemAmazon = $('#item').val().trim();

    if (searchItemAmazon == null || searchItemAmazon == "") {
                    
        alert("Enter the search item!");
        return false;
    }

var displayAmazon = new Object();
                
displayAmazon.searchItem = searchItemAmazon;
displayAmazon.store = "amazon";

$http({
    method: 'POST',
    url: "API.aspx",
    data: $.param(displayAmazon),
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
}).
success(function (data) {
    console.log(data);
    var json = $.xml2json(data);
    //console.log(json);
    $(".result").toggle();
    $scope.items = json.Items.Item;
    console.log($scope.items);
});


}

}
