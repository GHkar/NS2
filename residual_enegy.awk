#residual energy of node
#tcl 파일에 energy_init 값이 지정되어 있어야 하며, 그 값이 충분히 커야 함
BEGIN {
	i=0
	n=0
	total_energy=0.0
	energy_avail[s] = initenergy;
}

{
event=$1
time=$2
node_id=$3
#substr($3,2,1)
energy_value=$6
pkt_id=$12
packet_size=$8
pkt_type=$7

if(event =="M") {
	for(i=0;i<6;i++) {
		if(i==node_id) {
			energy_avail[i] = energy_avail[i] - (energy_avail[i] - energy_value);
			printf("%d, %f\n", i, energy_avail[i]);
		}
	}
}
}

END {
for(i=0;i<6;i++) {
	printf("Residual Energy of node %d is %f \n", i, energy_avail[i])
	total_energy = total_energy + energy_avail[i];
	if(energy_avail[i] !=0)
	n++
}
printf("the total Residual energy if the network is %f \n", total_energy);
printf("\n");
}
