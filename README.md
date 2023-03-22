## NS2
: Network Simulator2

** **참고 사이트**   
https://github.com/hbatmit/ns2.35/tree/master/tcl/ex   
https://www.nsnam.com/2018/08/awk-scripts-for-ns2-lecture-8.html


## How to Install
<pre>
<code>
sudo apt-get update
sudo apt-get install tcl-dev tk-dev
sudo apt-get install build-essential autoconf automake libxmu-dev
sudo apt-get install gcc-4.8 g++-4.8

sudo apt-get install ns2
sudo apt-get install nam
sudo apt-get install xgraph
</code>
</pre>

## How to Run
<pre>
<code>
## ns 실행
ns

## tcl 문서 실행
ns my.tcl

## awk 파일 구동시
awk -f filename.awk filename.tr
gawk -f filename.awk filename.tr

## 결과 값을 txt 로 저장하고, 그래프로 출력하는 방법
gawk -f instatnt_throughput.awk wireless.tr > through.txt
xgraph through.txt
</code>
</pre>

