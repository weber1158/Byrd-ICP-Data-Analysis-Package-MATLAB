function cite(dataset)
%CITE use this function to print the reference for
%	a specified data set, along with the DOI for
%	locating the data online. 
%	
%	Exactly ONE Input agument:
%	Must be a string matching the name of the dataset.
%	Specifying no input argument will print a list of
%	references for ALL data sets [equivalent to using
%	the citations() function].
%
%	Example:
%	cite("huascaran1993")
%
%%%%%%%%%%%%%%%%%%%%%%%%
% BEGIN CODE BELOW:
%%%%%%%%%%%%%%%%%%%%%%%%
%
% Print all citations if no input argument specified
if nargin < 1
	citations()
else
  % % String/cell arrays containing the reference citations
  % % and the data set DOI links
	% Create a table from citations.txt
	citationstable=readtable("citations.txt",...
		"Delimiter","\t",...
		"NumHeaderLines",3,...
		"ReadVariableNames",false);
	% Index into the appropriate rows of citations.txt
	ref_idx=3:6:size(citationstable,1);
	doi_idx=5:6:size(citationstable,1);
	% Extract the references from citations.txt
	references=citationstable{ref_idx,1};
	datasetdoi=citationstable{doi_idx,1};
	
	% String array of data set IDs
	dataIDs=["bona-churchillBC";
		"bona-churchill800";
		"bruce-plateau";
		"dasuopu1000";
		"dasuopu500TE";
		"dunde-guliya-dasuopu";
		"dunde1500";
		"guliya-thickness";
		"guliya15ka";
		"guliya2015";
		"guliya1992";
		"guliya340TE";
		"guliya45TE";
		"IPO550";
		"kilimanjaro";
		"huascaran1993";
		"papua-indonesia";
		"papua-rainfall";
		"plateau-remote";
		"plateau-remote";
		"prince-of-wales";
		"puruogangri";
		"puruogangri-TE";
		"quelccaya1983";
		"quelccaya-TE";
		"quelccaya2003";
		"sajama";
		"siple-station";
		"windy-dome"];
	
	% Find index of dataset in dataIDs
	data_idx=dataset==dataIDs;
	
	if dataset ~= "plateau-remote"
		disp("=====================================")
		disp("Citation:")
		disp(references{data_idx,1})
		disp(" ")
		disp("Dataset DOI:")
		disp(datasetdoi{data_idx,1})
		disp("=====================================")
	elseif dataset == "plateau-remote" % Plateau remote has two citations, so needs a separate if-statement
		first=unique(data_idx,'first'); % First occurence of plateau remote
		last=unique(data_idx,'last'); % Last occurence of plateau remote
		disp("=====================================")
		disp("Citation (2000yr):")
		disp(references{first,1})
		disp(" ")
		disp("Dataset DOI:")
		disp(datasetdoi{first,1})
		disp("=====================================")
		disp("Citation (4000yr):")
		disp(references{last,1})
		disp(" ")
		disp("Dataset DOI:")
		disp(datasetdoi{last,1})
		disp("=====================================")
	else
		error("ERROR! Data set name not recongnized. Please be sure that the input is spelled correctly and given as a string in double-quotes.")
	end % End if dataset ~= "plateau-remote"
end % End if nargin < 1

end