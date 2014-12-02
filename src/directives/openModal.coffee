angular.module('angularModal').directive "ngOpenModal", ($log, modalService)->
  link: (scope, element, attrs) ->
    scope.service = modalService
    element.on 'click', ->
      scope.service.open(attrs.ngOpenModal)