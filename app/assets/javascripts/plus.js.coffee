#= require jquery
#= require jquery_ujs
#= require foundation
#= require angular
#= require line-chart.min

module = angular.module("APLIPlusApp", []);
module.controller("APLIPlusController", ($scope, $http) =>
  $http.get('/plusapi/listAllUser').success( (data) =>
    $scope.peoples = data
  )

  $scope.actionAdd = (id) =>
    $http.get('/plusapi/addPlus/' + id).success( (data) =>
      object = $.grep($scope.peoples, (e) =>
        e.id == id
      )
      object[0].plus_number = data.plus_number
    )

  $scope.actionSub = (id) =>
    $http.get('/plusapi/subPlus/' + id).success( (data) =>
      object = $.grep($scope.peoples, (e) =>
        e.id == id
      )
      object[0].plus_number = data.plus_number
    )

  $scope.actionGetLaid = (id) =>
    $http.get('/plusapi/getLaid/' + id).success( (data) =>
      object = $.grep($scope.peoples, (e) =>
        e.id == id
      )
      object[0].plus_number = data.plus_number
    )
)

###
chart = angular.module('APLIChart', ['n3-line-chart'])
chart.controller('APLIChartController', ($scope, $http) =>
  $scope.data = [
    {x: 0, value: 4, otherValue: 14},
    {x: 1, value: 8, otherValue: 1},
    {x: 2, value: 15, otherValue: 11},
    {x: 3, value: 16, otherValue: 147},
    {x: 4, value: 23, otherValue: 87},
    {x: 5, value: 42, otherValue: 45}
  ]

  $scope.options = {
    axes: {
      x: {
        key: 'x'
        , labelFunction: (value) =>
          return value
        , type: 'linear'
        , min: 0
        , max: 10
        , ticks: 2
      },
      y: {type: 'linear', min: 0, max: 1, ticks: 5},
      y2: {type: 'linear', min: 0, max: 1, ticks: [1, 2, 3, 4]}
    },
    series: [
      {y: 'value', color: 'steelblue', thickness: '2px', type: 'area', striped: true, label: 'Pouet'},
      {y: 'otherValue', axis: 'y2', color: 'lightsteelblue', visible: false, drawDots: true, dotSize: 2}
    ],
    lineMode: 'linear',
    tension: 0.7,
    tooltip: {
      mode: 'scrubber'
      , formatter: (x, y, series) =>
        return 'pouet'
      ,
      drawLegend: true,
      drawDots: true,
      columnsHGap: 5
    }
  }
)
###
