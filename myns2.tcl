Class mom
mom instproc greet {} {
$self instvar age
puts "$age years old mom says: How are you doing?"
}

Class kid -superclass mom
kid instproc greet {} {
$self instvar age
puts "$age old kid says: I am fine"
}

set a [new mom]
$a set age 50
set b [new kid]
$b set age 16
$a greet
$b greet
