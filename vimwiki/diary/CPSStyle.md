通过deep&coB 和deepB的不同CPS实现，说明letcc版本是直接跳出surrounding，而不管周边的其他计算。
并且可以这样认为所有的scheme lambda表达式都可以理解为kn表达式的过程，这种直观的解释方便理解
绕来绕去的过程。并且cps style尾巴的k既可以是变量也可以是函数。

<!--more-->
1. TailForm

``` scheme
;; Normal Form
(define append2
  (lambda (lisa lisb)
    (cond
      ((null? lisa) lisb)
      (else
       (cons (car lisa) (append2 (cdr lisa) lisb))))))


(define fact
  (lambda (n)
    (if (zero? n)
         1
         (* n (fact (- n 1))))))

(fact 4)

```

2. Tail form

``` scheme
(define append3
  (lambda (lisa lisb)
    (letrec ((ap2
              (lambda (a b)
                (cond
                  ((null? a) b)
                  (else (ap2 (cdr a) (cons (car a) b)))))))
      (ap2 (reverse lisa) lisb))))

(define fact2
  (lambda (n)
    (letrec ((fact-help (lambda (n help)
                          (if (zero? n)
                              help
                              (fact-help (- n 1) (* n help))))))
      (fact-help n 1))))
(fact2 4)

```



3. deep&coB

``` scheme
(define deep&coB
  (lambda (m k)
    (cond
      ((zero? m)
       (let ()
         (set! toppings k)
         (k 'pizza)))
      (else
       (deep&coB (sub1 m)
                 (lambda (x)
                   (k (cons x '()))))))))

(deep&coB 6 (lambda (x) x))         ; '((((((pizza))))))
(deep&coB 4 (lambda (x) x)) ; '((((pizza))))
```

cps风格 lambda(x) x ,可以使用k1  k2 k3 的风格进行替换,cps风格仅仅是编程的风格，letcc是其中的一种体现.  

4. deepB


letcc风格 直接跳出！！（也就是不管其他计算，直接他就是返回值！！）
``` scheme
(define toppings 0)
(define deepB
  (lambda (m)
    (cond
      ((zero? m)
       (call-with-current-continuation
        (lambda (jump)
          (set! toppings jump)
          'pizza)))
      (else
       (cons (deepB (sub1 m)) '())))))


```

5. bons and kons

进一步理解cps风格也可以看看kons和bons的实现


``` scheme
#lang racket
; kons the magnificent
;
(define kons
  (lambda (kar kdr)
    (lambda (selector)          ; returns lambda (selector)
      (selector kar kdr))))     ; calls selector with kar and kdr arguments

; kar
;
(define kar
  (lambda (c)                   ; applies selector on (a d) and returns 'a (car)
    (c (lambda (a d) a))))

; kdr
;
(define kdr
  (lambda (c)                   ; applies selector on (a d) and returns d (cdr)
    (c (lambda (a d) d))))

; Examples of kons kar kdr
;
(kar (kons 'a '()))                 ; 'a
(kdr (kons 'a '()))                 ; '()
(kar (kdr (kons 'a (kons 'b '())))) ; 'b
(kar (kons 'a (kons 'b '()))) ; 'a
; Another cons
;
(define bons
  (lambda (kar)
    (let ((kdr '()))
      (lambda (selector)
        (selector
         (lambda (x) (set! kdr x))
         kar
         kdr)))))

; Another kar
;
(define bar
  (lambda (c)
    (c (lambda (s a d) a))))

; Another kdr
;
(define bdr
  (lambda (c)
    (c (lambda (s a d) d))))

; set-kdr
;
(define set-kdr
  (lambda (c x)
    ((c (lambda (s a d) s)) x)))

; create kons using set-kdr and bons
;
(define kons2
  (lambda (a d)
    (let ((c (bons a)))
      (set-kdr c d)
      c)))

; Example of kons2 bar and bdr
;
(bar (kons2 'a '(1 2 3)))       ; 'a
(bdr (kons2 'a '(1 2 3)))       ; '(1 2 3)
(define bad
  (lambda (x)
    (and (will-stop? bad)
         (eternity x))))
(define eternity
  (lambda (x)
    (eternity x)))
```

[cps变换教程][1]
[Y combinator推导][2]

[1]:https://cgi.soic.indiana.edu/~c311/lib/exe/fetch.php?media=cps-notes.scm 
[2]:http://www.ece.uc.edu/~franco/C511/html/Scheme/ycomb.html 
