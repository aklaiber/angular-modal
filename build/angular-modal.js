(function() {
  var angularModal;

  angularModal = angular.module('angularModal', []);

  angularModal.directive("ngFoundationModal", function($log, ModalService) {
    return {
      restrict: 'E',
      transclude: true,
      replace: true,
      template: '<div class="reveal-modal"><a class="close-reveal-modal">&#215;</a><div ng-transclude></div></div>',
      link: function(scope, element, attrs) {
        scope.service = ModalService;
        return scope.$watch('service.open', function(modalId) {
          if (modalId != null) {
            $(modalId).foundation('reveal', 'open');
            return scope.service.open = null;
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
      open: null
    };
  });

}).call(this);
