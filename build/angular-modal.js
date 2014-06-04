(function() {
  var angularModal;

  angularModal = angular.module('angularModal', []);

  angularModal.directive("ngCloseModal", function($log, ModalService) {
    return {
      link: function(scope, element, attrs) {
        scope.service = ModalService;
        return element.on('click', function() {
          return scope.$apply(function() {
            return scope.service.close = attrs.ngCloseModal;
          });
        });
      }
    };
  });

  angularModal.directive("ngFoundationModal", function($log, ModalService) {
    return {
      restrict: 'A',
      link: function(scope, element, attrs) {
        scope.service = ModalService;
        scope.$watch('service.open', function(modalId) {
          if (modalId != null) {
            $("\#" + modalId).foundation('reveal', 'open');
            return scope.service.open = null;
          }
        });
        return scope.$watch('service.close', function(modalId) {
          if (modalId != null) {
            $("\#" + modalId).foundation('reveal', 'close');
            return scope.service.close = null;
          }
        });
      }
    };
  });

  angularModal.directive("ngOpenModal", function($log, ModalService) {
    return {
      link: function(scope, element, attrs) {
        scope.service = ModalService;
        return element.on('click', function() {
          return scope.$apply(function() {
            return scope.service.open = attrs.ngOpenModal;
          });
        });
      }
    };
  });

  angularModal.factory("ModalService", function() {
    return {
      open: null,
      close: null
    };
  });

}).call(this);
