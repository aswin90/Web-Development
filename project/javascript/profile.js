function ProfileController($scope, $http) {
    var value = new Object;
    value.username = $('#ValueHiddenField').val();
    console.log(value);
    $http.post("profile.aspx/ProfileView", value).
    success(function (data) {                
        if (JSON.parse(data.d)) {
            $scope.items = JSON.parse(data.d);
        }
        else {
            alert("There is no data ");
        }
        console.log(JSON.parse(data.d));
    });
    $http.post("profile.aspx/loadSavedStores", value).
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
