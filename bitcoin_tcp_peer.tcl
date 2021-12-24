# Node shape and color

set ns [new Simulator]


# setting value
$ns color 1 Red
$ns color 2 Blue

# how many makes node
set realNode 9100
# limit node num
set limit 2320
set throughput 3
set delayTime 3.5
set packetSize 1448



# ======================================================

# result tr, nam file
set tr [open "out.tr" w]
$ns trace-all $tr

set ftr [open "out.nam" w]
$ns namtrace-all $ftr


proc finish { } {
	global ns tr ftr
	$ns flush-trace
	close $tr
	close $ftr
	exec nam out.nam &
	exit
}

# loading peer info.txt
set f [open "10m.txt" r]
gets $f line
# throw first line like "source target"


# ======================================================

# setting node
set nodeNum 1

while { $nodeNum <= $realNode } {

# set n0 [$ns node]
# set n1 [$ns node]
# .
# .


set [format "n%d" $nodeNum] [$ns node]
set nodeNum [expr $nodeNum + 1]

}


# ======================================================
#$n0 shape box
#$n0 color green


# setting link
set s 1

while {$s <= $limit} {
global f line

# loading source and target
set column 0
foreach line [split [gets $f] \t] {
set sourceTarget($column) $line
set column [expr $column + 1]
}

if {$sourceTarget(0) != $sourceTarget(1)} {
set s $sourceTarget(0)
set t $sourceTarget(1)



if {$s <= $limit} {
# $ns duplex-link $n0 $n1 2Mb 3ms DropTail
# $ns duplex-link $n0 $n2 2Mb 3ms DropTail
# .
# .
$ns duplex-link [expr $[format "n%d" $s]] [expr $[format "n%d" $t]] [format "%0.1fMb" $throughput] [format "%0.1fms" $delayTime] DropTail

puts $s
puts $t
puts "\n"

}
}
}

close $f

# ======================================================


# loading peer info.txt
set f [open "10m.txt" r]
gets $f line

# setting TCP/Sink Application
set s 1
set appNum 0
while { $s <= $limit } {

global f line appNum

# loading source and target
set column 0
foreach line [split [gets $f] \t] {
set sourceTarget($column) $line
set column [expr $column + 1]
}

if {$sourceTarget(0) != $sourceTarget(1)} {
set s $sourceTarget(0)
set t $sourceTarget(1)

# TCP Application for n1 and n2
if { $s <= $limit} {

# set tcp0 [new Agent/TCP]
# set sink0 [new Agent/TCPSink]
# $ns attach-agent $n1 $tcp0
# $ns attach-agent $n2 $sink0
# $ns connect $tcp0 $sink0


# set ftp0 [new Application/FTP]
# $ftp0 attach-agent $tcp0

# $tcp0 set packet_size_ 1000
# $tcp0 set fid_ 1


set [format "tcp%d" $appNum] [new Agent/TCP]
set [format "sink%d" $appNum] [new Agent/TCPSink]
$ns attach-agent [expr $[format "n%d" $s]] [expr $[format "tcp%d" $appNum]]
$ns attach-agent [expr $[format "n%d" $t]] [expr $[format "sink%d" $appNum]]
$ns connect [expr $[format "tcp%d" $appNum]] [expr $[format "sink%d" $appNum]]

set [format "ftp%d" $appNum] [new Application/FTP]
[expr $[format "ftp%d" $appNum]] attach-agent [expr $[format "tcp%d" $appNum]]


[expr $[format "tcp%d" $appNum]] set packetSize_ $packetSize
[expr $[format "tcp%d" $appNum]] set fid_ 1


set appNum [expr $appNum + 1]

puts $appNum
puts $s
puts $t
puts "\n"
}
}
}

# ======================================================

puts "Total Link"
puts [expr $appNum - 1]

# Event Scheduling 시간을 의미 0.1초에 시작~ 2.1초에 끝남
set snum 0
while { $snum < [expr $appNum - 1] } {
# $ns at .1 "$ftp start"
# $ns at 2 "$ftp stop"
# $ns at 2.1 "finish"

$ns at .2 "[expr $[format "ftp%d" $snum]] start"
$ns at 1 "[expr $[format "ftp%d" $snum]] stop"

set snum [expr $snum + 1]

}


$ns at 1.1 "finish"
$ns run
