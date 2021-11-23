# 전역 변수와 지역 변수
set x 10
proc fun {} {
global x
set x 12
}

#puts $x
#fun
#puts $x



# 파일 입출력
# File Mode : r w a r+ w+

set f [open "one.txt" r]

#파일에 쓰기
#puts $f "welcome to ns2 tutorials"

#파일 내용 받아오기
#gets $f d

#puts $d



set a "a"
set b "b"
set [append a b] "2"
puts $ab

set c 0
#set n0 [format "n%d" $c]
set [format "n%d" $c] 3
puts $n0

set n "\$n"
set tmp "$n%d"
#puts [expr [format $tmp $c] / 3 ]

#puts $[format "n%d" $c]
puts [expr $[format "n%d" $c] / 3]

set d 4.5
puts [format "%0.1f" $d]


set d 0
while {$d < 2} {

foreach e [split [gets $f] " "] {
puts $e
}
puts "line end"
set d [expr $d + 1]


}

set a "[expr $[format "n%d" $c]] start"
puts $a


#foreach e [split [gets $f] " "] {
#set item($c) $e
#set c [expr $c + 1]
#}

#puts $item(0)
#puts $item(1)
#puts $item(2)
#puts $item(3)

close $f



