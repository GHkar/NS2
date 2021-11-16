#packet Delivery Ratio
BEGIN {
	sendPkt =0
	recvPkt=0
	forwardPkt=0
}

{
event=$1
packet=$4
if(event =="s" && packet =="AGT") {
	sendPkt++;
}

if(event =="r" && packet =="AGT") {
	recvPkt++;
}

if(event =="f" && packet =="AGT") {
	forwardPkt++;
}

}

END {
	printf("the sent packets are %d \n", sendPkt);
	printf("the received packets are %d \n", recvPkt);
	printf("the forwarded packets are %d \n", forwardPkt);
	printf("Packets Delivery Ratio is %f \n", (recvPkt/sendPkt));
}
