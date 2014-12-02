angular.module('angularModal').directive "ngFoundationModal", ($log, $rootScope, modalService)->
  restrict: 'A'

  $(document).on 'open.fndtn.reveal', '[data-reveal]', (event) ->
    modalService.state = 'open'
    modalService.modalId = $(event.target).attr('id')
    $rootScope.$apply() unless $rootScope.$$phase

  $(document).on 'opened.fndtn.reveal', '[data-reveal]', (event) ->
    modalService.state = 'opened'
    modalService.modalId = $(event.target).attr('id')
    $rootScope.$apply() unless $rootScope.$$phase

  $(document).on 'close.fndtn.reveal', '[data-reveal]', (event) ->
    modalService.state = 'close'
    modalService.modalId = $(event.target).attr('id')
    $rootScope.$apply() unless $rootScope.$$phase

  $(document).on 'closed.fndtn.reveal', '[data-reveal]', (event) ->
    modalService.state = 'closed'
    modalService.modalId = $(event.target).attr('id')
    $rootScope.$apply() unless $rootScope.$$phase

  link: (scope, element, attrs) ->
    scope.service = modalService