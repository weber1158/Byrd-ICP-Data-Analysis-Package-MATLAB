function datasets()
%DATASETS Calling the datasets() function will display a
%	list of all the available data sets and their correspond-
%	ing subsets that can be accessed using the readICP() 
%	function.

if exist("datasets.txt") == 2
	datasets=fileread("datasets.txt");
	disp(datasets)
else
	error("ERROR: The file 'datasets.txt' is not on your MATLAB search path.")
end