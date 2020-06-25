Covid HotSpot Detection 

Team Hotspotters (India)
Hari, Shylaja, Ashutosh, Sachin


DESCRIPTION OF SOLUTION

The solution contains the following files:

1. MATLAB code - this contains two-node and multi-node network models based on Ashutosh's paper. The detailed working is explained in the comments and the writeup submitted along with this challenge. 

	init1.m 	- Initialization code with instructions
	twonode.m	- Two-node model
	multinode.m	- Multi-node network model

Running multinode.m models disease spread in 32 connected clusters. The model is currently initialized with randomized test parameters. This can be changed to reflect the actual structure of Hyderabad city provided that sufficiently granular data is provided.

2. 


INTEGRATION

The code provided is **proof-of-concept** for different components of the whole solution. In order to move towards the final solution, these components can be integrated - for example, the adjacency matrix can be dumped into a CSV by the relevant code; the MATLAB code can read connectivity data from a CSV file; the MATLAB code can create an output CSV file which can then be used by the dashboard code for rendering, etc. Also - to provide a realistic tracking of cases in the city, disaggregated data of adequate spatio-temporal resolution must be provided.





