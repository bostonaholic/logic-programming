(ns zebra
  (:refer-clojure :exclude [==])
  (:use [clojure.core.logic]
        [clojure.tools.macro :as macro]))

;;;
;;; Rules
;;;
(defne is-right-of [x y list]
  ([_ _ [x y . ?r]])
  ([_ _ [_ . ?r]] (is-right-of x y ?r)))

(defn next-to [x y list]
  (conde
   ((is-right-of x y list))
   ((is-right-of y x list))))

;;;
;;; Facts
;;;
(defn owns-zebra [who street]
  (macro/symbol-macrolet [_ (lvar)]
    (all
      (== street [_ _ [_ _ _ 'milk _] _ _])
      (membero ['red 'englishman _ _ _] street)
      (membero [_ 'spaniard 'dog _ _] street)
      (membero ['green _ _ 'coffee _] street)
      (membero [_ 'ukranian _ 'tea _] street)
      (is-right-of ['green _ _ _ _] ['ivory _ _ _ _] street)
      (membero [_ _ 'snails _ 'old-gold] street)
      (membero ['yellow _ _ _ 'kools] street)
      (firsto street [_ 'norwegian _ _ _])
      (next-to [_ _ _ _ 'chesterfields] [_ _ 'fox _ _] street)
      (next-to [_ _ _ _ 'kools] [_ _ 'horse _ _] street)
      (membero [_ _ _ 'orange-juice 'lucky-strike] street)
      (membero [_ 'japanese _ _ 'parliaments] street)
      (next-to [_ 'norwegian _ _ _] ['blue _ _ _ _] street)
      (membero [_ who 'zebra _ _] street))))


;; (run 1 [q]
;;      (fresh [who street]
;;             (owns-zebra who street)
;;             (== q who)))

;; ([[yellow norwegian  fox    _.0          kools]
;;   [blue   ukranian   horse  tea          chesterfields]
;;   [red    englishman snails milk         old-gold]
;;   [green  japanese   _.1    coffee       parliaments]
;;   [ivory  spaniard   dog    orange-juice lucky-strike]])