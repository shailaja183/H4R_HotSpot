Covid HotSpot Detection 

Team Hotspotters (India)
Hari, Shylaja, Ashutosh, Sachin


A. DESCRIPTION OF SOLUTION

The solution contains the following files:

1. MATLAB code - this contains two-node and multi-node network models based on Ashutosh's paper. The detailed working is explained in the comments and the writeup submitted along with this challenge. 

	init1.m 	- Initialization code with instructions
	twonode.m	- Two-node model
	multinode.m	- Multi-node network model

Running multinode.m models disease spread in 32 connected clusters. The model is currently initialized with randomized test parameters. This can be changed to reflect the actual structure of Hyderabad city provided that sufficiently granular data is provided.

2. Client-side code

2.1 map.html: User Interface that displays HeatMap of Hyderabad based on Covid Hotspots
2.2 map_data.js: contains hotspot possibility predicted by Matlab model for various regions in format- [latitude, longitude, intensity] required to render map.html
2.3 matrix.html: User Interface that displays Mobility Information among various Containment Regions of Hyderabad
2.4 matrix_data.json: contains Mobility data required to render matrix.html

**PLEASE NOTE THAT THE CLIENTSIDE CODE HAS BEEN TESTED ON FIREFOX, PLEASE CONTACT THE TEAM IF YOU HAVE DIFFICULTY RUNNING IT ON OTHER BROWSERS**

In the folder "documentation and references":

3. The research paper based on which the model was constructed has also been added as the file SIR_covid.pdf 

4. A copy of the writeup/article in PDF format has been added for reference.
 

B. INTEGRATION

The code provided is **proof-of-concept** for different components of the whole solution. In order to move towards the final solution, these components can be integrated - for example, the adjacency matrix can be dumped into a CSV by the relevant code; the MATLAB code can read connectivity data from a CSV file; the MATLAB code can create an output CSV file which can then be used by the dashboard code for rendering, etc. Also - to provide a realistic tracking of cases in the city, disaggregated data of adequate spatio-temporal resolution must be provided. Finally, stub code is provided for machine learning to enable the model to track the true situation accurately. This can be elaborated based on the availability of appropriately high-resolution data for the next version of the system.




