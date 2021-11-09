set a 0
#set b "this"
#set c 2.3

## 다른 변수 넣어주기
#set x $a
#puts $x

## 수 더해보기
#set r [expr $a + 12]
#puts $r

## 문자열 출력과 줄넘김 없애기
#puts -nonewline "this is"
#puts " demo"

## if-else 문 사용하기
#if { $a > 5} {
#puts "a is grater than 5"
#} else {
#puts "a is smaller than 5"
#}

#if [expr $a > 5] {
#puts "a is grater than 5"
#} else {
#puts "a is smaller than 5"
#}

## 반복문 사용법 사이 사이에 줄바꿈 꼭 들어가 있어야 함
#while { $a < 101 } {

#puts $a

#set a [expr $a + 2]

#}



