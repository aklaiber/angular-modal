angularModal.directive "ngOpenModal", ($log, ModalService)->
  link: (scope, element, attrs) ->
    scope.service = ModalService
    element.on 'click', ->
      scope.$apply ->
        scope.service.open = attrs.ngOpenModal