function dataID(ice_core_struct)
%dataID Prints a list of the available dataset IDs
%	for the ice core struct. The struct must be created
%	using the icecore() function.
%
%	For example:
%	>> hs = icecore("Huascaran");
%	>> dataID(hs)
%
%%%%%%%%%%%%%%%%%
%	FUNCTION	%
%%%%%%%%%%%%%%%%%
	if isstruct(ice_core_struct) % Check if input is a structure array
		% If struct only contains information for one data set
		if size(ice_core_struct.DatasetID,1) == 1
			fprintf('%s\n', repmat('=', 1, 64)); % 64 dividers
			fprintf('%-20s\n','DatasetID:')
			fprintf('%-20s\n',strcat('"', ice_core_struct.DatasetID, '"'))
			disp(' ')
			fprintf('%-20s %-10s\n', 'SubsetID:', 'Description:');
			tempSubsetID=ice_core_struct.SubsetID;
			tempSubsetID(:,1)=strcat('"', tempSubsetID(:,1), '"');
			fprintf('%-20s %-10s\n', tempSubsetID.');
			fprintf('%s\n', repmat('=', 1, 64)); % 64 dividers
		% If struct contains information for more than one data set
		elseif size(ice_core_struct.DatasetID,1) > 1
			nd=size(ice_core_struct.DatasetID,1); % Number of data sets for a core
			fprintf('%s\n', repmat('=', 1, 64)); % 64 dividers
			for n = 1:nd
				fprintf('%-20s\n','DatasetID:')
				fprintf('%-20s\n',strcat('"', ice_core_struct.DatasetID(n), '"'))
				disp(' ')
				fprintf('%-20s %-10s\n', 'SubsetID:', 'Description:');
				tempSubsetID=ice_core_struct.SubsetID{n};
				tempSubsetID(:,1)=strcat('"', tempSubsetID(:,1), '"');
				fprintf('%-20s %-10s\n', tempSubsetID.');
				fprintf('%s\n', repmat('=', 1, 64)); % 64 dividers
			end
		else % If struct does not contain the field "DatasetID"
			error('ERROR: Invalid data set. Must be a struct containing the field "DatasetID".')
		end
	else % If input is not of class struct
		error("ERROR: Input must be a structure array created using the icecore() function.")
	end
end