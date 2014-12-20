#= require jquery
#= require jquery_ujs
#= require foundation
#= require angular

module = angular.module("APLIPlusApp", []);
module.controller("APLIPlusController", ($scope, $http) =>
  $http.get('/plusapi/listAll').success( (data) =>
    $scope.peoples = data
  )
  $scope.actionAdd = (id) =>
    $http.get('/plusapi/addPlus/' + id).success( (data) =>
      object = $.grep $scope.peoples, (e) =>
        e.id == id
      object[0].plus_number = data.plus_number
    )

  $scope.actionSub = (id) =>
    $http.get('/plusapi/subPlus/' + id).success( (data) =>
      object = $.grep $scope.peoples, (e) =>
        e.id == id
      object[0].plus_number = data.plus_number
    )

  $scope.actionGetLaid = (id) =>
    $http.get('/plusapi/getLaid/' + id).success( (data) =>
      object = $.grep $scope.peoples, (e) =>
        e.id == id
      object[0].plus_number = data.plus_number
    )
)
