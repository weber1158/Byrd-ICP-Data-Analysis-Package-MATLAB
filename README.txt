==========================================
README file
==========================================
Why the Byrd IPC Data Analysis Package?

This package is intended to hasten the process of acquiring ice core data
from the Byrd Polar & Climate Research Center (BPCRC) Ice Core
Paleoclimatology Group (ICP). All data in this package are available at the
following API URL:

https://www.ncei.noaa.gov/access/paleo-search/study/search.json?dataPublisher=NOAA&dataTypeId=7&investigators=Mosley-Thompson%2C%20E.%7CThompson%2C%20L.G.&headersOnly=true

==========================
DOCUMENTATION
==========================
The package contains functions for automatically downloading the published
data for any ice core record collected by the BPCRC-ICP. Listed below are
the available functions and their documentation.

**************************
>> datasets()
**************************
Prints an alphabetical list of all data sets available
within the package. Each data set in the list includes
the Dataset ID that is used when calling the readICP()
function, as well as a secondary list of all the sub-
sets within that data set.

**************************
>> citations()
**************************
Prints an alphabetical list of all data sets available 
within the package, along with the original reference
for the data set and a DOI link to where the data is
stored on the NCEI website. 

**************************
>> cite("dataset")
**************************
Prints the citation for a specified data set, along with
a DOI link to where the data is stored on the NCEI web-
site. Providing no input argument will print the citations
for every data set (equivalent to the citations() function).

**************************
>> T = readICP("dataset","subset")
**************************
Imports a table containing the data within the specified data set. The
input argument must be given as a string. The name of the data set can be
found using the datasets() function. A second input is required if the 
data set contains a subset.

Example:
>> BP = readICP("bruce-plateau","d18O");

Will produce a table named BP that contains the oxygen stable isotope data
for the Bruce Plateau ice core. Note that the subset IDs are different for
every data set, so simply using "d18O" will not work in every case. Be sure
to check the proper subset names by calling the datasets() function.

Some data sets do not contain any subsets, in which case a second input is 
not needed.

Example:
>> WD = readICP("siple-station");

**************************
>> plt = icePlot(xData,yData,parameter_as_string)
**************************
The icePlot() function has the same functionality as the base plot()
function but improves upon the default visualization. You must
specify two input arguments, with an optional third input: 
1) xData - a vector containing the times or depths corresponding to each
measurement in yData
2) yData - a vector containing the ice core measurements you wish to plot;
be sure that the elements in yData are in the same order as they were when 
you originally imported them using readICP(). Or, if you have changed the 
order, be sure that the order of the elements in xData is equivalently 
reordered.
3) parameter_as_string - a string used for specifying the labels and style of
the plot. It can be any of the following:
======================================
| PARAMETER | STRING | ASSUMED UNITS |
|===========|========|===============|
| oxygen    |        |               |
| stable    | 'd18O' |   permil (‰)  |
| isotopes  |        |               |
|-----------|--------|===============|
| deuterium | 'dxs'  |   permil (‰)  |
| excess    |        |               |
|-----------|--------|===============|
| nitrate   | 'no3'  |      ppb      |
|-----------|--------|===============|
| ammonium  | 'nh4'  |      ppb      |
|-----------|--------|---------------|
| black     | 'bc'   |     pg/g      |
| carbon    |        |               |
|-----------|--------|---------------|
| sulfate   | 'so4'  |      ppb      |
|-----------|--------|===============|
| chloride  | 'Cl'   |      ppb      |
|-----------|--------|===============|
| total     | 'dust' |   counts/mL   |
| dust      |        |               |
|-----------|--------|===============|
| accumula- | 'acc'  |   m ice eq.   |
| ation     |        |               |
|-----------|--------|===============|
======================================
To edit the plot, use dot-indexing in the same way that you would with any 
other plot. For example

>> plt = icePlot(xData,yData,'NO3'); % Plot nitrate data
>> plt.LineWidth=2; % Change line thickness to 2
>> plt.Color ='r'; % Change line color to red

NOTE: If specifying a third input to the icePlot() function, the y-axis will
be given a default label depending on the parameter you specified. The label
is not always consistent between data sets. For instance, by default, specify-
ing "NO3" as the third input will label the y-axis as "ppb". While most of the
nitrate concentration data sets are in units of ppb, some are in units of ppm. 
Make sure that the units are correct by visiting the DOI link for the data set.
If not, you can override the y-axis label by using using ylabel("new label"):

>> plt = icePlot(xData,yData,'NO3');
>> ylabel('ppm') % Change ylabel from 'ppb' -> 'ppm'

**************************
>> icecore("core");
**************************
Prints the geographical details and drilling information for a specified
ice core site.

Example:
>> icecore("Huascaran");

Will print:
	The Nevado Huascarán ice core (-9.11°N, -77.61°E, 6050 and 6768 masl) was 
	drilled from Peru in 1993 and 2019.

============================================================