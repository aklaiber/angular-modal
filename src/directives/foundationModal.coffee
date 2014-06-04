angularModal.directive "ngFoundationModal", ($log, ModalService)->
  restrict: 'A'
  link: (scope, element, attrs) ->
    scope.service = ModalService

    scope.$watch 'service.open', (modalId)->
      if modalId?
        $("\##{modalId}").foundation('reveal', 'open')
        scope.service.open = null

    scope.$watch 'service.close', (modalId)->
      if modalId?
        $("\##{modalId}").foundation('reveal', 'close')
        scope.service.close = null