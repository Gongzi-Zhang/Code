## Display
显示器的接口决定了图像传输的质量。
D-Sub(VGA:Video Graphics Adapter): 蓝色， 3x5针孔， 模拟信号（图像细节丢失）， 正逐渐过时。
DVI(Digital Visual Interface): 白色
HDMI(High Difinition Multimedia Interface): 
DP(Display Port):


# SSD
V580: mSATA接口，mlc闪存，240-256GB，Marvell主控，>=256M 缓存, 1000以内
	Crucial英睿达 MX200 250G mSATA 固态硬盘

* 主控芯片(SSD cpu) (对SSD性能影响： 20%)
* 闪存芯片:(60%)
    Single-Level Cell: 单层式存储，只有两种状态，速度快，容量小，成本高，寿命高
    Multi-Level Cell : 两层式存储，有四种状态，速度慢些，容量大些，目前市场主流
    Trinary-Level Cell:三层式存储，有八种状态，速度慢，容量大,成本低，寿命短（但只是相对而言，用个十年还是没问题）
* 固件算法: (20%)
选购：
    1) 容量：首推256G
    2）接口：常见的有：
	 SATA : sata2 or sata3, 正常为2.5吋，可安装于原本机械硬盘槽
         MSATA(mini SATA): 与sata同样性能，但尺寸小，通常为50mmx30mm， 没有外壳，主供电压3.3V
	 M.2/NGFF(Next Generation Form Factor): Intel为超级本打造的尺寸更小的SSD接口，NGFF 2242为 42mm*22mm， NGFF 2260为60mm*22mm. 
	 PCI-E：MacBook专用
    3) 品牌：
	看主控:
	看闪存:
	看固件:
	看缓存: 对于SSD而言，缓存并不能很大提升读写速度，而是有助于延长SSD芯片的使用时间，因为缓存中的数据不一定写入SSD，只有最终需要保存的数据才会写入SSD的FLASH芯片，所以减少了SSD的读写次数，提升了寿命。（有的SSD用闪存读写速度掩盖真实的SSD读写速度，这种情况下，只需扩大测试数据区块，就能得到真实的SSD大数据读写速度）
    4) 性能：SSD的读写速度其实不是很重要，不要被误导，毕竟谁也不会整天用SSD拷贝大文件。真正重要的参数是 4k IOPS(即每秒输入输出值), IOPS指存储每秒可接受多少次主机访问，小文件频繁读写才是真正的日常。
    5) 有无断电保护（对于安全性，稳定性影响较大）
    6) 功耗（笔记本需要考虑）
使用：
    *) 小分区 : 用于垃圾回收GC, 因为SSD无法想机械硬盘一样点对点精准操作，只能在区块操作，GC时，先收集该区域有效信息，保存至空白区域，再整体察除该区域。所以有了小分区，即不要把SSD的容量分满，留一部分用于SSD内部优化操作，如 磨损平衡，垃圾回收，坏块映射。
    *) 少分区：毕竟SSD容量不大，分区总有一部分空间是永不到的，导致浪费； 另外分区太多容易导致分区错位，在分区边界的磁盘区域SSD性能可能受影响，如128G的SSD可分为2个分区，256G的可分为2-4个分区。
    *) 少分区
