angularModal.directive "ngFoundationModal", ($log, ModalService)->
  restrict: 'E'
  transclude: true
  replace: true
  template: '<div class="reveal-modal"><a class="close-reveal-modal">&#215;</a><div ng-transclude></div></div>'
  link: (scope, element, attrs) ->
    scope.service = ModalService
    scope.$watch 'service.open', (modalId)->
      if modalId?
        $(modalId).foundation 'reveal', 'open'
        scope.service.open = null