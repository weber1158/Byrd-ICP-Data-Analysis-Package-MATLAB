function T = readICP(dataset,subset)
% Imports a table containing the data within the specified data set. The
% 1st input argument must be given as a string. If the data set has a
% subset, you must specifiy the name of the subset as a second input
% argument. The name of the data set (and any existing subsets) can be
% found using the datasets() function. 
% 
% Here is an example of readICP() in action:
% 
% >> g92 = readICP("guliya1992","raw-data");
% 
% This will produce a table named g92 that contains the raw measurements
% (linearized by depth) for the 1992 Guliya ice core.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION SCRIPT BEGINS HERE:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% BONA-CHURCHILL BLACK CARBON
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if dataset == "bona-churchillBC"
	% Check subsets
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "ammonium"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/bona-churchill/bona-churchill2022nh4.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",116);
		T.Properties.VariableUnits={'year CE','ng/g'};
	elseif subset == "ammonium_annual"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/bona-churchill/bona-churchill2022nh4-ann.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",117);
		T.Properties.VariableUnits={'year CE','ng/g','mg/m^2/yr'};
	elseif subset == "blackcarbon"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/bona-churchill/bona-churchill2022bc.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",116);
		T.Properties.VariableUnits={'year CE','ng/g'};
	elseif subset == "blackcarbon_annual"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/bona-churchill/bona-churchill2022bc-ann.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",117);
		T.Properties.VariableUnits={'year CE','ng/g','mg/m^2/yr'};
	else
		error("Input(s) not understood. Make sure your input(s) are spelled correctly and given as strings")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% BONA-CHURCHILL 800 YEARS
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "bona-churchill800"
	% This data set has no subsets
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/bona-churchill/bona-churchill2019d18o.txt";
	T=readtable(url,"Delimiter","\t","NumHeaderLines",100);
	T.Properties.VariableUnits={'year CE','‰','‰'};

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% BRUCE PLATEAU, ANTARCTIC PENINSULA 100yr
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "bruce-plateau"
	% Check subsets
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "accumulation"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/antarctica/bruce/bruce2016accum.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",93);
		T.Properties.VariableUnits={'age AD','m w.e.'};
	elseif subset == "d18O"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/antarctica/bruce/bruce2016d18o.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",93);
		T.Properties.VariableUnits={'age AD','‰'};
	else
		error("Input(s) not understood. Make sure your input(s) are spelled correctly and given as strings")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% DASUOPU 1000yr
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "dasuopu1000"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dasuopu/dasuopu2000.txt";
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "annual"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",82,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		varnames={'YearAD','d18O','dust','Cl','NO3','SO4'};
		T(:,7:end)=[];
		T(548:end,:)=[];
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'year AD','‰',...
			'counts/mL (0.63-20µm diameter)','ppb','ppb','ppb'};
	elseif subset == "decadal"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",641,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		varnames={'Decade_start','Decade_end','d18O','dust','Cl','NO3','SO4'};
		T(:,8:end)=[];
		T(101:end,:)=[];
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'yr at start of decade','yr at end of decade',...
			'‰','counts/mL (0.63-20µm diameter)','ppb','ppb','ppb'};
	elseif subset == "net-balance"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",754,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		varnames={'YearAD','Core2','Core3'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'year AD','cm/yr','cm ice eq./yr'};
	else
		error("Input(s) not understood. Make sure your input(s) are spelled correctly and given as strings")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% DASUOPU 500yr TRACE ELEMENTS
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "dasuopu500TE"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "TEdata"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dasuopu/dasuopu2020elem-10yr.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",127);
		unit1='decade';
		units2plus=string(repmat('pg/g',size(T,2)-1,1));
		units=cellstr([unit1;...
			units2plus]);
		T.Properties.VariableUnits=units;
	elseif subset == "TEflux"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dasuopu/dasuopu2020elem-10yr-flux.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",127);
		unit1='decade';
		units2plus=string(repmat('pg/g',size(T,2)-1,1));
		units=cellstr([unit1;...
			units2plus]);
		T.Properties.VariableUnits=units;
	elseif subset == "EnrichFactor"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dasuopu/dasuopu2020elem-10yr-efc.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",127);
		unit1='decade';
		units2plus=string(repmat('EF_crustal',size(T,2)-1,1));
		units=cellstr([unit1;...
			units2plus]);
		T.Properties.VariableUnits=units;
	elseif subset == "TEsubannual"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dasuopu/dasuopu2020elem.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",128);
		unit1='m';
		unit2='yr CE';
		units3plus=string(repmat('pg/g',size(T,2)-2,1));
		units=cellstr([unit1;...
			unit2;...
			units3plus]);
		T.Properties.VariableUnits=units;
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% DUNDE DECADAL ISOTOPES
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "dunde-guliya-dasuopu"
	% Dunde
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dunde/dunde-d18o.txt";
	dunde=readtable(url,"Delimiter"," ","NumHeaderLines",87,...
		"ConsecutiveDelimitersRule","join",...
		"ReadVariableNames",false);
	dunde.Var1=[];
	varnames={'date_at_top_of_interval','dunde_d18O'};
	dunde.Properties.VariableNames=varnames;
	% Guliya
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya-d18o.txt";
	guliya=readtable(url,"Delimiter"," ","NumHeaderLines",114,...
		"ConsecutiveDelimitersRule","join",...
		"ReadVariableNames",false);
	guliya(:,[1,4:end])=[];
	varnames={'date_at_top_of_interval','guliya_d18O'};
	guliya.Properties.VariableNames=varnames;
	% Dasuopu
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dasuopu/dasuopu-d18o.txt";
	dasuopu=readtable(url,"Delimiter"," ","NumHeaderLines",109,...
		"ConsecutiveDelimitersRule","join",...
		"ReadVariableNames",false);
	dasuopu.Var1=[];
	varnames={'date_at_top_of_interval','dasuopu_d18O'};
	dasuopu.Properties.VariableNames=varnames;
	% Combine
	dun1=dunde(2:end,:); % Remove 1987
	gul1=guliya(2:end,:); % Remove 1990
	das1=dasuopu(3:end,:); % Remove 1997 and 1990
	T=join(dun1,gul1,"Keys","date_at_top_of_interval");
	T=join(T,das1,"Keys","date_at_top_of_interval");
	% Unremove the 1987, 1990, and 1997 data
	T2=[1997 NaN NaN -17.34; 1990 NaN -12.35 -18.58; 1987 -10.09 NaN NaN];
	varnames={'date_at_top_of_interval','dunde_d18O','guliya_d18O','dasuopu_d18O'};
	T2=array2table(T2,"VariableNames",varnames);
	T=[T2;T]; % Concatentate tables
	T.Properties.VariableNames={'date','dunde_d18O','guliya_d18O','dasuopu_d18O'};
	T.Properties.VariableUnits={'date at top of interval AD',...
		'‰','‰','‰'};

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% DUNDE 1500 yr d18, Dust, Anion Accumulation
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "dunde1500"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/dunde/dunde2006.txt";
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "accumulation"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",93,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		T(77:end,:)=[];
		T(:,4:end)=[];
		varnames={'yr_begin','yr_end','Accumulation'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'yr AD','yr AD','m w.e.'};
	elseif subset == "d18O"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",182,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		T(148:end,:)=[];
		T(:,4:end)=[];
		varnames={'yr_begin','yr_end','d18O'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'yr AD','yr AD','‰'};
	elseif subset == "dust-anions"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",346,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		T(:,8:end)=[];
		varnames={'yr_begin','yr_end','dust_fine','dust_coarse','Cl','SO4','NO3'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'yr AD','yr AD',...
			'counts/mL (0.63-16µm diameter)',...
			'counts/mL (2.00-60µm diameter)',...
			'ppb','ppb','ppb'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% GULIYA ICE THICKNESS
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "guliya-thickness"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "plateau"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2018plateau-thickness.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",107);
		T.Properties.VariableUnits={'ID','°N','°E','m asl','m','m'};
	elseif subset == "summit"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2018summit-thickness.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",107);
		T.Properties.VariableUnits={'ID','°N','°E','m asl','m','m'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% GULIYA 15kaBP
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "guliya15ka"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "raw"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2022_raw_d18O_dex.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",103,"VariableNamingRule","modify");
		warning on
		T.Properties.VariableUnits={'m','‰','‰','m','‰','‰','m','‰','‰'};
	elseif subset == "century-average"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2022_100yavgs_d18O_dex.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",109,"VariableNamingRule","modify");
		warning on
		T.Properties.VariableUnits={'m','cal. ka BP','‰',...
			'‰','m','cal. ka BP','‰','‰','m','cal. ka BP',...
			'‰','‰','cal. ka BP','‰','‰'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% GULIYA 174 yr Annual Data
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "guliya2015"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "raw-core1"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2018core1.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",114,"VariableNamingRule","modify");
		warning on
		T.Properties.VariableUnits={'m','yr CE','‰','‰','ppb',...
			'ppb','ppb','ppb','ppb','ppb','ppb','ppb',...
			'count/mL (0.63-16µm diameter)'};
	elseif subset == "raw-core2"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2018core2.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",106);
		T.Properties.VariableUnits={'m','‰','‰'};
	elseif subset == "annual-core1"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2018core1annual.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",114,"VariableNamingRule","modify");
		warning on
		T.Properties.VariableUnits={'m','yr CE','‰','‰','ppb','ppb',...
			'ppb','ppb'};
	elseif subset == "annual-core2"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2018core2annual.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",106);
		warning on
		T.Properties.VariableUnits={'m','yr CE','‰','‰'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% GULIYA 132 ka data
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "guliya1992"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya1997.txt";
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "raw-data"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",102,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(112:end,:)=[];
		T(:,7:end)=[];
		varnames={'depth','d18O','dust','Cl','SO4','NO3'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'m','‰',...
			'counts/mL (0.63-20µm diameter)',...
			'ppb','ppb','ppb'};
	elseif subset == "decade-average"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",230,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		varnames={'yr_begin','yr_end','d18O','dust','Cl','SO4','NO3','accumulation'};
		T(200:end,:)=[];
		T(:,9:end)=[];
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'yr AD','yr AD','‰',...
			'counts/mL (0.63-20µm diameter)',...
			'ppb','ppb','ppb','cm ice eq./yr'};
	elseif subset == "400yr-average"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",445,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		varnames={'AgeKyr','d18O','dust','Cl','SO4','NO3'};
		T(333:end,:)=[];
		T(:,7:end)=[];
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'ka BP','‰','counts/mL (0.63-20µm diameter)',...
			'ppb','ppb','ppb'};
	elseif subset == "chlorine-36"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",791,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		varnames={'depth','Cl36','error','age'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'m','per gram (x10^4)','Error (%)','ka BP'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% GULIYA 340yr Trace Elements
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "guliya340TE"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2018element.txt";
	T=readtable(url,"Delimiter","\t","NumHeaderLines",118);
	u1='yr CE';
	u2=string(repmat('pg/g',7,1));
	u3=string(repmat('EF',6,1));
	u4=string(repmat('Excess Concentration (pg/g)',6,1));
	units=cellstr([u1;u2;u3;u4]);
	T.Properties.VariableUnits=units;

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% GULIYA 45yr High-resolution Trace Elements
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "guliya45TE"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/guliya/guliya2019element.txt";
	T=readtable(url,"Delimiter","\t","NumHeaderLines",115);
	u1='yr CE';
	u2=string(repmat('pg/g',6,1));
	u3=string(repmat('EF',5,1));
	u4=string(repmat('Excess Concentration (pg/g)',5,1));
	units=cellstr([u1;u2;u3;u4]);
	T.Properties.VariableUnits=units;


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% INTERDECADAL PACIFIC OSILLATION INDEX 550 Yr RECONSTRUCTION
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "IPO550"
	url="https://www.ncei.noaa.gov/pub/data/paleo/reconstructions/porter2021/porter2021ipo.txt";
	warning off
	T=readtable(url,"Delimiter","\t","NumHeaderLines",101);
	warning on
	T.Properties.VariableUnits={'yr CE','IPO Index',...
		'95% confidence interval (lower bound)',...
		'95% confidence interval (upper bound)'};

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% KILIMANJARO
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "kilimanjaro"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/kilimanjaro/kilimanjaro.txt";
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "d18O-depth"
		T=readtable(url,"Delimiter"," ",...
			"NumHeaderLines",65,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(506:end,:)=[];
		T(:,[1,6:end])=[];
		T.Properties.VariableNames={'depth_at_top',...
			'NIF2','NIF3','NIF2_on_NIF3_depth'};
		T.Properties.VariableUnits={'m','‰','‰','‰'};
	elseif subset == "d18O-decade"
		T=readtable(url,"Delimiter"," ",...
			"NumHeaderLines",581,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(151:end,:)=[];
		T(:,[1,8:end])=[];
		T.Properties.VariableNames={'age',...
			'SIF1','SIF2','NIF2','NIF3','FURT'};
		T.Properties.VariableUnits={'ka b1950','‰','‰','‰','‰','‰'};
	elseif subset == "d18O-50Yavg"
		T=readtable(url,"Delimiter"," ",...
			"NumHeaderLines",744,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(281:end,:)=[];
		T(:,[1,8:end])=[];
		T.Properties.VariableNames={'age',...
			'NIF2_d18O','NIF3_d18O','MIXED','NIF3_dust','Huascaran_dust'};
		T.Properties.VariableUnits={'ka b1950','‰','‰','‰',...
			'>0.63µm x10^5/mL','>0.63µm x10^5/mL'};
	elseif subset == "NIF2-raw"
		T=readtable(url,"Delimiter"," ",...
			"NumHeaderLines",1036,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(121:end,:)=[];
		T(:,[1,6:end])=[];
		T.Properties.VariableNames={'top_depth',...
			'NO3','d18O','dust'};
		T.Properties.VariableUnits={'m','ppb','‰','>0.63µm x10^5/mL'};
	elseif subset == "NIF2-chlorine-36"
		T=readtable(url,"Delimiter"," ",...
			"NumHeaderLines",1159, ...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(17:end,:)=[];
		T(:,[1,5:end])=[];
		T.Properties.VariableNames={'top_depth',...
			'Cl36','Error'};
		T.Properties.VariableUnits={'m','atoms/g','Error (%)'};
	elseif subset == "NIF2-ion"
		T=readtable(url,"Delimiter"," ",...
			"NumHeaderLines",1191,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(81:end,:)=[];
		T(:,1)=[];
		T.Properties.VariableNames={'top_age',...
			'Cl','F','Na','NO3','NH4','Ca','K','Mg','SO4','dust'};
		T.Properties.VariableUnits={'ka b1950','ppb','ppb','ppb','ppb',...
			'ppb','ppb','ppb','ppb','ppb','>0.63µm x10^5/mL'};
	elseif subset == "NIF3-ion"
		T=readtable(url,"Delimiter"," ",...
			"NumHeaderLines",1274,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,1)=[];
		T.Properties.VariableNames={'age',...
			'Cl','F','Na','NO3','NH4','Ca','K','Mg','SO4'};
		T.Properties.VariableUnits={'ka b1950','ppb','ppb','ppb',...
			'ppb','ppb','ppb','ppb','ppb','ppb'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% HUASCARAN 1993 d18O, NO3, Layer Thickness, Dust
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "huascaran1993"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "C2-100yr-avg"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/hs2-100a.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",117,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,1)=[];
		T.Properties.VariableNames={'age','d18O','dust','NO3'};
		T.Properties.VariableUnits={'yr BP','‰',...
			'Parcles >0.63µm','ppb'};
	elseif subset == "C2-anion"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/anions.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",117,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T.Properties.VariableNames={'start_decade',...
			'end_decade','Cl','NO3','SO4'};
		T.Properties.VariableUnits={'First thermal year of decade',...
			'Last thermal year of decade',...
			'ppb','ppb','ppb'};
	elseif subset == "annual-avg-cal"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/annualc.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",117,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,1)=[];
		T.Properties.VariableNames={'cal_yr','C2_d18O','C2_dust_large',...
			'C2_dust_total','C2_NO3','C1_d18O'};
		T.Properties.VariableUnits={'Calendar Year','‰',...
			'Particles >2µm','Particles >0.63µm','ppb','‰'};
	elseif subset == "annual-avg-thermal"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/annualt.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",117,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,1)=[];
		T.Properties.VariableNames={'thermal_yr','C2_d18O',...
			'C2_dust_large','C2_dust_total','C2_NO3','C1_d18O'};
		T.Properties.VariableUnits={'Thermal Year (prev. Aug-Jul)',...
			'‰','Particles >2µm','Particles >0.63µm','ppb','‰'};
	elseif subset == "C2-raw"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/hs12-5m.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",116,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,1)=[];
		T(end,:)=[];
		T.Properties.VariableNames={'C2_depth','C2_d18O','C2_dust',...
			'C2_NO3','C1_depth','C1_d18O'};
		T.Properties.VariableUnits={'m','‰','Particles >0.63µm',...
			'ppb','m','‰'};
	elseif subset == "C1-alt"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/hs1layer.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",118,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,[1,9])=[];
		T(1,:)=[];
		% Replace Col1 and Col2 with a single column
		divider="-";
		divider=repmat(divider,size(T,1),1);
		start_yr=(1992:-1:1835)';
		end_yr=(1993:-1:1836)';
		thermal_yr=strcat(num2str(start_yr),divider,num2str(end_yr));
		T.thermal_yr=thermal_yr;
		T=movevars(T,"thermal_yr","Before","Var2");
		% Delete original Col1 and Col2
		T(:,2:3)=[];
		T.Properties.VariableNames={'thermal_yr','depth',...
			'layer_thickness','mean_density','depth_ice_eq',...
			'layer_thickness_ice_eq'};
		T.Properties.VariableUnits={'Year','m','m','g/cm^3',...
			'm ice eq.','m ice eq.'};
	elseif subset == "C2-alt"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/hs2layer.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",118,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,[1,9])=[];
		T(1,:)=[];
		% Replace Col1 and Col2 with a single column
		divider="-";
		divider=repmat(divider,size(T,1),1);
		start_yr=(1992:-1:1719)';
		end_yr=(1993:-1:1720)';
		thermal_yr=strcat(num2str(start_yr),divider,num2str(end_yr));
		T.thermal_yr=thermal_yr;
		T=movevars(T,"thermal_yr","Before","Var2");
		% Delete original Col1 and Col2
		T(:,2:3)=[];
		T.Properties.VariableNames={'thermal_yr','depth',...
			'layer_thickness','mean_density','depth_ice_eq',...
			'layer_thickness_ice_eq'};
		T.Properties.VariableUnits={'Year','m','m','g/cm^3',...
			'm ice eq.','m ice eq.'};
	elseif subset == "monthly"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/huascaran/all-mo.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",118,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T.Properties.VariableNames={'month','C2_d18O',...
			'C2_dust_large','C2_NO3','C1_d18O'};
		T.Properties.VariableUnits={'month starting July 1993',...
			'‰','Particles >2µm','ppb','‰'}; 
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% PAPUA, INDONESIA ICE CORE ISOTOPE AND CHEMICAL DATA
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "papua-indonesia"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "D1-raw"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2019d1.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",105);
		warning on
		T.Properties.VariableUnits={'m','‰','‰','counts/mL','ppb','ppb'};
	elseif subset == "D1-tritium"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2019d1-3h.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",102);
		T.Properties.VariableUnits={'m','Tritium Units','Tritium Units'};
	elseif subset == "D1B-chemistry"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2019d1bchem.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",102);
		warning on
		T.Properties.VariableUnits={'m','ppb','ppb'};
	elseif subset == "D1B-raw"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2019d1biso.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",103);
		T.Properties.VariableUnits={'m','‰','‰','counts/mL'};
	elseif subset == "NINO3sst"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2019iso-sst.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",103);
		T.Properties.VariableUnits={'MM-YYYY','‰','‰','NINO3 SST (°C)'};
	elseif subset == "log-transform"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2019log10.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",106);
		warning on
		T.Properties.VariableUnits={'yr CE','counts/mL','counts/mL',...
			'log10','log10','log10','log10'};
	elseif subset == "tritium-precip"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2019precip-3h.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",103);
		warning on
		T.Properties.VariableUnits={'yr CE','Tritium Units',...
			'Tritium Units','Tritium Units'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% PAPUA, INDONESIA RAINFALL ISOTOPE DATA
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "papua-rainfall"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "grasberg"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2016grs.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",93);
		warning on
		T.Properties.VariableUnits={...
			'MMDDYYYY','‰','‰','‰'};
	elseif subset == "kuala-kencana"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2016kk.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",93);
		warning on
		T.Properties.VariableUnits={...
			'MMDDYYYY','‰','‰','‰'};
	elseif subset == "portsite"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2016port.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",93);
		warning on
		T.Properties.VariableUnits={...
			'MMDDYYYY','‰','‰','‰'};
	elseif subset == "tembagapura"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2016tpr.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",93);
		warning on
		T.Properties.VariableUnits={...
			'MMDDYYYY','‰','‰','‰'};
	elseif subset == "timika"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/papua/papua2016tmk.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",93);
		warning on
		T.Properties.VariableUnits={...
			'MMDDYYYY','‰','‰','‰'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% PLATEAU REMOTE OXYGEN ISOTOPES
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "plateau-remote"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "d18O-2ka"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/antarctica/plateau-remote/plateau-remote2013d18o.txt";
		warning off
		T=readtable(url,"Delimiter","\t","NumHeaderLines",98);
		T.Properties.VariableNames={'age','d18O'};
		warning on
		T.Properties.VariableUnits={'yr CE','‰'};
	elseif subset == "d18O-4ka"
		url="https://www.ncei.noaa.gov/pub/data/paleo/reconstructions/climate12k/temperature/version1.0.0/Temp12k_directory_NOAA_files/PlateauRemote.MosleyThompson.1996.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",122);
		T.Properties.VariableNames={'age','d18O'};
		T.Properties.VariableUnits={'cal. yrs BP','‰'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% PRINCE OF WALES, ELLESMERE ISLAND D18O
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "prince-of-wales"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/polar/ellesmere/prince-of-wales2011d18o.txt";
	T=readtable(url,"Delimiter","\t","NumHeaderLines",103);
	T.Properties.VariableUnits={'yr CE','‰'};

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% PURUOGANGRI 7000 YR ISOTOPE & GEOCHEMICAL DATA
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "puruogangri"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/puruogangri/puruogangri2006.txt";
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "C1-d18O-raw"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",83,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(120:end,:)=[];
		T(:,3:end)=[];
		varnames={'depth','d18O'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'m','‰'};
	elseif subset == "C1-d18O-decade"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",214,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(201:end,:)=[];
		T(:,4:end)=[];
		varnames={'start_decade','end_decade','d18O'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'Year at start of decade',...
			'Year at end of decade','‰'};
	elseif subset == "C2-d18O-ions"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",425,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(216:end,:)=[];
		T(:,13:end)=[];
		varnames={'depth','dust','d18O','F','Cl',...
			'SO4','NO3','Na','NH4','K','Mg','Ca'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'m','Particles (0.63-20μm) Concentration',...
			'‰','ppb','ppb','ppb','ppb','ppb','ppb','ppb','ppb','ppb'};
	elseif subset == "C2-5yr-avg"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",651,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(81:end,:)=[];
		T(:,15:end)=[];
		varnames={'year_begin','year_end','d18O','accumulation',...
			'dust','F','Cl','SO4','NO3','Na','NH4','K','Mg','Ca'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'yr AD','yr AD','‰','cm ice eq./yr',...
			'Particles (0.63-20μm) Concentration','ppb',...
			'ppb','ppb','ppb','ppb','ppb','ppb','ppb','ppb'};
	elseif subset == "C2-decade"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",742,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(201:end,:)=[];
		T(:,13:end)=[];
		varnames={'depth','dust','d18O','F','Cl','SO4',...
			'NO3','Na','NH4','K','Mg','Ca'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'m','Particles (0.63-20μm) Concentration',...
			'‰','ppb','ppb','ppb','ppb','ppb','ppb','ppb','ppb','ppb'};
	elseif subset == "C2-100yr-avg"
		T=readtable(url,"Delimiter"," ","NumHeaderLines",953,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,13:end)=[];
		varnames={'depth','dust','d18O','F','Cl','SO4',...
			'NO3','Na','NH4','K','Mg','Ca'};
		T.Properties.VariableNames=varnames;
		T.Properties.VariableUnits={'m','Particles (0.63-20μm) Concentration',...
			'‰','ppb','ppb','ppb','ppb','ppb','ppb','ppb','ppb','ppb'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% PURUOGANGRI 500 Year Trace Element Data
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "puruogangri-TE"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "raw"
		% Trace Element Data
		url1="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/puruogangri/puruogangri2017elem.txt";
		T1=readtable(url1,"Delimiter","\t","NumHeaderLines",118);
		% Enrichment Factors
		url2="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/puruogangri/puruogangri2017efc.txt";
		T2=readtable(url2,"Delimiter","\t","NumHeaderLines",118);
		% Join tables
		T=innerjoin(T1,T2,"Keys","age_AD");
		T=sortrows(T,"age_AD","descend");
		ageunits='yr AD';
		TEunits=string(repmat('pg/g',8,1));
		EFunits=string(repmat('EF',8,1));
		units=cellstr([ageunits;TEunits;EFunits]);
		T.Properties.VariableUnits=units;
	elseif subset == "5yr-avg"
		%Trace Element Data
		url1="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/puruogangri/puruogangri2017elem5yr.txt";
		T1=readtable(url1,"Delimiter","\t","NumHeaderLines",117);
		% Enrichment Factors
		url2="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/puruogangri/puruogangri2017efc5yr.txt";
		T2=readtable(url2,"Delimiter","\t","NumHeaderLines",119);
		% Join tables
		T=innerjoin(T1,T2,"Keys","age_AD");
		T=sortrows(T,"age_AD","descend");
		ageunits='yr AD';
		TEunits=string(repmat('pg/g',7,1));
		EFunits=string(repmat('EF',7,1));
		units=cellstr([ageunits;TEunits;EFunits]);
		T.Properties.VariableUnits=units;
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% QUELCCAYA (1983) Particles, d18O, and Accumulation
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "quelccaya1983"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "QC1"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/q83cor1.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",32,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T(:,[1,10:end])=[];
		T(1516:end,:)=[];
		T.Properties.VariableNames={'Year','dust_fine',...
			'dust_total','dust_large','conductivity','d18O',...
			'accumulation','accumul_stdev'};
		T.Properties.VariableUnits={'yr','Particles (0.63-0.80um) Concentration',...
			'Particles (>0.63um) Concentration',...
			'Particles (>1.59um) Concentration',...
			'Conductivity','‰','m','m (stdev)'};
	elseif subset == "QS1"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/q83summ.txt";
		% 1984-1000 CE
		T1=readtable(url,"Delimiter"," ","NumHeaderLines",25,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T1(986:end,:)=[];
		T1(:,9:end)=[];
		varnames={...
			'Year',...
			'dust_fine',...
			'dust_total',...
			'dust_large',...
			'conductivity',...
			'd18O',...
			'accumulation',...
			'accumul_stdev'};
		T1.Properties.VariableNames=varnames;
		% 1000-end CE
		T2=readtable(url,"Delimiter"," ","NumHeaderLines",986+25,...
			"ConsecutiveDelimitersRule","join",...
			"ReadVariableNames",false);
		T2(:,[1,10:end])=[];
		T2(257:end,:)=[];
		T2.Properties.VariableNames=varnames;
		% Join tables
		T=[T1;T2];
		T.Properties.VariableUnits={...
			'yr',...
			'Particles (0.63-0.80um) Concentration',...
			'Particles (>0.63um) Concentration',...
			'Particles (>1.59um) Concentration',...
			'Conductivity',...
			'‰',...
			'm',...
			'm (stdev)'};
	elseif subset == "conductivity"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/fieldcon.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",26,...
			"ReadVariableNames",false);
		T(end,:)=[];
		T.Properties.VariableNames={'Year','Core1','SummitCore'};
		T.Properties.VariableUnits={'Year','Conductivity','Conductivity'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% QUELCCAYA 1200 yr TRACE ELEMENT
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "quelccaya-TE"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "5yr-avg"
		% 5yr avg TE concentration
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yravg.txt";
		T1=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T1.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,' ',replacement); % Replace spaces with underscores
		T1.Properties.VariableNames=newvars;
		% 5yr avg enrichment factor (EF) data
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yrefcavg.txt";
		T2=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T2.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,' ',replacement); % Replace spaces with underscores
		T2.Properties.VariableNames=newvars;
		% 5yr avg TE flux
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yravgflux.txt";
		T3=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T3.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,'.',replacement); % Replace periods with underscores
		T3.Properties.VariableNames=newvars;
		% Combine tables
		T=join(T1,T2,'Keys','age_AD');
		T=join(T,T3,'Keys','age_AD');
		% Add units to table
		age_units='yr AD';
		te_units=string(repmat('pg/g',18,1));
		ef_units=string(repmat('EF',18,1));
		flux_units=string(repmat('pg/cm^2/yr',18,1));
		units=cellstr([age_units;te_units;ef_units;flux_units]);
		T.Properties.VariableUnits=units;
	elseif subset == "5yr-median"
		% 5yr median TE concentration
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yrmed.txt";
		T1=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T1.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,' ',replacement); % Replace spaces with underscores
		T1.Properties.VariableNames=newvars;
		% 5yr median EF data
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yrefcmed.txt";
		T2=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T2.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,' ',replacement); % Replace spaces with underscores
		T2.Properties.VariableNames=newvars;
		% 5yr median TE flux
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yrmedflux.txt";
		T3=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T3.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,'.',replacement); % Replace periods with underscores
		T3.Properties.VariableNames=newvars;
		% Combine tables
		T=join(T1,T2,'Keys','age_AD');
		T=join(T,T3,'Keys','age_AD');
		% Add units to table:
		age_units='yr AD';
		te_units=string(repmat('pg/g',18,1));
		ef_units=string(repmat('EF',18,1));
		flux_units=string(repmat('pg/cm^2/yr',18,1));
		units=cellstr([age_units;te_units;ef_units;flux_units]);
		T.Properties.VariableUnits=units;
	elseif subset == "EF-seasonal"
		% Dry Season
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yrefcdry.txt";
		T1=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T1.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,' ',replacement); % Replace spaces with underscores
		T1.Properties.VariableNames=newvars;
		% Wet Season
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2015elem5yrefcwet.txt";
		T2=readtable(url,"Delimiter","\t","NumHeaderLines",123,...
			"VariableNamingRule","preserve");
		vars=T2.Properties.VariableNames;
		replacement="_";
		newvars=strrep(vars,' ',replacement); % Replace spaces with underscores
		T2.Properties.VariableNames=newvars;
		% Combine tables
		T=join(T1,T2,'Keys','age_AD');
		dryseason_replacement="cDry";
		wetseason_replacement="cWet";
		vars=T.Properties.VariableNames;
		newvars=strrep(vars,'cD',dryseason_replacement); % Replace 'cD' with 'cDry'
		newvars=strrep(newvars,'cW',wetseason_replacement); % Replace 'cW' with 'cWet'
		T.Properties.VariableNames=newvars;
		% Add units to table
		age_units='yr AD';
		ef_units=string(repmat('EF',36,1));
		units=cellstr([age_units;ef_units]);
		T.Properties.VariableUnits=units;
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% QUELCCAYA 1800 yr d18O, dust, major ions, and accumulation
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "quelccaya2003"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "QND"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2013nd-decadal.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",116);
		T.Properties.VariableUnits={'First thermal yr of decade',...
			'Last thermal year of decade',...
			'‰','m w.e.'};
	elseif subset == "QSD-annual"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2013.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",117,...
			"VariableNamingRule","preserve");
		vars=T.Properties.VariableNames;
		v3='iccacc_m';
		v4='dust';
		vars{3}=v3; % Fix variable 3
		vars_extract=vars(4:12);
		vars(5:end)=vars_extract; % Fix variables 5:13
		vars{4}=v4; % Fix variable 4
		T.Properties.VariableNames=vars; % Rename table variables
		% Add units to table
		age_units='yr AD';
		d18_units='‰';
		acc_units='m w.e.';
		dust_units='Particles (0.63-20um) per mL';
		ions_units=string(repmat('ppb',9,1));
		units = cellstr([...
			age_units;...
			d18_units;acc_units;...
			dust_units;...
			ions_units]);
		T.Properties.VariableUnits=units;
	elseif subset == "QSD-decade"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2013sd-decadal.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",117,...
			"VariableNamingRule","preserve");
		vars=T.Properties.VariableNames;
		v4='iceacc_m';
		v5='dust';
		vars{4}=v4; % Fix variable 4
		vars_extract=vars(5:13);
		vars(6:end)=vars_extract; % Fix variables 6:14
		vars{5}=v5; % Fix variable 5
		T.Properties.VariableNames=vars; % Rename table variables
		% Add units to table:
		u1 = 'First thermal year of decade';
		u2 = 'Last thermal year of decade';
		uD18='‰';
		uAcc='m w.e.';
		uDust='Particles (0.63-20um) per mL';
		uIons=string(repmat('ppb',9,1));
		units=cellstr([u1;u2;uD18;uAcc;uDust;uIons]);
		T.Properties.VariableUnits=units;
	elseif subset == "QSD-ALT"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2013layer-thickness.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",105,...
			"VariableNamingRule","preserve");
		T.Properties.VariableUnits={'yr AD','m'};
	elseif subset == "NINO4sst"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/quelccaya/quelccaya2013nino4sst.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",105,...
			"VariableNamingRule","preserve");
		T.Properties.VariableUnits={...
			'First thermal year of decade',...
			'Last thermal year of decade',...
			'NINO4 SST (°C)'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% SAJAMA d18O, ion, particle, and accumulation
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "sajama"
	if nargin < 2 || isempty(subset)
		error("Must include a second input for the data subset.")
	elseif class(subset) ~= "string"
		error("Subset must be given as a string.")
	elseif subset == "C1-100yr-avg"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/sajama/sc1-100a.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",178,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		T(end,:)=[];
		T(:,1)=[];
		vars={'age','d18O','dust','Cl','NO3','SO4'};
		T.Properties.VariableNames=vars;
		T.Properties.VariableUnits={'ka b1950','‰',...
			'Particles >0.63um (x10^5)','ppm','ppm','ppm'};
	elseif subset == "C1-accumulation"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/sajama/sc1-acc.txt";
		T=readtable(url,"Delimiter"," ","NumHeaderLines",175,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		T(end,:)=[];
		T(:,1)=[];
		T.Properties.VariableNames={'age','accumulation'};
		T.Properties.VariableUnits={'ka BP','m (stdev)'};
	elseif subset == "sample-avg"
		url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/sajama/sc12-5m.txt";
		T0=readtable(url,"Delimiter"," ","NumHeaderLines",176,...
			"ReadVariableNames",false,...
			"ConsecutiveDelimitersRule","join");
		vars={'depth','C1_dust','C1_d18O','C1_Cl','C1_NO3','C1_SO4','C2_d18O'};
		%%% Fix table by splitting into two and then rejoining after corrections
		% First 25 rows
		T1=T0(1:25,:);
		T1(:,1)=[];
		T1.Properties.VariableNames=vars;
		% Rows 26 through end-1 (last row contains NaNs)
		T2=T0(26:end-1,:);
		T2(:,end)=[];
		T2.Properties.VariableNames=vars;
		% Join tables
		T=[T1;T2];
		% Fix last element of C1_dust>0.63 and C2_d18O (values swapped)
		replacement=T{end,2};
		T{end,2}=NaN;
		T.C2_d18O(end)=replacement;
		% Add units to table
		T.Properties.VariableUnits={...
			'm','Particles >0.63um (x10^5)','‰','ppm','ppm','ppm','‰'};
	else
		error("Subset not understood. Make sure the subset is spelled correctly and written as a string.")
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% SIPLE STATION 550 yr OXYGEN ISOTOPE DATA
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "siple-station"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/antarctica/siple/siple1990d18o.txt";
	T=readtable(url,"Delimiter","\t","NumHeaderLines",98);
	T.Properties.VariableUnits={'yr CE','‰'};

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% WINDY DOME, FRANZ JOSEF LAND 850 yr D18O and MELT DATA
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif dataset == "windy-dome"
	url="https://www.ncei.noaa.gov/pub/data/paleo/icecore/polar/franzjosef/windydome2011d18o.txt";
		T=readtable(url,"Delimiter","\t","NumHeaderLines",104);
		vars={'age_CE','d18O','melt_percent'};
		T.Properties.VariableNames=vars;
		T.Properties.VariableUnits={'yr CE','‰','%'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IF FIRST INPUT ARGUMENT IS SPELLED INCORRECTLY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
	error("Invalid data set. Make sure the data set name is spelled correctly and written as a string.")
end

end
