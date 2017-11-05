net install github, from("https://haghish.github.io/github/")

github install MoserGitHub/Censn

h censn

webuse cancer, clear

* age: assumed to be age at study inclusion
* age1: age at study end
gen age1=age+studytime

* stset dataset
stset age1, failure(died) enter(age)

* Skew-normal
censn age1 i.drug, failure(died) lefttrun(age)
* Syntax with stset variables
censn _t i.drug, failure(_d) lefttrun(_t0)
predict time1

* Example with probability weights
gen wght=runiform()*10
summ wght
censn age1 i.drug [pw=wght], failure(died) lefttrun(age)

* Weibull regression
streg i.drug, d(w)
predict time2, mean
