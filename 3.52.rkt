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

  