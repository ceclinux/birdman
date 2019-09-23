(define
  (application? exp)
  (tagged-list? exp 'call)
)

(define
  (operator exp)
  (cadr exp)
)

(define 
  (operands exp)
  (cdr exp)
)

(define
  (no-operands ops)
  (null? ops)
)

(define 
  (first-operand ops)
  (car ops)
)

(define
  (rest-operands ops)
  (cdr ops)
)