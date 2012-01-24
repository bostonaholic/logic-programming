%
% Individuals
%

male(matthew).
male(nicholas).
male(jeffrey).
female(ruth).

male(wendell).
female(nancy).
male(dan).

male(gerald).
female(freda).
male(terry).
female(melissa).

%
% Relationships
%

parent(matthew,jeffrey).
parent(nicholas,jeffrey).
parent(matthew,ruth).
parent(nicholas,ruth).

parent(jeffrey,wendell).
parent(dan,wendell).
parent(jeffrey,nancy).
parent(dan,nancy).

parent(ruth,gerald).
parent(terry,gerald).
parent(melissa,gerald).
parent(ruth,freda).
parent(terry,freda).
parent(melissa,freda).

%
% Associations
%

descendent(Person,Descendent) :- parent(Descendent,Person).

father(Child,Father) :- parent(Child,Father), male(Father).
mother(Child,Mother) :- parent(Child,Mother), female(Mother).

grandparent(Grandchild,Grandparent) :- parent(Grandchild,Parent), parent(Parent,Grandparent).
paternalgrandfather(Grandchild,Grandfather) :- father(Grandchild,Father), father(Father,Grandfather).
paternalgrandmother(Grandchild,Grandmother) :- father(Grandchild,Father), mother(Father,Grandmother).
maternalgrandfather(Grandchild,Grandfather) :- mother(Grandchild,Mother), father(Mother,Grandfather).
maternalgrandmother(Grandchild,Grandmother) :- mother(Grandchild,Mother), mother(Mother,Grandmother).

sibling(Person,Sibling) :- parent(Person,Parent), parent(Sibling,Parent), \+ (Person=Sibling).

brothers(Person) :- sibling(Sibling,Person), male(Sibling).
brother(PersonA,PersonB) :- sibling(PersonA,PersonB), male(PersonA), \+ (PersonA=PersonB).
brothers(PersonA,PersonB) :- brother(PersonA,PersonB), male(PersonB).

sisters(Person) :- sibling(Sibling,Person), female(Sibling).
sister(PersonA,PersonB) :- sibling(PersonA,PersonB), female(PersonA), \+ (PersonA=PersonB).
sisters(PersonA,PersonB) :- sister(PersonA,PersonB), female(PersonB).
