angular-modal
=============

An AngularJS directive and service for the foundation modal

## Usage

```html
<script src="angular-modal.js"></script>
```
```js
angular.module('myApp', ['angularModal']);
```

```html
<div id="test-foundation-modal" class="reveal-modal" data-reveal ng-foundation-modal>
  Test foundation modal
</div>

<button ng-open-modal="test-foundation-modal">Open Modal</button>
<button ng-close-modal="test-foundation-modal">Close Modal</button>
```

## Dependencies

http://foundation.zurb.com/

## Install

Download latest release from [here](https://github.com/aklaiber/angular-modal/tree/master/build)
