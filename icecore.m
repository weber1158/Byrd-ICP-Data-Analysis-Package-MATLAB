function icecore(core)
%ICECORE Prints the latitude, longitude, elevation,
%   and more details regarding a specified ice core.
%
%	NOTE:
%	The input must be a string, and must given in 
%	sentence case. That is, you must use capital
%	letters at the start of each word. You must also
%	include a space between words, except for Bona-
%	Churchill, which has a hyphen.
%
%	EXAMPLE:
%	>> icecore("Puruogangri");
%	Puruogangri (33.91°N, 89.08°E, 6070 masl) was
%	drilled from Tibetan Plateau, China in 2000.
%
%%%%%%%%%%%%%%
% Load ice core details text file
%%%%%%%%%%%%%%
if exist("icecores.txt") == 2
	allcores=readtable("icecores.txt","Delimiter","\t");

%%%%%%%%%%%%%%
% Check that core name exists
%%%%%%%%%%%%%%
if nargin < 1
        error('ERROR: No input provided. Must provide an ice core name as a string. For example, icecore("Quelccaya").');
end

%%%%%%%%%%%%%%
% Check identity of core name
%%%%%%%%%%%%%%
	if core == "huascaran" || core == "Huascaran" || core == "Nevado Huascaran" || core == "nevado huascaran" || core == "nevado-huascaran" || core == "Nevado-Huascaran"
		corename = "Nevado Huascarán";
		idx=allcores{:,1}==corename;
		location=allcores{idx,"Location"};
		lat=allcores{idx,"LatN"};
		lon=allcores{idx,"LonE"};
		elev=[6050,6768];
		dyr=[1993,2019];
		
		latstr = ['(' sprintf('%0.2f',lat) '°N,'];
		lonstr = [sprintf('%0.2f',lon) '°E,'];
		elevstr= [num2str(elev(1)) ' and ' num2str(elev(2)) ' masl)'];
		locstr = ['was drilled from' {location} 'in'];
		dyrstr = [num2str(dyr(1)) ' and ' num2str(dyr(2)) '.'];
		printstatement=join(convertStringsToChars(['The' corename 'ice core' latstr lonstr elevstr locstr dyrstr]));
		disp(printstatement{:})
	elseif core == "Guliya" || core == "guliya"
		corename = "Guliya";
		idx=allcores{:,1}==corename;
		location=allcores{idx,"Location"};
		lat=allcores{idx,"LatN"};
		lon=allcores{idx,"LonE"};
		elev=[6050,6710];
		dyr=[1992,2015];
		
		latstr = ['(' sprintf('%0.2f',lat) '°N,'];
		lonstr = [sprintf('%0.2f',lon) '°E,'];
		elevstr= [num2str(elev(1)) ' and ' num2str(elev(2)) ' masl)'];
		locstr = ['was drilled from' {location} 'in'];
		dyrstr = [num2str(dyr(1)) ' and ' num2str(dyr(2)) '.'];
		printstatement=join(convertStringsToChars(['The' corename 'ice core' latstr lonstr elevstr locstr dyrstr]));
		disp(printstatement{:})
	elseif core == "Quelccaya" || core == "quelccaya"
		corename = "Quelccaya";
		idx=allcores{:,1}==corename;
		location=allcores{idx,"Location"};
		lat=allcores{idx,"LatN"};
		lon=allcores{idx,"LonE"};
		elev=5670;
		dyr=[1983,2003];
		
		latstr = ['(' sprintf('%0.2f',lat) '°N,'];
		lonstr = [sprintf('%0.2f',lon) '°E,'];
		elevstr= [num2str(elev(1)) ' masl)'];
		locstr = ['was drilled from' {location} 'in'];
		dyrstr = [num2str(dyr(1)) ' and ' num2str(dyr(2)) '.'];
		printstatement=join(convertStringsToChars(['The' corename 'ice core' latstr lonstr elevstr locstr dyrstr]));
		disp(printstatement{:})
	elseif core == "Bona Churchill" || core == "Bona-Churchill" || core == "bona churchill" || core == "bona-churchill"
		corename="Bona-Churchill";
		normalprint(allcores,corename)
	elseif core == "bruce plateau" || core == "Bruce Plateau"
		corename="Bruce Plateau";
		normalprint(allcores,corename)
	elseif core == "Dasuopu" || core == "dasuopu"
		corename="Dasuopu";
		normalprint(allcores,corename)
	elseif core == "Dunde" || core == "dunde"
		corename="Dunde";
		normalprint(allcores,corename)
	elseif core == "Kilimanjaro" || core == "kilimanjaro"
		corename="Kilimanjaro";
		normalprint(allcores,corename)
	elseif core == "Puncak Jaya" || core == "puncak jaya" || core == "Papua" || core == "papua" || core == "Papua Indonesia" || core == "papua indonesia"
		corename="Puncak Jaya";
		normalprint(allcores,corename)
	elseif core == "Plateau Remote" || core == "plateau remote"
		corename="Plateau Remote";
		normalprint(allcores,corename)
	elseif core == "Prince of Wales" || core == "Prince Of Wales" || core == "prince of wales"
		corename="Prince of Wales";
		normalprint(allcores,corename)
	elseif core == "Puruogangri" || core == "puruogangri"
		corename="Puruogangri";
		normalprint(allcores,corename)
	elseif core == "Sajama" || core == "sajama"
		corename="Sajama";
		normalprint(allcores,corename)
	elseif core == "Siple Station" || core == "siple station"
		corename="Siple Station";
		normalprint(allcores,corename)
	elseif core == "Windy Dome" || core == "windy dome"
		corename="Windy Dome";
		normalprint(allcores,corename)
	else
		error("ERROR: Ice core name not found. Check spelling, capitalization, and/or punctuation.")
	end
%%%%%%%%%%%%%%
% Display error if ice core file is not found
%%%%%%%%%%%%%%
else
	error("ERROR: The file 'icecores.txt' is not on your MATLAB search path.")
end

end

function normalprint(data,core_name)
	idx=data{:,1}==core_name;
	location=data{idx,"Location"};
	lat=data{idx,"LatN"};
	lon=data{idx,"LonE"};
	elev=data{idx,"Elevation"};
	dyr=data{idx,"DrillYear"};
	
	latstr = ['(' sprintf('%0.2f',lat) '°N,'];
	lonstr = [sprintf('%0.2f',lon) '°E,'];
	elevstr= [sprintf('%d',elev) ' masl)'];
	locstr = ['was drilled from' {location} 'in'];
	dyrstr = [num2str(dyr) '.'];
	printstatement=join(convertStringsToChars(['The' core_name 'ice core' latstr lonstr elevstr locstr dyrstr]));
	disp(printstatement{:})
end