(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (get_coeration_all type-tags)
        )
      )
    )
  )


(define (get_coeration_all types)
  (define (iter types before_types)
    (cond 
      ((empty? types) (error "No Method for these types"))
      ((get_coeration (car types) (append (cdr types) before_types))
       (let ((coercioned (map (lambda (x) (get_coercion x (car types))))))
         (apply-generic op (car types) coercioned)
         ))
      ((iter (cdr types) (cons (car types) before_types))) )
    )
  (iter types '())
  )

(define (get_coeration type other_types)
  (if (empty? other_types) #t
    (and (get_coercion (car other_types) type) (get_coeration type (cdr
                                                                     other_types)))
    )
  )
