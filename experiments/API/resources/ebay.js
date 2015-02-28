var url = "http://svcs.ebay.com/services/search/FindingService/v1";
url += "?OPERATION-NAME=findItemsByKeywords";
url += "&SERVICE-VERSION=1.0.0";
url += "&SECURITY-APPNAME=Northeas-9a91-477b-8dcf-d760866d10ce";
url += "&GLOBAL-ID=EBAY-US";
url += "&RESPONSE-DATA-FORMAT=JSON";
url += "&REST-PAYLOAD";

function ItemSearchController($scope, $http) {

    $scope.getItem = function () {
        var item = $scope.item;
        var entry = $scope.entry;

        url += "&keywords=" + item;
        url += "&paginationInput.entriesPerPage=" + entry;

        console.log(url);

        $http.get(url).success(function (response) {
            $scope.items = response.findItemsByKeywordsResponse[0].searchResult[0].item;
        });

    }
}