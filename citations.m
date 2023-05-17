function citations()
%CITATIONS calling the citations() function will display a
%	list of all data sets available in the readICP() function,
%	along with the reference citation for the original manu-
%	script of the data set and the DOI link for the data set
%	on the National Centers for Environmental Information web
%	page.

if exist("citations.txt") == 2
	citations=fileread("citations.txt");
	disp(citations)
else
	error("ERROR: The file 'datasets.txt' is not on your MATLAB search path.")
end