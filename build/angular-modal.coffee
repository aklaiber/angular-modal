# angular-modal - v0.3.0 - 2014-12-02

angular.module('angularModal', [])

angular.module('angularModal').factory "modalService", ->
  state: null   # one of 'open', 'opened', 'close', 'closed'
  modalId: null # current modal id (remains after 'closed')

  # open modal with the given id
  open: (modalId) ->
    $("\##{modalId}").foundation('reveal', 'open')
    true

  # close modal with the given id or current modal if no id is given
  close: (modalId) ->
    modalId ||= this.modalId
    $("\##{modalId}").foundation('reveal', 'close')
    true

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

angular.module('angularModal').directive "ngOpenModal", ($log, modalService)->
  link: (scope, element, attrs) ->
    scope.service = modalService
    element.on 'click', ->
      scope.service.open(attrs.ngOpenModal)

angular.module('angularModal').directive "ngCloseModal", ($log, modalService)->
  link: (scope, element, attrs) ->
    scope.service = modalService
    element.on 'click', ->
      scope.service.close(attrs.ngCloseModal)