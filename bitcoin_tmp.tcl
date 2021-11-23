# Node shape and color

set ns [new Simulator]


# setting value
$ns color 1 Red
$ns color 2 Blue

# how many makes node
set realNode 10
# limit node num
set limit 5
set throughput 250
set delayTime 3.5



# ======================================================

# result tr, nam file
set tr [open "out_250.tr" w]
$ns trace-all $tr

set ftr [open "out_250.nam" w]
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
set f [open "peerinfo copy.txt" r]
gets $f line
# draw first line like "source target"


# ======================================================

# setting node
set nodeNum 1

while { $nodeNum < $realNode } {

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
set nodeNum 1
while { $nodeNum <= $limit} {
global f nodeNum line

# loading source and target
set column 0
foreach line [split [gets $f] \t] {
set sourceTarget($column) $line
set column [expr $column + 1]
}

set s $sourceTarget(0)
set t $sourceTarget(1)

if { $s != $nodeNum} {
set nodeNum [expr $nodeNum + 1]
}

if {$s <= $limit} {
# $ns duplex-link $n0 $n1 2Mb 3ms DropTail
# $ns duplex-link $n0 $n2 2Mb 3ms DropTail
# .
# .
$ns duplex-link [expr $[format "n%d" $s]] [expr $[format "n%d" $t]] [format "%0.1fMb" $throughput] [format "%0.1fms" $delayTime] DropTail
}
}

close $f

# ======================================================

# loading peer info.txt
set f [open "peerinfo copy.txt" r]
gets $f line

# setting TCP/Sink Application
set nodeNum 1
set appNum 0
while { $nodeNum <= $limit } {

global f nodeNum line appNum

# loading source and target
set column 0
foreach line [split [gets $f] \t] {
set sourceTarget($column) $line
set column [expr $column + 1]
}

set s $sourceTarget(0)
set t $sourceTarget(1)


if { $s != $nodeNum} {
set nodeNum [expr $nodeNum + 1]
}


if { $s <= $limit} {

# TCP Application for n1 and n2
# set tcp0 [new Agent/TCP]
# set sink0 [new Agent/TCPSink]
# $ns attach-agent $n1 $tcp0
# $ns attach-agent $n2 $sink0
# $ns connect $tcp0 $sink0
# set ftp0 [new Application/FTP]
# $ftp0 attach-agent $tcp0

set [format "tcp%d" $appNum] [new Agent/TCP]
set [format "sink%d" $appNum] [new Agent/TCPSink]
$ns attach-agent [expr $[format "n%d" $s]] [expr $[format "tcp%d" $appNum]]
$ns attach-agent [expr $[format "n%d" $t]] [expr $[format "sink%d" $appNum]]
$ns connect [expr $[format "tcp%d" $appNum]] [expr $[format "sink%d" $appNum]]
set [format "ftp%d" $appNum] [new Application/FTP]
[expr $[format "ftp%d" $appNum]] attach-agent [expr $[format "tcp%d" $appNum]]

set appNum [expr $appNum + 1]
}
}


# Event Scheduling 시간을 의미 0.1초에 시작~ 2.1초에 끝남
set snum 0
while { $snum < [expr $appNum - 1] } {
# $ns at .1 "$ftp start"
# $ns at .2 "$cbr start"
# $ns at 2 "$ftp stop"
# $ns at 2 "$cbr stop"
# $ns at 2.1 "finish"

$ns at .1 "[expr $[format "ftp%d" $snum]] start"
$ns at 2 "[expr $[format "ftp%d" $snum]] stop"

set snum [expr $snum + 1]

}
$ns at 2.1 "finish"
$ns run
