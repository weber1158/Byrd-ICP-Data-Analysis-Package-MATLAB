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
| oxygen	|		 |               |
| stable	| 'd18O' |   permil (‰)  |
| isotopes	|        |               |
|-----------|--------|===============|
| deuterium	| 'dxs'  |   permil (‰)  |
| excess    |		 |               |
|-----------|--------|===============|
| nitrate   | 'no3'  |      ppb      |
|-----------|--------|===============|
| sulfate   | 'so4'  |      ppb      |
|-----------|--------|===============|
| chloride  | 'Cl'   |      ppb      |
|-----------|--------|===============|
| total     | 'dust' |   counts/mL   |
| dust      |        |               |
|-----------|--------|===============|
| accumula-	| 'acc'  |   m ice eq.   |
| ation		|		 |               |
|-----------|--------|===============|
======================================
NOTE:
The units that are used to label the y-axis are
a default assumption based on the parameter
chosen. Check the original metadata for the data
if you are unsure if the default units are correct.
======================================
%}

%%%%%%%%%%%%%
% BEGIN CODE
%%%%%%%%%%%%%

myfont = 'Lucida Sans Typewriter';
lw = 1;

if nargin == 2
	fig = plot(x,y,'LineWidth',lw);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off

%%%%%%%%%%%%%%%%%%%%%%%%%
% Oxygen stable isotopes
%%%%%%%%%%%%%%%%%%%%%%%%%
elseif parameter_as_string == "d18O"
	fig = plot(x,y,'LineWidth',1);
	set(gca,...
		'YGrid','on',...
		'TickDir','out',...
		'FontName',myfont)
	box off
	ylabel('‰')
	fig.Color=rgb('blue');
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
	fig.Color=rgb('dark blue');
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
	fig.Color=rgb('green');
	L=legend('NO_3^-','Location','eastoutside');
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
	fig.Color=rgb('periwinkle');
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
	fig.Color=rgb('grey');
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
	fig.Color=rgb('brown');
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
	fig.Color=rgb('rose');
	L=legend('Accumulation','Location','eastoutside');
	L.Title.String="Legend";

else
	error('ERROR: Something went wrong.')
end

end