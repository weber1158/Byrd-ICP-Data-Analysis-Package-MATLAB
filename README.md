# **Byrd-ICP Data Analysis Package for MATLAB**

## **Why the Byrd-ICP Data Analysis Pacakge?**
This package is intended to hasten the process of acquiring ice core data from the Byrd Polar and Climate Research Center (BPCRC) Ice Core Paleoclimatology Group (ICP). All data in this package are available at the following API URL:

https://www.ncei.noaa.gov/access/paleo-search/study/search.json?dataPublisher=NOAA&dataTypeId=7&investigators=Mosley-Thompson%2C%20E.%7CThompson%2C%20L.G.&headersOnly=true

-----
## **DOCUMENTATION**
The package contains functions for automatically downloading published data fro any ice core record collected by the BPCRC-ICP. Listed below are the available functions and their documentation (in alphabetical order).

-----
## citations()
This function prints an alphabetical list of all the available ice core data sets in the Byrd-ICP package, along with the original reference citation for the data set and a DOI link to where the data can be found on the NCEI website. **It takes no input arguments.** See `cite()` for printing the reference citation for a specified data set.

Function example
```matlab
citations % or citations()
```

-----
## cite(data_set_name_as_string)
This function prints the citation for a specified data set, along with a DOI link to where the data is stored on the NCEI website. Providing no input argument will print the citations for every data set (equivalent to the `citations()` function). Use the `datasets()` function to find the proper data set ID names. 

Function example:
```matlab
cite("quelccaya2003")
```

-----
## datasets()
This function prints an alphabetical list of all data sets available within the package. Each data set in the list includes the data set ID that is used when calling the `readICP()` and `cite()` functions. It also prints a secondary list of all subsets within each individual data set, along with a description of what each subset contains. **This function takes no input arguments.**

Function example:
```matlab
datasets % or datasets()
```

-----
## icecore(core_name_as_string)
This function prints the geographical details and drilling information for a specified ice core site. The input is the name of an ice core or drilling location, **not** the name of the dataset.

Function example:
```matlab
icecore("Huascaran")
```

-----
## icePlot(xData,yData,parameter_as_string)
This function has the same functionality as the base `plot()` function but improves upon the default visualization. You must specify two input arguments, with an optional third input:
1. xData - a vector containing the times or depths corresponding to each measurement in yData
2. yData - a vector containing the ice core measurements you wish to plot; be sure that the elements in yData are in the same order as theyy were when you originally imported them using `readICP()`. Or, if you have changed the order, be sure that the order of the elements in xData is equivalently reordered.
3. parameter_as_string - a string used for specifying the labels and style of the plot. It can be any of the following:

**PARAMETER** | **STRING** | **ASSUMED UNITS**
---|:---:|:---:
accumulation | `"acc"` | m ice equiv.
ammonium | `"nh4"` | ppb
black carbon | `"bc"` | pg/g
chloride | `"Cl"` | ppb
deuterium excess | `"dxs"` | permil (‰)
dust (total) | `"dust"` | counts/mL
nitrate | `"no3"` | ppb
sulfate | `"so4"` | ppb
oxygen isotopes | `"d18O"` | permil (‰)

To edit the plot, use dot-indexing in the same way that you would with any other plot. For example:

```matlab
plt = icePlot(xData,yData,"no3"); % Plot nitrate data
plt.LineWidth=2; % Change line thickness to 2
plt.Color='r'; % Change line color to red
legend('Nitrate Concentration') % Change contents of the figure legend
```

**NOTE** If specifying a third input to the `icePlot()` function, the y-axis will be given a default label depending on the parameter that you specified (see the third column of the table above). The label is not guaranteed to be consistent between data sets. For instance, by default, specifying `"no3"` as the third input will label the y-axis as `ppb`. While most of the nitrate concentration data sets are indeed given in units of ppb, some are in units of ppm. If you are unsure what the true units are supposed to be, visit the DOI link for the data set to check the metadata on the NCEI website. You can use the `cite()` function to print the correct DOI link. If you find that the default y-label within the `icePlot()` function is not correct for your data set, you can manually change the y-axis label by using the `ylabel` function (just as with normal MATLAB plots):

```matlab
plt = icePlot(xData,yData,"no3");
ylabel("ppm") % Changes ylabel from 'ppb' --> 'ppm'
```

-----
## readICP(data_set_ID,subset_ID)
This is the main function in the package. The `readICP()` function imports a table containing the data within a specified Byrd-ICP data set. **Input arguments must be given as strings.** The name of the data set ID can be found using the `datasets()` function. A second input is only required if the data set contains a subset.

Function example:
```matlab
BP = readICP("bruce-plateau","d18O");
```
The example above will produce a table named `BP` that contains the oxygen isotope data for the Bruce Plateau ice core. Note that the subset IDs are different for every data set, so simply using `"d18O"` will not work in every case. Be sure to check the proper subset names by calling the `datasets()` function.

Some data sets do not contain any subsets, in which case a second input is not needed:
```matlab
WD = readICP("windy-dome");
```

-----