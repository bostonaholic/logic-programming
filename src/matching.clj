(ns matching
  (:refer-clojure :exclude [==])
  (:use [clojure.core.logic]
        [clojure.tools.macro :as macro]))

(defne is-one-two [x y]
  ([_ 2]))

(defn one-twoo [x y]
  (is-one-two x y))