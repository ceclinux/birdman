(define (make-lambda parameters body)
(cons 'lambda (cons parameters body)))

(define (cond? exp) (tagged-list? exp 'let))

(define (let-var-clauses exp) (cadr exp))

(define (let-body exp) (caddr exp))

(define (let-var var-clause) (car var-clause))

(define (let-expr var-clause) (cadr var-clause))

(define (let->combination seq)
  (make-lambda 
    (map let-var 
      (let-var-clauses seq) 
    )
    (make-begin (map let-expr (let-var-clauses seq)))
  )
)