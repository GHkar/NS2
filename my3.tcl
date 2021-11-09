## 전역 변수와 지역 변수
#set x 10
#proc fun {} {
#global x
#set x 12
#}

#puts $x
#fun
#puts $x



## 파일 입출력
# File Mode : r w a r+ w+

#set f [open "one.txt" r]

# 파일에 쓰기
#puts $f "welcome to ns2 tutorials"

# 파일 내용 받아오기
#gets $f d

#puts $d

#close $f
