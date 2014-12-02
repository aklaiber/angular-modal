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