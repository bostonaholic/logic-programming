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
descendent(Person,Descendent) :- parent(Descendent,Parent), descendent(Person,Parent).

father(Child,Father) :- parent(Child,Father), male(Father).
mother(Child,Mother) :- parent(Child,Mother), female(Mother).

grandparent(Grandchild,Grandparent) :- parent(Grandchild,Parent), parent(Parent,Grandparent).
paternalgrandfather(Grandchild,Grandfather) :- father(Grandchild,Father), father(Father,Grandfather).
paternalgrandmother(Grandchild,Grandmother) :- father(Grandchild,Father), mother(Father,Grandmother).
maternalgrandfather(Grandchild,Grandfather) :- mother(Grandchild,Mother), father(Mother,Grandfather).
maternalgrandmother(Grandchild,Grandmother) :- mother(Grandchild,Mother), mother(Mother,Grandmother).

sibling(Person,Sibling) :- setof(Sibs, Parent^(parent(Person,Parent), parent(Sibling,Parent), \+ Person=Sibling), Sibs).

brothers(Person) :- sibling(Sibling,Person), male(Sibling).
brother(PersonA,PersonB) :- sibling(PersonA,PersonB), male(PersonA), \+ (PersonA=PersonB).

sisters(Person) :- sibling(Sibling,Person), female(Sibling).
sister(PersonA,PersonB) :- sibling(PersonA,PersonB), female(PersonA), \+ (PersonA=PersonB).