'use strict'

###*
 # @ngdoc function
 # @name assignment2App.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the assignment2App
###
angular.module 'assignment2App'
  .controller 'MainCtrl', ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    return