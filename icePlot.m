function fig = icePlot(x,y,parameter_as_string)
%ICEPLOT Creates a 2-dimensional plot of ice core
%   data which can be modified in the same way as
%	the plot() function. Specify a third input
%	to automatically label the y-axis of the plot,
%	given that the input matches one of the built-
%	in inputs.
%
%{
=================================
Acceptable third input arguments:
=================================
| PARAMETER | STRING | ASSUMED UNITS |
|===========|========|===============|
| oxygen    |	     |               |
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
NOTE:
The units that are used to label the y-axis are
a default assumption based on the parameter
chosen. Check the original metadata for the data
if you are unsure if the default units are correct.
If so, you can easily modify the y-axis label by
calling the ylabel() function. For example:
>> icePlot(xData,yData,'NO3');
>> ylabel('ppm') % Change ylabel from 'ppb' to 'ppm'
======================================
%}

%%%%%%%%%%%%%
% BEGIN CODE
%%%%%%%%%%%%%

% Font name for plotting
myfont = 'Lucida Sans Typewriter';
% Line width for plotting
lw = 1;

% If no third input argument is given:
if nargin == 2
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off

% If third input argument is specified:
%%%%%%%%%%%%%%%%%%%%%%%%%
% Oxygen stable isotopes
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "d18O" || parameter_as_string == "d18o"
	fig = plot(x,y,'LineWidth',1);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('‰','FontName','Segoe UI')
	fig.Color='#0343df'; % Blue
	L=legend('δ^{18}O','Location','eastoutside');
	L.Title.String="Legend";

%%%%%%%%%%%%%%%%%%%%%%%%%
% Deuterium excess
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "dxs"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('‰')
	fig.Color='#00035b'; % Dark blue
	L=legend('{\itd}-excess','Location','eastoutside');
	L.Title.String="Legend";
	
%%%%%%%%%%%%%%%%%%%%%%%%%
% Nitrate (NO3-)
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "no3" || parameter_as_string == "NO3"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('ppb')
	fig.Color='#15b01a'; % Green
	L=legend('NO_3^-','Location','eastoutside');
	L.Title.String="Legend";

%%%%%%%%%%%%%%%%%%%%%%%%%
% Ammonium (NH4+)
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "nh4" || parameter_as_string == "NH4"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('ppb')
	fig.Color='#6e750e'; % Olive green
	L=legend('NH_4^+','Location','eastoutside');
	L.Title.String="Legend";

%%%%%%%%%%%%%%%%%%%%%%%%%
% Black Carbon 
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "blackcarbon" || parameter_as_string == "bc" || parameter_as_string == "BC"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('pg/g')
	fig.Color='#000000'; % Black
	L=legend('Black Carbon','Location','eastoutside');
	L.Title.String="Legend";

%%%%%%%%%%%%%%%%%%%%%%%%%
% Sulfate (SO4--)
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "so4" || parameter_as_string == "SO4"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('ppb')
	fig.Color='#8e82fe'; % Periwinkle
	L=legend('SO_4^{2-}','Location','eastoutside');
	L.Title.String="Legend";

%%%%%%%%%%%%%%%%%%%%%%%%%
% Chloride (Cl-)
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "Cl" || parameter_as_string == "chloride" || parameter_as_string == "cl"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('ppb')
	fig.Color='#929591'; % Gr(e/a)y
	L=legend('Cl^-','Location','eastoutside');
	L.Title.String="Legend";

%%%%%%%%%%%%%%%%%%%%%%%%%
% Total dust
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "dust"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('Counts \cdot mL^{-1}')
	fig.Color='#653700'; % Brown
	L=legend('Dust','Location','eastoutside');
	L.Title.String="Legend";

%%%%%%%%%%%%%%%%%%%%%%%%%
% Accumulation
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "accumulation" || parameter_as_string == "acc"
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('m i.e.')
	fig.Color='#cf6275'; % Rose pink
	L=legend('Accumulation','Location','eastoutside');
	L.Title.String="Legend";

else
	error('ERROR: Something went wrong.')
end

end