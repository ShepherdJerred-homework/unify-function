(progn
  (load "../src/match.lisp")
  (load "../src/simplify.lisp")
  (load "../src/unify.lisp")
  (trace unify)
  (trace do-unify))

(and
  (equal
    (unify '(+ a b) '(+ a x))
    ((X . B)))
  (equal
    (unify '(+ a b) '(x a b))
    ((X . +)))
  (equal
    (unify '(+ (- b c) a) '(+ x y))
    ((Y . A) (X - B C)))
  (equal
    (unify '(+ Y B) '(+ A X))
    ((X . B) (Y . A)))
  (equal
    (unify '(* A Z) '(* Y Y))
    ((Z . A) (Y . A)))
  (equal
    (unify '(+ (- B C) Y) '(+ X A))
    ((Y . A) (X - B C)))
  (equal
    (unify '(+ Z (+ B A)) '(+ C (+ Y X)))
    ((X . A) (Y . B) (Z . C))))
