(function() {
  angular.module('angularModal').directive("ngCloseModal", function($log, modalService) {
    return {
      link: function(scope, element, attrs) {
        scope.service = modalService;
        return element.on('click', function() {
          return scope.service.close(attrs.ngCloseModal);
        });
      }
    };
  });

  angular.module('angularModal').directive("ngFoundationModal", function($log, $rootScope, modalService) {
    ({
      restrict: 'A'
    });
    $(document).on('open.fndtn.reveal', '[data-reveal]', function(event) {
      modalService.state = 'open';
      modalService.modalId = $(event.target).attr('id');
      if (!$rootScope.$$phase) {
        return $rootScope.$apply();
      }
    });
    $(document).on('opened.fndtn.reveal', '[data-reveal]', function(event) {
      modalService.state = 'opened';
      modalService.modalId = $(event.target).attr('id');
      if (!$rootScope.$$phase) {
        return $rootScope.$apply();
      }
    });
    $(document).on('close.fndtn.reveal', '[data-reveal]', function(event) {
      modalService.state = 'close';
      modalService.modalId = $(event.target).attr('id');
      if (!$rootScope.$$phase) {
        return $rootScope.$apply();
      }
    });
    $(document).on('closed.fndtn.reveal', '[data-reveal]', function(event) {
      modalService.state = 'closed';
      modalService.modalId = $(event.target).attr('id');
      if (!$rootScope.$$phase) {
        return $rootScope.$apply();
      }
    });
    return {
      link: function(scope, element, attrs) {
        return scope.service = modalService;
      }
    };
  });

  angular.module('angularModal').directive("ngOpenModal", function($log, modalService) {
    return {
      link: function(scope, element, attrs) {
        scope.service = modalService;
        return element.on('click', function() {
          return scope.service.open(attrs.ngOpenModal);
        });
      }
    };
  });

  angular.module('angularModal').factory("modalService", function() {
    return {
      state: null,
      modalId: null,
      open: function(modalId) {
        $("\#" + modalId).foundation('reveal', 'open');
        return true;
      },
      close: function(modalId) {
        modalId || (modalId = this.modalId);
        $("\#" + modalId).foundation('reveal', 'close');
        return true;
      }
    };
  });

}).call(this);
