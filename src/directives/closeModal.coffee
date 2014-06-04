angularModal.directive "ngCloseModal", ($log, ModalService)->
  link: (scope, element, attrs) ->
    scope.service = ModalService
    element.on 'click', ->
      scope.$apply ->
        scope.service.close = attrs.ngCloseModal