(define (eval-and exp env)
  (if (true? (eval (left-expr exp)))
     (eval ((right-expr exp)))
     false
  )
)

(define (eval-or exp env)
  (if (true? (eval (left-expt exp)))
    true
    (eval ((right-expr expr)))
  )
)

(define (and? exp)
(tagged-list? exp 'and)
)

(define (or? exp)
(tagged-list? exp 'or)
)

(define (left-expr exp)
 (cadr exp)
)

(define (right-expr exp)
 (caddr exp)
)

(and? exp) (eval-and exp env)
(or? exp) (eval-or exp env)