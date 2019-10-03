There are two reasonale interpretations of laziness.

In the by-name interpretation, the computation of a value is delayed until necessary, and the computation is repeated each time it is used.

In the by-need interpretatin, the computation of value is delayed until necessary, and then the result is cached for subsequent uses.

In Scala, the lazy keyword provides by-need laziness.

```scala
lazy val x = { print ("foo") ; 10 }
print ("bar")
print (x)
print (x)
```
print foo once, because lazy cached the result

```javascript
var x = function () { return ( console.log("foo"), 10 ) }
console.log("bar") 
console.log(x())
console.log(x())
```
print foo once
