function core = icecoreStruct(name_as_string) % Replaces the icecore() funciton from Byrd-ICP v1.0
%ICECORESTRUCT Creates a struct containing the data set information for a
%		 specified ice core site.
%   
%	NOTE: The input must be a string. The input must be spelled
%	correctly for the function to recognize it. The input is also
%	somewhat case-sensitive but several variations are accepted
%	in most cases. For example, "Guliya" and "guliya" are both
%	valid inputs for the same ice core (but not "GULIYA"). If the
%	ice core has a multi-word name, include a space or hyphen between 
%	words. For example, "Windy Dome" and "windy-dome" are both valid.
%
%	Example:
%	>> PG = icecore("Puruogangri"); % Stucture containing information about
%								    % the Puruogangri ice core
%	>> PG_elev = PG.Elevation; % Extract elevation of Puruogangri core
%	>> PG_ds = PG.DatasetID; % Extract list of available data set IDs
%
%%%%%%%%%%%%%%%%%
%	FUNCTION	%
%%%%%%%%%%%%%%%%%
if isstring(name_as_string) % Check that input is a string

	% If true, the following if-statement checks for a match 
	% b/w the input string and any of the ice cores available
	% within the function. (Lines 27-350)
	core=struct();

	% BONA CHURCHILL
	if ismember(name_as_string,["Bona Churchill","Bona-Churchill","bona churchill","bona-churchill"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Latitude.Value=61.40;
			core.Longitude.Units='degE';
			core.Longitude.Value=-141.70;
			core.Elevation=4420;
			core.DrillYear=2002;
			core.Location="Alaska, USA";
		% Data set information
			core.DatasetID=["bona-churchillBC";...
				"bona-churchill800"];
			core.SubsetID={...
				["ammonium","Ammonium concentrations per sample";...
				"ammonium_annual","Ammonium concentrations as annual averages";...
				"blackcarbon","Black carbon concentrations per sample";...
				"blackcarbon_annual","Black carbon concentrations as annual averages"];...
				["N/A","This data set has no subsets."]};

	% BRUCE PLATEAU
	elseif ismember(name_as_string,["bruce plateau","Bruce Plateau","bruce-plateau","Bruce-Plateau"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longiude.Units='degE';
			core.Latitude.Value=-66.04;
			core.Longitude.Value=-64.08;
			core.Elevation=1976;
			core.DrillYear=2009;
			core.Location="Antarctic Peninsula";
		% Data set information
			core.DatasetID="bruce-plateau";
			core.SubsetID=[...
				"accumulation","Annual net accumulation";...
				"d18O","Annual average δ18O"];

	% DASUOPU
	elseif ismember(name_as_string,["Dasuopu","dasuopu"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=28.38;
			core.Longitude.Value=85.72;
			core.Elevation=7200;
			core.DrillYear=1997;
			core.Location="Tibetan Plateau, China";
		% Data set information
			core.DatasetID=[...
				"dasuopu1000";...
				"dasuopu500TE";...
				"dunde-guliya-dasuopu"];
			core.SubsetID={...
				["annual","Core 3 annual average data";...
				"decadal","Core 3 decadal average data";...
				"net-balance","Core 2 and Core 3 annual net balance"];...
				["TEflux","10 yr average trace element flux";...
				"EnrichFactor","10 yr median crustal enrichment factor";...
				"TEsubannual","Subannual trace element data"];...
				["N/A","This data set has no subsets."]};

	% DUNDE
	elseif ismember(name_as_string,["Dunde","dunde"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Latitude.Value=38.10;
			core.Longitude.Units='degE';
			core.Longitude.Value=96.40;
			core.Elevation=5325;
			core.DrillYear=1987;
			core.Location="Tibetan Plateau, China";
		% Data set information
			core.DatasetID=[...
				"dunde-guliya-dasuopu";...
				"dunde1500"];
			core.SubsetID={...
				["N/A","This data set has no subsets."];...
				["accumulation","Core 1 net balance (5yr annual averages)";...
				"d18O","Core 3 oxygen isotopes (decadal averages)";...
				"dust-anions","Core 3 dust and anions"]};

	% GULIYA
	elseif ismember(name_as_string,["Guliya","guliya"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=35.28;
			core.Longitude.Value=81.48;
			core.Elevation=[6050;6710];
			core.DrillYear=[1992;2015];
			core.Location="Tibetan Plateau, China";
		% Data set information
			core.DatasetID=[...
				"dunde-guliya-dasuopu";...
				"guliya-thickness";...
				"guliya15ka";...
				"guliya2015";...
				"guliya1992";...
				"guliya340TE";...
				"guliya45TE"];
			core.SubsetID={...
				["N/A","This data set has no subsets."];...
				["plateau","Thickness data on the plateau (6050 masl)";...
				"summit","Thickness data on the summit (6650 masl)"];...
				["raw","δ18O per sample data";...
				"century-average","δ18O 100yr average data"];...
				["raw-core1","Core 1 per sample data";...
				"raw-core2","Core 2 per sample data";...
				"annual-core1","Core 1 annually averaged data";...
				"anuual-core2","Core 2 annually averaged data"];...
				["raw-data","Guliya ice core data by depth";...
				"decade-average","Guliya ice core data decadal averages";...
				"400yr-average","Guliya ice core 400yr averages";...
				"chlorine-36","Chlorine 36 data"];...
				["N/A","This data set has no subsets."];...
				["N/A","This data set has no subsets."]};

	% INTERDECADAL PACIFIC OSCILLATION
	elseif ismember(name_as_string,["IPO","Interdecadal Pacific Oscillation","IPO Index","IPO Index Reconstruction","Interdecadal Pacific Oscillation Index","Interdecadal Pacific Oscillation Index Reconstruction","IPO Reconstruction","Interdecadl Pacific Oscillation Reconstruction"])
		% Geographical and drilling information
			core.Details="Not an ice core data set, but a 550-yr reconstruction of the Interdecal Pacific Oscillation Index based on four ice core records around the Pacific Ocean. The ice core records utilized for making the reconstruction are (1) Bona-Churchill, (2) Dasuopu, (3) Bruce Plateau, and (4) Quelccaya.";
		% Data set information
			core.DatasetID="IPO550";
			core.SubsetID=["N/A","This data set has no subsets."];

	% KILIMANJARO
	elseif ismember(name_as_string,["Kilimanjaro","kilimanjaro"])
		% Geographical and drill information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=-3.08;
			core.Longitude.Value=37.35;
			core.Elevation=5893;
			core.DrillYear=2000;
			core.Location="Tanzania, Africa";
		% Data set information
			core.DatasetID="kilimanjaro";
			core.SubsetID=[...
				"d18O-depth","NIF2 and NIF3 isotope data by depth";...
				"d18O-decade","Decadal average isotope data from 5 cores";...
				"d18O-50Yavg","50yr average isotope and dust (NIF2 and NIF3)";...
				"NIF2-raw","Kilimanjaro NIF2 core per sample data";...
				"NIF2-chlorine-36","Kilimanjaro NIF2 36Cl data";...
				"NIF2-ion","Kilimanjaro NIF2 core ion chemistry data";...
				"NIF3-ion","Kilimanjaro NIF3 core ion chemistry data"];

	% NEVADO HUASCARAN
	elseif ismember(name_as_string,["huascaran","Huascaran","Nevado Huascaran","nevado huascaran","nevado-huascaran","Nevado-Huascaran"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Latitude.Value=-9.11;
			core.Longitude.Units='degE';
			core.Longitude.Value=-77.61;
			core.Elevation=6050;
			core.DrillYear=1993;
			core.Location="Peru";
		% Data set information
			core.DatasetID="huascaran1993";
			core.SubsetID=[...
				"C2-100yr-avg","Core 2 century-averaged data";...
				"C2-anion","Core 2 anion data";...
				"annual-avg-cal","Annual avg. (calendar year) data from Cores 1 and 2";...
				"annual-avg-thermal","Annual avg. (thermal year) data from Cores 1 and 2";...
				"C2-raw","Data by depth from Core 2";...
				"C1-alt","Layer thickness data from Core 1";...
				"C2-alt","Layer thickness data from Core 2";...
				"monthly","Monthly data from Cores 1 and 2"];

	% PUNCAK JAYA, PAPUA, INDONESIA
	elseif ismember(name_as_string,["Puncak Jaya","PuncakJaya","puncak jaya","puncakjaya","puncak-jaya","Puncak-Jaya","Papua","papua","Papua Indonesia","Papua-Indonesia","papua indonesia","papua-indonesia"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=-4.08;
			core.Longitude.Value=137.17;
			core.Elevation=4884;
			core.DrillYear=2010;
			core.Location="Papua, Indonesia";
		% Data set information
			core.DatasetID=[...
				"papua-indonesia";...
				"papua-rainfall"];
			core.SubsetID={...
				["D1-raw","Core D1 isotope, dust, and chemistry data";...
				"D1-tritium","Core D1 tritium (3H) data";...
				"D1B-chemsitry","Core D1B chemistry data";...
				"D1B-raw","Core D1B per sample data";...
				"NINO3sst","δ18O and NINO3 SST reconstruction";...
				"log-transform","Log transformed dust and chemistry data";...
				"tritium-precip","Papua instrumental precipitation tritium data"];...
				["grasberg","Grasberg precipitation isotope data";...
				"kuala-kencana","Kuala Kencana precipitation isotope data";...
				"portsite","Portsite precipitation isotope data";...
				"tembagapura","Tembagapura precipitation isotope data";...
				"timika","Timika precipitation isotope data"]};


	% PLATEAU REMOTE, ANTARCTICA
	elseif ismember(name_as_string,["PlateauRemote","Plateau Remote","Plateau-Remote","plateauremote","plateau remote","plateau-remote"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=-84.00;
			core.Longitude.Value=43.00;
			core.Elevation=3330;
			core.DrillYear=1986;
			core.Location="Antarctica";
		% Data set information
			core.DatasetID="plateau-remote";
			core.SubsetID=[...
				"d18O-2ka","δ18O data for the last 2000 years";...
				"d18O-4ka","δ18O data for the last 4000 years"];


	% PRINCE OF WALES, ELLSEMERE ISLAND, CANADA
	elseif ismember(name_as_string,["Prince of Wales","Prince-of-Wales","Prince-Of-Wales","Prince Of Wales","prince of wales","prince-of-wales","Ellesmere Island","Ellesmere-Island","ellesmere island","ellesmere-island"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=78.40;
			core.Longitude.Value=-80.40;
			core.Elevation=2030;
			core.DrillYear=1995;
			core.Location="Ellesmere Island, Canada";
		% Data set information
			core.DatasetID="prince-of-wales";
			core.SubsetID=["N/A","This data set has no subsets."];


	% PURUOGANGRI
	elseif ismember(name_as_string,["Puruogangri","puruogangri"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=33.92;
			core.Longitude.Value=89.08;
			core.Elevation=6070;
			core.DrillYear=2000;
			core.Location="Tibetan Plateau, China";
		% Data set information
			core.DatasetID=[...
				"puruogangri";...
				"puruogangri-TE"];
			core.SubsetID={...
				["C1-d18O-raw","Core 1 average δ18O per meter";...
				"C1-d18O-decade","Core 1 decadal average δ18O";...
				"C2-d18O-ions","Core 2 δ18O, ions and dust (avg per meter)";...
				"C2-5yr-avg","Core 2 all measurements (5yr averages)";...
				"C2-decade","Core 2 decadal average δ18O, ions, dust";...
				"C2-100yr-avg","Core 2 century-averaged δ18O, ions, dust"];...
				["raw","Annual trace element + enrichment factor data";...
				"5yr-avg","5yr avg. trace element + enrichment factor data"]};


	% QUELCCAYA ICE CAP
	elseif ismember(name_as_string,["Quelccaya","quelccaya","Quelccaya Ice Cap","quelccaya ice cap","QIC","qic"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=-13.93;
			core.Longitude.Value=-70.83;
			core.Elevation=5670;
			core.DrillYear=[1983;2003];
			core.Location="Peru";
		% Data set information
			core.DatasetID=[...
				"quelccaya1983";...
				"quelccaya-TE";...
				"quelccaya2003"];
			core.SubsetID={...
				["QC1","Core 1 data";...
				"QS1","Summit core data";...
				"conductivity","Conductivity data"];...
				["5yr-avg","Trace elements, enrichment factors, and flux data (5yr avg.)";...
				"5yr-median","Trace elements, enrichment factors, and flux data (5yr median)";...
				"EF-seasonal","Dry season and wet season enrichment factors (5yr median)"];...
				["QND","North Dome decadal accumulation + δ18O data";...
				"QSD-annual","Summit Dome annual accumulation, chemistry, + δ18O data";...
				"QSD-decade","Summit Dome decadal accumulation, chemistry, + δ18O data";...
				"QSD-ALT","Summit Dome annual layer thickness data";...
				"NINO4sst","Decadal Nino4 Sea Surface Temperature Reconstruction"]};


	% SAJAMA
	elseif ismember(name_as_string,["Sajama","sajama"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=-18.00;
			core.Longitude.Value=-69.00;
			core.Elevation=6548;
			core.DrillYear=1997;
			core.Location="Bolivia";
		% Data set information
			core.DatasetID="sajama";
			core.SubsetID=[...
				"C1-100yr-avg","Core 1 data as 100yr averages";...
				"C1-accumulation","Core 1 accumulation reconstruction (as standard deviations)";...
				"sample-avg","Core 1 data 5m/3m/0.5m averages + Core 2 δ18O"];


	% SIPLE STATION
	elseif ismember(name_as_string,["siple-station","siple station","siple","Siple","Siple Station","Siple-Station","siplestation","SipleStation"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=-75.92;
			core.Longitude.Value=-84.15;
			core.Elevation=1054;
			core.DrillYear=1985;
			core.Location="Antarctica";
		% Data set information
			core.DatasetID="siple-station";
			core.SubsetID=["N/A","This data set has no subsets."];

	% WINDY DOME
	elseif ismember(name_as_string,["Windy Dome","WindyDome","Windy-Dome","windy dome","windy dome","windy-dome"])
		% Geographical and drilling information
			core.Latitude.Units='degN';
			core.Longitude.Units='degE';
			core.Latitude.Value=80.78;
			core.Longitude.Value=63.65;
			core.Elevation=509;
			core.DrillYear=1996;
			core.Location="Graham Bell Island, Franz Josef Land, Russian Arctic";
		% Data set information
			core.DatasetID="windy-dome";
			core.SubsetID=["N/A","This data set has no subsets."];
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% IF NO MATCHING STRING NAME IS FOUND %
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	else 
		error("ERROR: Invalid input. Make sure the spelling and capitalization are in the proper format.")
	end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IF INPUT IS NOT A STRING %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else % If input is not a string
	error('ERROR: Input must be a string matching the name of an ice core. For example: icecore("Quelccaya")')
end