# angular-modal - v0.1.0 - 2014-05-15

angularModal = angular.module('angularModal', [])

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

angularModal.directive "ngOpenModal", ($log, ModalService)->
  link: (scope, element, attrs) ->
    scope.service = ModalService
    element.on 'click', ->
      scope.$apply ->
        scope.service.open = attrs.ngOpenModal

angularModal.factory "ModalService", ->
  open: null