# angular-modal - v0.2.0 - 2014-06-04

angularModal = angular.module('angularModal', [])

angularModal.directive "ngCloseModal", ($log, ModalService)->
  link: (scope, element, attrs) ->
    scope.service = ModalService
    element.on 'click', ->
      scope.$apply ->
        scope.service.close = attrs.ngCloseModal

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

angularModal.directive "ngOpenModal", ($log, ModalService)->
  link: (scope, element, attrs) ->
    scope.service = ModalService
    element.on 'click', ->
      scope.$apply ->
        scope.service.open = attrs.ngOpenModal

angularModal.factory "ModalService", ->
  open: null
  close: null