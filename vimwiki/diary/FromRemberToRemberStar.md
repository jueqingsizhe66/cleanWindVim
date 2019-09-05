
The Little Scheme(TLS) 提出了[rember](#rember),[multirember](#multirember),[multirember\*](#mrs)以及[multirember&Col collector](#mrsc)等系列函数的定义，而在The Season  Scheme(TSS) 进一步改进了rember系列函数，
使用[let](#rlet)、[letrec](#rletrec)、[letcc](#rletcc)进行改写，并结合leftmost和deep函数的想法，又提出了[rember\*](#rs)的函数，该函数表示删除最左边的函数。在此过程中，剖析每一个简单的函数(并由此带来**智趣**)，
并进行改进，升级，提炼，从中可以体味到[华罗庚老先生][2]说的"书越读越薄，并积厚薄书"的感觉,从繁杂中感受直观的本质，
借以理解事物，从另外一个角度看待事物。

+ [一、The Little Scheme](#TLS)
    - [rember](#rember)
    - [multirember](#multirember)
    - [multiremberStar](#mrs)
    - [multiremberStarCol](#mrsc)
+ [二、The Season Scheme](#TSS)
    - [rember-let](#rlet)
    - [rember-letrec](#rletrec)
    - [rember-letcc](#rletcc)
    - [rember star](#rs)
    - [depthStar improvement](#di)
<!--more-->

<h2 id="TLS"> 一、The Little Scheme </h2>
<hr/>

scheme的核心数据结构是List，通过list进行算法的演算，而rember是其中的一种算法，用于去除其中的一个元素。
并在rember的同级函数中，也定义了subst，member，insert left, insert right等。在TLS书中也提出了这些函数的相同之处并最终使用insert-g来统一各个函数，这是不错的思想。

<h3 id="rember">1.1 rember </h3>

``` scheme
(define rember-f
  (lambda (test?)
          (lambda (a lat)
            (cond
              ((null? lat) '())
              ((test? a (car lat))
               (cdr lat))
              (else
               (cons (car lat)
                     ((multirember-f test?) a (cdr lat))))))))

```


Another related procedures:

``` scheme
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat)
       '())
      ((eq? (car lat) old)
       (cons new (cons old (cdr lat))))
      (else
       (cons new (insertL new old (cdr lat)))))))


(define insertLR
  (lambda (new oldL oldR lat)
    (cond
      ((null? lat)
       '())
      ((eq? (car lat) oldL)
       (cons new (cons oldL (cdr lat))))
      ((eq? (car lat) oldR)
       (cons oldR (cons new (cdr lat))))
      (else
       (cons (car lat) (insertLR new oldL oldR (cdr lat)))))))
```

进一步可以参考 [TLS and TSS Backup][13]
<hr/>

为了更进一步删除一个列表(未嵌套多个list)时候所有的元素(定义为lat version)
<h3 id="multirember">1.2 multirember </h3>

``` scheme
(define multirember-f
  (lambda (test?)
          (lambda (a lat)
            (cond
              ((null? lat) '())
              ((test? a (car lat))
               ((multirember-f test?) a (cdr lat)))
              (else
               (cons (car lat)
                     ((multirember-f test?) a (cdr lat))))))))

```

Another related procedures:

``` scheme
(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond
      ((null? lat)
       '())
      ((eq? (car lat) oldL)
       (cons new (cons oldL (multiinsertLR new oldL oldR (cdr lat)))))
      ((eq? (car lat) oldR)
       (cons oldR (cons new (multiinsertLR new oldL oldR (cdr lat)))))
      (else
       (cons (car lat) (multiinsertLR new oldL oldR (cdr lat)))))))


;(insertL 'a 'b '(a b c (a b c)))
;'(a a b c (a b c))

;(insertLR 'water 'a 'b '(a bc b c d (a c b)))
;'(water a bc b c d (a c b))

 (multiinsertLR 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (a b c d))
> (insertLR 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b c d a b (a b c d))
```

<hr/>
<h3 id="mrs">1.3 multirember* </h3>

``` scheme
(define multiinsertLR*
  (lambda (new oldL oldR lat)
    (define atom?
      (lambda (x)
        (and  (not (pair? x)) (not (null? x)))))
    (cond
      ((null? lat)
       '())
      ((atom? (car lat))
       (cond 
         ((eq? (car lat) oldL)
          (cons new (cons oldL (multiinsertLR* new oldL oldR (cdr lat)))))
         ((eq? (car lat) oldR)
          (cons oldR (cons new (multiinsertLR* new oldL oldR (cdr lat)))))
         (else
          (cons (car lat) (multiinsertLR* new oldL oldR (cdr lat))))))
      (else
       (cons (multiinsertLR* new oldL oldR (car lat))
             (multiinsertLR* new oldL oldR (cdr lat)))))))


(define evens-only*
  (lambda (l)

    (define atom?
      (lambda (x)
        (and (not (pair? x)) (not (null? x)))))
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((even? (car l))
          (cons (car l) (evens-only* (cdr l))))
         (else (evens-only* (cdr l)))))
      (else
       (cons (evens-only* (car l))
             (evens-only* (cdr l)))))))


> (multiinsertLR* 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (water a b water c d))
> (multiinsertLR 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (a b c d))

```

Another related procedures:

``` scheme

(define multiinsertLR*let
  (lambda (new oldL oldR lat)
    (define atom?
      (lambda (x)
        (and  (not (pair? x)) (not (null? x)))))
    (cond
      ((null? lat)
       '())
      ((atom? (car lat))
        (let ((rest (multiinsertLR* new oldL oldR (cdr lat))))
          (cond        
            ((eq? (car lat) oldL)
             (cons new (cons oldL rest)))
            ((eq? (car lat) oldR)
             (cons oldR (cons new rest)))
            (else
             (cons (car lat) rest)))))
      (else
       (let ((first (multiinsertLR* new oldL oldR (car lat)))
             (rest (multiinsertLR* new oldL oldR (cdr lat))))
       (cons first rest))))))



(define multiinsertLR*letrec
  (lambda (new oldL oldR lat)
    (define atom?
      (lambda (x)
        (and  (not (pair? x)) (not (null? x)))))
    (define mul-help
      (lambda (lat)       
        (cond
          ((null? lat)
           '())
          ((atom? (car lat))
           (cond 
             ((eq? (car lat) oldL)
              (cons new (cons oldL (mul-help  (cdr lat)))))
             ((eq? (car lat) oldR)
              (cons oldR (cons new (mul-help  (cdr lat)))))
             (else
              (cons (car lat) (mul-help  (cdr lat))))))
          (else
           (cons (mul-help  (car lat))
                 (mul-help  (cdr lat)))))))
    (mul-help lat)))

> (multiinsertLR*let 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (water a b water c d))
> (multiinsertLR* 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (water a b water c d))
> (multiinsertLR 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (a b c d))

(multiinsertLR*letrec 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (water a b water c d))



(define multiinsertLR*letreclet
  (lambda (new oldL oldR lat)
    (define atom?
      (lambda (x)
        (and  (not (pair? x)) (not (null? x)))))
    (define mul-help
      (lambda (lat)       
        (cond
          ((null? lat)
           '())
          ((atom? (car lat))
           (let ((rest (mul-help  (cdr lat))))
           (cond 
             ((eq? (car lat) oldL)
              (cons new (cons oldL rest)))
             ((eq? (car lat) oldR)
              (cons oldR (cons new rest)))
             (else
              (cons (car lat) rest)))))
          (else
           (let ((first (mul-help  (car lat)))
                 (rest (mul-help  (cdr lat))))
           (cons first rest))))))
    (mul-help lat)))

(multiinsertLR*letreclet 'water 'a 'b '(a b c d a b (a b c d)))
'(water a b water c d water a b water (water a b water c d))

```

<hr/>
<h3 id="mrsc">1.4 multiremberstar and collector </h3>
``` scheme

(define multirember*co
  (lambda (a lat col)
    (define atom?
      (lambda (x)
        (and (not (pair? x)) (not (null? x)))))
    (cond
      (( null? lat)
       (col (quote ()) (quote ())))
      ((atom? (car lat))
       (cond
         ((eq? ( car lat) a)
         (multirember*co a (cdr lat)
                        (lambda ( newlat seen)
                          (col newlat (cons (car lat)
                                            seen)))))
       (else
        (multirember*co a (cdr lat)
                       (lambda (newlat seen)
                         (col (cons (car lat) newlat) seen))))))
      (else
       (multirember*co a (car lat)
                       (lambda (al as)
                         (multirember*co a (cdr lat)
                                         (lambda (dl ds)
                                           (col (cons al dl)
                                                (cons as ds))))))))))


```

Another related procedures:

``` scheme

(define col
   (lambda (x y)
      (null? y)))


(define a-friend
   (lambda (x y)
      (length x)))

(define a-friend-y
   (lambda (x y)
      (length y)))


(define a-friend-z
   (lambda (x y)
      (cons x (cons y '()))))

(define a-friend-zp
   (lambda (x y z)
      (cons x (cons y (cons z '())))))

(define evens-only*col
  (lambda (l col)

    (define atom?
      (lambda (x)
        (and (not (pair? x)) (not (null? x)))))
    (cond
      ((null? l) (col '() 1 0))
      ((atom? (car l))
       (cond
         ((even? (car l))
          (evens-only*col (cdr l)
                          (lambda (newlat L R)
                            (col (cons (car l) newlat) (* (car l) L) R))))
         (else (evens-only*col (cdr l) (lambda (newlat L R)
                                      (col newlat L
                                           (+ (car l) R)))))))
      (else
       (evens-only*col (car l)
                       (lambda (al ale ari)
                         (evens-only*col (cdr l)
                                         (lambda (dl dle dri)
                                           (col (cons al dl)
                                                (* ale dle)
                                                (+ ari dri))))))))))


(define multiinsertLRo
  (lambda (new oldL oldR lat col)
    (cond
      ((null? lat) (col '() 0 0))
      ((eq? (car lat) oldL)
       (multiinsertLRo new oldL oldR (cdr lat)
                       (lambda (newlat L R)
                         (col (cons new (cons oldL newlat))
                              (+ L 1) R))))
      ((eq? (car lat) oldR)
       (multiinsertLRo new oldL oldR (cdr lat)
                       (lambda (newlat L R)
                         (col (cons oldR (cons new newlat))
                              L (+ R 1)))))
      (else
       (multiinsertLRo new oldL oldR (cdr lat)
                       (lambda (newlat L R)
                         (col (cons (car lat) newlat)
                              L
                              R)))))))




(define multiinsertLR*o
  (lambda (new oldL oldR lat col)
    (define atom?
      (lambda (x)
        (and (not (pair? x)) (not (null? x)))))
    (cond
      ((null? lat) (col '() 0 0))
      ((atom? (car lat))
       (cond
         ((eq? (car lat) oldL)
          (multiinsertLR*o new oldL oldR (cdr lat)
                          (lambda (newlat L R)
                            (col (cons new (cons oldL newlat))
                                 (+ L 1) R))))
         ((eq? (car lat) oldR)
          (multiinsertLR*o new oldL oldR (cdr lat)
                          (lambda (newlat L R)
                            (col (cons oldR (cons new newlat))
                                 L (+ R 1)))))
         (else
          (multiinsertLR*o new oldL oldR (cdr lat)
                          (lambda (newlat L R)
                            (col (cons (car lat) newlat)
                                 L
                                 R))))))
      (else
       (multiinsertLR*o new oldL oldR (car lat)
                        (lambda (al ale ari)
                          (multiinsertLR*o new oldL oldR (cdr lat)
                                           (lambda (dl dle dri)
                                             (col (cons al dl)
                                                  (+ ale dle)
                                                  (+ ari dri))))))))))

```

<hr/>
<h2 id="TSS"> 二、The Season Scheme </h2>

<hr/>

由[member](#member)和rember又可以深入进行剖析，于是引进了member的升级版本two-in-a-lat,未包含TSS的最后一个two-in-a-lat的实现，并通过let,letrec,letcc改写TLS中的rember系列函数，在结合[leftmost](#lm)和[deep(Later on,deep有两外一层意思就是产生n层的pizza)](#deep)函数，升级rember到删除最左边的一个元素。

Member实际上在所有的函数的实现中都有对应的组成，他是一个十分重要的组成部分，包括基于member的[union](#union),[intersect](#intersect),[intersectall](#intersectall)函数的，一个相对基础的函数。
<h4 id="member">the  definition of member</h4>

``` scheme
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else
       (or (eq? a (car lat))
           (member a (cdr lat)))))))

; member-letrec version
(define member?
  (lambda (a l)
    (letrec
      ((yes? (lambda (l)
               (cond
                 ((null? l) #f)
                 ((eq? (car l) a) #t)
                 (else (yes? (cdr l)))))))
      (yes? l))))
```


现在让我们看看two-in-a-lat的引申(通过member)

<h4 id="two">Two -in -a -lat</h4>

包含two-in-a-lat(用member2代替),并附加sum-of-prefix和scramble函数的实现，目的是说如果你想让函数知道额外的信息，可以通过增加参数的方法。

``` scheme
(define member-letrec-ju?
  (lambda (a lat)
    (letrec ((yes? (lambda (l)
                    (cond
                      ((null? l) #f)
                      (else
                       (or (eq? a (car l))
                           (yes? a (cdr l))))))))
      (yes? lat))))

(define member2?
  (lambda (preceding lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? preceding (car lat))
                (member2? (car lat) (cdr lat)))))))

;;; (member2? 'a '(a b c))  bugs!

(define memberContinue?
  (lambda (lat)
    (define M2?
      (lambda (preceding lat)
        (cond
          ((null? lat) #f)
          (else (or (eq? preceding (car lat))
                    (M2? (car lat) (cdr lat)))))))
    (M2? '() lat)))


(define memberContinueAlter?
  (lambda (lat)
    (letrec ((M2? (lambda (preceding lat)
                    (cond
                      ((null? lat) #f)
                      (else
                       (let ((pre (car lat)))
                         (or (eq? preceding pre)
                                (M2? pre (cdr lat)))))))))
             (M2? '() lat))))


(define sum-of-prefixes
  (lambda (tup)   
    (define sum-of-prefixes-b
      (lambda (sonssf tup)     ; sonssf stands for 'sum of numbers seen so far'
        (cond
          ((null? tup) '())
          (else (cons (+ sonssf (car tup))
                      (sum-of-prefixes-b
                       (+ sonssf (car tup))
                       (cdr tup)))))))
    (sum-of-prefixes-b 0 tup)))

;  (sum-of-prefixes '(1 2 3 4))
; '(1 3 6 10)


(define sum-of-prefixes1
  (lambda (tup)
    (letrec
      ((S (lambda (sss tup)
            (cond
              ((null? tup) '())
              (else
               (let ((first (car tup)))
                (cons (+ sss first)
                      (S (+ sss first) (cdr tup)))))))))
(S 0 tup))))

(define scramble-b
  (lambda (tup rev-pre)
    (define one?
      (lambda (n)
        (= n  1)))
    (define sub1
      (lambda (n)
        (- n 1)))
    (define pick
      (lambda (n lat)
        (cond
          ((one? n) (car lat))
          (else (pick (sub1 n) (cdr lat))))))
    (cond
      ((null? tup) '())
      (else
       (cons (pick (car tup) (cons (car tup) rev-pre))
             (scramble-b (cdr tup)
                         (cons (car tup) rev-pre)))))))


(define scramble
  (lambda (tup)
    (letrec ((scramble-b
              (lambda (tup rev-pre)
                (define one?
                  (lambda (n)
                    (= n  1)))
                (define sub1
                  (lambda (n)
                    (- n 1)))
                (define pick
                  (lambda (n lat)
                    (cond
                      ((one? n) (car lat))
                      (else (pick (sub1 n) (cdr lat))))))
                (cond
                  ((null? tup) '())
                  (else
                   (let ((first (car tup)))
                     (cons (pick first (cons first rev-pre))
                     (scramble-b (cdr tup)
                                 (cons first rev-pre)))))))))
      (scramble-b tup '()))))




(define scramble2
  (lambda (tup)
    (letrec ((one?
              (lambda (n)
                (= n  1)))
             (sub1
              (lambda (n)
                (- n 1)))
             (pick
              (lambda (n lat)
                (cond
                  ((one? n) (car lat))
                  (else (pick (sub1 n) (cdr lat))))))
             (scramble-b
              (lambda (tup rev-pre)
                (cond
                  ((null? tup) '())
                  (else
                   (let ((first (car tup)))
                     (cons (pick first (cons first rev-pre))
                           (scramble-b (cdr tup)
                                       (cons first rev-pre)))))))))
      (scramble-b tup '()))))
```
<hr/>


<h3 id="rlet">2.1 rember-let </h3>

Note: use let to define the repeated expression, so simplify the definition of the procedure.

``` scheme

```

<hr/>

<h3 id="rletrec">2.2 rember-letrec </h3>
``` scheme

;;; see at the TSS
(define rember
  (lambda (a lat)
    (letrec
        ((R (lambda (lat)
              (cond
                ((null? lat) '())
                ((eq? (car lat) a) (cdr lat))
                (else
                 (cons (car lat) (R (cdr lat))))))))
      (R lat))))

```

<hr/>

如果我们想要进一步实现rember-beyond-first(保留删除元素之前的所有元素)和[rember-upto-last](#rul)(只保留删除元素之后的元素)
<h3 id="rletcc">2.3 rember-letcc </h3>

<h4 id="rbf">Rember-Beyond-first</h4>

``` scheme
; The rember-beyond-first function rembers everything beyond first match
;
(define rember-beyond-first
  (lambda (a lat)
    (letrec
      ((R (lambda (lat)
            (cond
              ((null? lat) '())
              ((eq? (car lat) a) '())
              (else
                (cons (car lat) (R (cdr lat))))))))
      (R lat))))
```

```
(rember-beyond-first
  'roots
  '(noodles spaghetti spatzle bean-thread roots potatoes yam others rice))
; ==> '(noodles spaghetti spaghetti bean-thread)
```
<hr/>

<h4 id="rul">Rember-upto-last</h4>
``` scheme
(define-syntax letcc
  (syntax-rules ()
    ((letcc ?k ?body ...)
     (call/cc (lambda (?k) ?body ...)))))
(define rember-upto-last
  (lambda (a lat) ; Look Ma, no cons   
    (letcc skip
      (letrec 
          ((R
            (lambda (l)
              (cond
                ((null? l) (void))
                (else (let ()
                        (R (cdr l))
                        (cond
                          ((eq? a (car l))
                           (skip (cdr l)))
                          (else (void)))))))))
        (R lat)
        lat))))
```

```
(rember-upto-last
  'roots
  '(noodles spaghetti spatzle bean-thread roots potatoes yam others rice))
; ==> '(potatoes yam others rice)
```
<hr/>

<h3 id="rs">2.4 remberstar </h3>

<h4 id="lm">the  definition of leftmost</h4>

``` scheme
(define leftmost-fixed-let
  (lambda (l)
    (cond
      ((null? l) '())
      ((atom? (car l)) (car l))
      (else
       (let ((a (leftmost-fixed (car l))))
         (cond
           ((atom? a) a)
           (else (leftmost-fixed (cdr l)))))))))

;(leftmost-fixed-let '((() a b) (c d))) ;; bug fixed
;
;(leftmost-fixed-let '(((y) b) (c d)))   ; 'y
;(leftmost-fixed-let '(((y) ()) () (e))) ; 'y
;(leftmost-fixed-let '(((() y) ())))     ; 'y
;(leftmost-fixed-let '(((()) ()))) ; '()



;;letcc version

(define leftmost-letcc
  (letrec
      ((lm (lambda (l out)
             (cond
               ((null? l) '())
               ((atom? (car l)) (out (car l)))
               (else
                (begin
                  (lm (car l) out)
                  (lm (cdr l) out)))))))
    (lambda (l)
      (call-with-current-continuation
       (lambda (skip)
         (lm l skip))))))

```

<hr/>

<h4 id="deep">the  definition of deep</h4>
``` scheme
(define deep
  (lambda (m)
    (cond
      ((zero? m) 'pizza)
      (else (cons (deep (sub1 m)) '())))))


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

(define deep&co
  (lambda (m k)
    (cond
      ((zero? m) (k 'pizza))
      (else
       (deep&co (sub1 m)
                (lambda (x) (k (cons x '()))))))))

(deep&co 0 (lambda (x) x))          ; 'pizza
(deep&co 6 (lambda (x) x))          ; '((((((pizza))))))
(deep&co 2 (lambda (x) x)) ; '((pizza))


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

<hr/>

接下来，再看看由leftmost结合rember得到rember star.

``` scheme

; The rember1* function removes the leftmost occurrence of a in l
;
(define rember1*
  (lambda (a l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) a) (cdr l))
         (else
           (cons (car l) (rember1* a (cdr l))))))
      (else
        (cond
          ((equal? (rember1* a (car l)) (car l)) ; if the list with 'a' removed doesn't change
           (cons (car l) (rember1* a (cdr l))))  ; then recurse
          (else
            (cons (rember1* a (car l)) (cdr l)))))))) ; otherwise remove 'a'

```


```
; Examples of rember1*
;
(rember1*
  'salad
  '((Swedish rye) (French (mustard salad turkey)) salad))
; ==> '((Swedish rye) (French (mustard turkey)) salad)

(rember1*
  'meat
  '((pasta meat) pasta (noodles meat sauce) meat tomatoes))
; ==> '((pasta) pasta (noodles meat sauce) meat tomatoes)


```


下面是letrec version of rember1\*
```
(define rember1*-letrec
  (lambda (a l)
    (letrec
        ((R (lambda (l)
              (cond
                ((null? l) '())
                ((atom? (car l))
                 (let ((first (car l))
                       (second (cdr l)))
                   (cond
                     ((eq? first a) second)
                     (else
                      (cons first (R second))))))
                 (else
                  (let ((first (car l))
                        (second (cdr l)))
                    (cond
                      ((equal? (R first) first) ; if the list with 'a' removed doesn't change
                       (cons first (R second)))  ; then recurse
                      (else
                       (cons (R first) second))))))))) ; otherwise remove 'a'
      (R l))))
(rember1*-letrec
  'salad
  '((Swedish rye) (French (mustard salad turkey)) salad))
(rember1*-letrec
  'meat
  '((pasta meat) pasta (noodles meat sauce) meat tomatoes))

```

the version of letcc (我暂时不太理解)

```
; rember1* via letcc
;
(define rember1*-letcc
  (lambda (a l)
    (letrec
        ((rm (lambda (a l oh)
               (cond
                 ((null? l) (oh 'no))
                 ((atom? (car l))
                  (if (eq? (car l) a)
                      (cdr l)
                      (cons (car l) (rm a (cdr l) oh))))
                 (else
                  (let ((new-car
                         (call-with-current-continuation
                          (lambda (oh)
                            (rm a (car l) oh)))))
                    (if (atom? new-car)
                        (cons (car l) (rm a (cdr l) oh))
                        (cons new-car (cdr l)))))))))
      (let ((new-l
             (call-with-current-continuation
              (lambda (oh)
                (rm a l oh)))))
        (if (atom? new-l)
            l
            new-l)))))

; Tests of rember1*-letcc
;
(rember1*-letcc
 'salad
 '((Swedish rye) (French (mustard salad turkey)) salad))
; ==> '((Swedish rye) (French (mustard turkey)) salad)

(rember1*-letcc
 'meat
 '((pasta meat) pasta (noodles meat sauce) meat tomatoes))
; ==> '((pasta) pasta (noodles meat sauce) meat tomatoes)

(rember1*-letcc
 'a
 '((foo bar) baz))
; ==> '((foo bar) baz)

```

<hr/>

<h4 id="union">the  definition of union</h4>
``` scheme
(define union2
  (lambda (set1 set2)
    (letrec ((member? (lambda (a lat)
                (cond ((null? lat) #f)
                              ((eq? a (car lat)) #t)
                              (else (member? a (cdr lat))))))
             (A (lambda (set1)
                (cond
                  ((null? set1) set2)
                  (else
                   (let ((p1 (A (cdr set1))))
                     (if (member? (car set1) set2)
                         p1
                         (cons (car set1) p1))))))))
      (A set1))))
      (union2 '(a b c) '(c d e f))
```

<hr/>

<h4 id="intersect">the  definition of intersect</h4>
``` scheme
(define intersect
  (lambda (set1 set2)
    (cond
      ((null? set1) '())  ; don't forget the 1st commandment
      ((member? (car set1) set2)
       (cons (car set1) (intersect (cdr set1) set2)))
      (else
        (intersect (cdr set1) set2)))))
```

```
; Examples of intersect
;
;(intersect '(a b x c d) '(q w e x r t y a))     ; '(a x)
;(intersect '(a b x c d) '())                    ; '()
;(intersect '() '())                             ; '()
;(intersect '() '(a b x c d))                    ; '()
;(intersect '(a b x c d) '(a b x c d))           ; '(a b x c d)
```


intersect letrec version

<font color="red">use letrec to remove arguments that do not change for recursive applications</font>

``` scheme
(define intersect-letrec
  (lambda (set1 set2)
    (letrec
      ((I (lambda (set)
            (cond
              ((null? set) '())
              ((member? (car set) set2)
               (cons (car set) (I (cdr set))))
              (else
                (I (cdr set)))))))
      (I set1))))

; Test of intersect-letrec
;
;(intersect-letrec '(a b x c d) '(q w e x r t y a))     ; '(a x)
;(intersect-letrec '(a b x c d) '())                    ; '()
;(intersect-letrec '() '())                             ; '()
;(intersect-letrec '() '(a b x c d))                    ; '()
;(intersect-letrec '(a b x c d) '(a b x c d))           ; '(a b x c d)
```

<hr/>

<h4 id="intersectall">the  definition of intersectall</h4>

``` scheme
; The intersectall function finds intersect of a bunch of sets
;
(define intersectall
  (lambda (lset)
    (cond
      ((null? lset) '())
      ((null? (cdr lset)) (car lset))
      (else
        (intersect (car lset)
                   (intersectall (cdr lset)))))))

; Examples of intersectall
;
;(intersectall '((a) (a) (a)))                   ; '(a)
;(intersectall '((a) () (a)))                    ; '()
;(intersectall '())                              ; '()
;(intersectall '((a b c d) (b c d e) (c d e f))) ; '(c d)

; Obeying the 12th commandment
;
(define intersectall-letrec
  (lambda (lset)
    (letrec
      ((A (lambda (lset)
            (cond
              ((null? (cdr lset)) (car lset))
              (else
                (intersect (car lset)
                           (A (cdr lset))))))))
      (cond
        ((null? lset) '())
        (else (A lset))))))

; Tests of intersectall-letrec
;;
;(intersectall-letrec '((a) (a) (a)))                   ; '(a)
;(intersectall-letrec '((a) () (a)))                    ; '()
;(intersectall-letrec '())                              ; '()
;(intersectall-letrec '((a b c d) (b c d e) (c d e f))) ; '(c d)


(define intersectall-ap
  (lambda (lset)
    (call-with-current-continuation
      (lambda (hop)
        (letrec
          ((A (lambda (lset)
                (cond
                  ((null? (car lset)) (hop '()))
                  ((null? (cdr lset)) (car lset))
                  (else
                    (I (car lset)
                       (A (cdr lset)))))))
           (I (lambda (s1 s2)
                (letrec
                  ((J (lambda (s1)
                        (cond
                          ((null? s1) '())
                          ((member? (car s1) s2)
                           (cons (car s1) (J (cdr s1))))
                          (else
                            (J (cdr s1)))))))
                  (cond
                    ((null? s2) (hop '()))
                    (else (J s1)))))))
          (cond
            ((null? lset) '())
            (else (A lset))))))))

; Tests of intersectall-ap
;
;(intersectall-ap '((a) (a) (a)))                   ; '(a)
;(intersectall-ap '((a) () (a)))                    ; '()
;(intersectall-ap '())                              ; '()
;(intersectall-ap '((a b c d) (b c d e) (c d e f))) ; '(c d)
```



最后再透过deep star的写法优化过程来体会TSS的函数精髓。
<hr/>

<h3 id="di">depthStar improvement </h3>

通过[depth](#depth)进一步阐释letrec的意义（从原始的depth到[depth-let](#depthlet)
然后[depth-let-if](#letif)，以及更为清晰版本的[depth-let-max](#letmax),然后最后浓缩到最后的6行代码[depth-max](#max)。


<h4 id="depth">depth</h4>

``` scheme
; The depth* function finds the max depth of an s-expression
;
(define depth*
  (lambda (l)
    (cond
      ((null? l) 1)
      ((atom? (car l)) (depth* (cdr l)))
      (else
        (cond
          ((> (depth* (cdr l))
              (add1 (depth* (car l))))
           (depth* (cdr l)))
          (else
(add1 (depth* (car l)))))))))


(depth* '((pickled) peppers (peppers pickled)))                          ; 2
(depth* '(margarine ((bitter butter) (makes) (batter (bitter))) butter)) ; 4
(depth* '(c (b (a b) a) a)) ; 3

```

let version:

<h4 id="depthlet">depth-let</h4>
``` scheme

(define depth*-let
  (lambda (l)
    (cond
      ((null? l) 1)
      ((atom? (car l)) (depth*-let (cdr l)))
      (else
       (let ((rightPart (depth*-let (cdr l)))
             (leftPart (add1 (depth*-let (car l)))))
         (cond
           ((> rightPart
               leftPart)
            rightPart)
           (else
            leftPart)))))))

(depth*-let '((pickled) peppers (peppers pickled)))                          ; 2
(depth*-let '(margarine ((bitter butter) (makes) (batter (bitter))) butter)) ; 4
(depth*-let '(c (b (a b) a) a)) ; 3
```

let-if version:

<h4 id="letif">depth-let-if</h4>
``` scheme
(define depth*-let-if
  (lambda (l)
    (cond
      ((null? l) 1)
      ((atom? (car l)) (depth*-let-if (cdr l)))
      (else
       (let ((rightPart (depth*-let-if (cdr l)))
             (leftPart (add1 (depth*-let-if (car l)))))
         (if (> rightPart leftPart)
            rightPart
            leftPart))))))

(depth*-let-if '((pickled) peppers (peppers pickled)))                          ; 2
(depth*-let-if '(margarine ((bitter butter) (makes) (batter (bitter))) butter)) ; 4
(depth*-let-if '(c (b (a b) a) a)) ; 3
```

depth-let-max version:

<h4 id="letmax">depth-let-max</h4>

``` scheme
define depth*-let-max
  (lambda (l)
    (cond
      ((null? l) 1)
      ((atom? (car l)) (depth*-let-max (cdr l)))
      (else
       (let ((rightPart (depth*-let-max (cdr l)))
             (leftPart (add1 (depth*-let-max (car l)))))
         (max rightPart leftPart))))))

(depth*-let-max '((pickled) peppers (peppers pickled)))                          ; 2
(depth*-let-max '(margarine ((bitter butter) (makes) (batter (bitter))) butter)) ; 4
(depth*-let-max '(c (b (a b) a) a)) ; 3

```


depth-max version:

<h4 id="max">depth-max</h4>
``` scheme
(define depth*-max
  (lambda (l)
    (cond
      ((null? l) 1)
      ((atom? (car l)) (depth*-max (cdr l)))
      (else
         (max (depth*-max (cdr l)) (add1 (depth*-max (car l))))))))

(depth*-max '((pickled) peppers (peppers pickled)))                          ; 2
(depth*-max '(margarine ((bitter butter) (makes) (batter (bitter))) butter)) ; 4
(depth*-max '(c (b (a b) a) a)) ; 3
```


<hr/>


常用链接，

+ [Scheme清单][1]
+ [Google racket User group][3]
+ [Gossip about the decision tree][4]
+ GreghenderShoot 1970
    - [Github Repo][5]
    - [Fear of macro][6] Tell us the history of macro, overcome the fear of macro
    - [frog][7] one static website generator tool
    - [His Website][8]
+ Tonyg
    - [Github Repo][10]
    - [His opensource tools: Bitsyntax][11]
+ [racket freenote robot, Gossip Platform][12]
+ Husk scheme
    - [husk repo][14]
    - [husk get started][15]
+ [chicken scheme][19]
+ [R5RS html file][16]
+ root of lisp
    - [original site][17]
    - [define implement][18]



BTW, one very good vim tips, you can use [Vimfiler][9], with shortkey `m and then r` to rename
the file in the editor page.

[1]:http://jueqingsizhe66.github.io/blog/2016/02/14/si-ji-mo-si-de-le-yuan-schemers/
[2]:http://blog.sina.com.cn/s/blog_bffd70da0101f4sl.html 
[3]:https://groups.google.com/forum/#!forum/racket-users
[4]:https://groups.google.com/forum/#!topic/racket-users/cPuTr8lrXCs
[5]:https://github.com/greghendershott
[6]:https://github.com/greghendershott/fear-of-macros
[7]:https://github.com/greghendershott/frog
[8]:http://www.greghendershott.com/
[9]:https://github.com/Shougo/vimfiler.vim 
[10]:https://github.com/tonyg?tab=repositories
[11]:http://tonyg.github.io/racket-bitsyntax/
[12]:https://botbot.me/freenode/racket/ 
[13]:http://jueqingsizhe66.github.io/blog/2015/05/18/the-little-scheme-and-part-of-tss/ 
[14]:https://github.com/justinethier/husk-scheme
[15]:http://justinethier.github.io/husk-scheme/manual/getting-started.html
[16]:http://www.schemers.org/Documents/Standards/R5RS/HTML/r5rs-Z-H-2.html#%_toc_start 
[17]:http://www.paulgraham.com/rootsoflisp.html 
[18]:https://github.com/hlpp/scheme/tree/master/tests 
[19]:https://github.com/alaricsp/chicken-scheme 
