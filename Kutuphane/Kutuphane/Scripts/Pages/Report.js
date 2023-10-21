angular.module('HomeApp', [])
    .controller('ReportController', function ($scope, $http) {


        $scope.Report = function () {
                $http({
                    method: "POST",
                    url: "/Report/GetReport",
                    headers: { "Content-Type": "Application/json;charset=utf-8" },
                    data: { }
                }).then(function (response) {
                    $scope.reportList = response.data;
                });
        };



        $(document).ready(function () {
            $scope.Report();
        });



    });