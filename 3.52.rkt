#lang sicp 

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
             (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))
;
(define (stream-car stream) (car stream))
;
(define (stream-cdr stream) (force (cdr stream)))
;
;(define (stream-null? stream) (null? stream))
;
;(define the-empty-stream '())
;;
;;(define (cons-stream a b)
;;  (cons a (delay b)))
;
;
;(define (memo-proc proc)
;  (let ((already-run? false) (result false))
;    (lambda ()
;      (if (not already-run?)
;          (begin (set! result (proc))
;                 (set! already-run? true)
;                 result)
;          result))))
;                
;
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))
;;
;;(define (delay exp)
;;  (memo-proc (lambda () exp)))
;
;(define (force exp)
;  (exp))

(define (show x)
  (display x)
  (display '\n)
  x)

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                     (stream-filter pred (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))
(define (display-stream s)
  (define (display-line x) (newline) (display x))
(stream-for-each display-line s))
(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)
sum
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
sum
(define y (stream-filter even? seq))
sum
(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
sum
(stream-ref y 7)
sum
(display-stream z)
sum

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define (divisible? x y)
  (= (remainder x y) 0))

(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sieve (stream-filter
          (lambda (x)
            (not (divisible? x (stream-car stream))))
          (stream-cdr stream)))))

(define primes (sieve (integers-starting-from 2)))

(stream-ref primes 50)

(define (stream-map2 proc . list-of-stream)
    (if (null? (car list-of-stream))
        '()
        (cons-stream
            (apply proc 
                   (map (lambda (s)
                            (stream-car s))
                        list-of-stream))
            (apply stream-map2 
                   (cons proc (map (lambda (s)
                                       (stream-cdr s))
                                   list-of-stream))))))

(define (add-streams s1 s2)
  (stream-map2 + s1 s2))

(define (mul-streams s1 s2)
  (stream-map2 * s1 s2))

(define ones (cons-stream 1 ones))

(define integers (cons-stream 1 (add-streams ones integers)))

(define factorial
    (cons-stream 1 
                 (mul-streams factorial
                              (stream-cdr integers))))

(define (partial-sums s)
  (cons-stream (stream-car s) (add-streams (stream-cdr s) (partial-sums s))))

(stream-ref (partial-sums integers)  9)


(define (average x y) (/ (+ x y) 2))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define (s i)
  (define (iter start)
    (if (= start i) (display 'end)
(begin (display (stream-ref (pairs integers integers) start))(display start)(newline) (iter (+ 1 start)))
  )
   
    )
   (iter 0)
  )

(s 100)
