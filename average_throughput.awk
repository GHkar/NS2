#average throughput
BEGIN {
	recv_size=0
	sTime=1e6
	spTime=0
	NumOfRecd=0
}
#This awk file works only for new trace format, old trace does not have support
# $1 refers 1st column
# $2 refers 2nd column and so on...
{
event=$1
time=$2
node_id=$3
packet=$4
pkt_id=$12
flow_id=$13
packet_size=$8
flow_type=$7
# 최대 시간을 바꿔주는 것임
if(packet=="AGT" && sendTime[pkt_id] == 0 && (event == "+" || event == "s")) {
	if (time < sTime) {
		sTime=time
	}
	sendTime[pkt_id] = time
	this_flow=flow_type
}
if(packet=="AGT" && event == "r") {
	if(time > spTime) {
		spTime=time
	}
	recv_size = recv_size + packet_size
	recvTime[pkt_id] = time
	NumOfRecd = NumOfRecd + 1
}
}

END {
	if (NumOfRecd ==0) {
		printf("No packets, the simulation might be very small \n")
	}
	printf("Start Time %d\n", sTime)
	printf("Stop Time %d\n", spTime)
	printf("Received Packets %d\n", NumOfRecd)
	printf("The throughput in kbps is %f \n", (NumOfRecd/(spTime-sTime)*(8/1000)))
}
