angularModal = angular.module('angularModal', []);

angularModal.factory "ModalService", ->
  open: null

angularModal.directive "ngFoundationModal", ($log, ModalService)->
  restrict: 'E'
  transclude: true
  replace: true
  templateUrl: '/assets/angularjs/templates/modal.html'
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