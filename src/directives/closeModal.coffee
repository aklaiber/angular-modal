angular.module('angularModal').directive "ngCloseModal", ($log, modalService)->
  link: (scope, element, attrs) ->
    scope.service = modalService
    element.on 'click', ->
      scope.service.close(attrs.ngCloseModal)