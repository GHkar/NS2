## class & object

Class Student

# 출력하는 함수 정의
Student instproc show {} {
$self instvar name roll city
puts "Name:$name"
puts "Roll:$roll"
puts "City:$city"

}

# 기본 생성자
Student instproc init {} {
$self instvar name roll city
set name "default"
set roll 0
set city "delhi"
}

# distrucor 파괴자
Student instproc destroy {} {
puts "Destructor called"
}



Student ob1
#ob1 set name "raj"
#ob1 set roll 1234
#ob1 set city "delhi"

#puts [ob1 set name]
#puts [ob1 set roll]
#puts [ob1 set city]

ob1 show
ob1 destroy
