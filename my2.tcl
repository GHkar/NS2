## for loop 문 사용하기
#for {set a 1} {$a < 11} {incr a} {
#puts $a
#}

## for loop 문에서 incr 대신에 expr 사용하는 방법
#for {set a 1} {$a < 11} {set a [expr $a + 1]} {
#puts $a
#}


## 배열 사용하기
#set a(0) 21
#set a(1) 33
#set a(2) 45

#puts $a(0)
#puts $a(1)

#set salary("john") 20000
#set salary("raj") 30000

#puts $salary("john")



## procedure 함수 사용법
#proc max {a b} {

#if {$a > $b } {
#puts $a
#} else {
#puts $b
#}
#}
#max 23 45


## 함수 return
#proc sum {a b c} {
#set c [expr $a + $b + $c]

#return $c
#}

#set x [sum 12 23 34]
#puts $x


#proc reList {} {

#return [list 12 23 34 45]
#}

#set x [reList]
#puts $x
