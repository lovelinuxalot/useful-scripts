# Inserts directories from a specified start year to an end year and 12 months in each year for each month

$RootLocation = $PWD


$StartYear = 2022
$EndYear = 2023
$Months = @('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')                                                                                                                                          

foreach($Year in @($StartYear..$EndYear))
{
    mkdir $Year
    set-location $PWD/$Year
    foreach($Month in $Months)
    {
		$currentMonth = [array]::IndexOf($Months, $Month) + 1 | % tostring 00
        mkdir "$currentMonth-$Month"
		foreach ( $day in @(1..[datetime]::DaysInMonth($Year, $currentMonth)))
	    {
		    $day_string = $day | % tostring 00
		    echo "# $day_string-$currentMonth-$Year" > "$currentMonth-$Month/$day_string-$currentMonth-$Year.md"
	    }
		
		
    }
    set-location $RootLocation
}
