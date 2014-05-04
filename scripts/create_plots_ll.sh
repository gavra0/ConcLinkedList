#!/bin/sh

app_all="ll";

dat_folder="./data";
gp_folder="./gp";
out_folder="./plots"
gp_template="./scripts/lock-free.gp";

[ -d "$gp_folder" ] || mkdir $gp_folder;
[ -d "$out_folder" ] || mkdir $out_folder;

rm $gp_folder/* >> /dev/null;
rm $out_folder/* >> /dev/null;

initial_all="128 1024 8192";
update_all="0 10 50";

for update in $update_all
do
    echo "* Update: $update";
    for initial in $initial_all
    do
	echo "** Size: $initial";

	for app in $app_all
	do
	    printf "*** Application: $app\n";

	    dat="$dat_folder/$app.i$initial.u$update.dat";
	    gp="$gp_folder/$app.i$initial.u$update.gp";
	    eps="$out_folder/$app.i$initial.u$update.eps";
	    title="Lock-free vs. lock-based $app / Size: $initial / Update: $update";

	    cp $gp_template $gp

	    if [ "$app" = "ll" ];
	    then
		cat << EOF >> $gp
set title "$title"; 
set output "$eps";
plot \\
"$dat" using 1:(\$2) title  "lb - Througput" ls 2 with lines, \\
"$dat" using 1:(\$4) axis x1y2 title  "lb - Scalability" ls 1 with points, \\
"$dat" using 1:(\$5) title  "lf - Througput" ls 4 with lines, \\
"$dat" using 1:(\$7) axis x1y2 title  "lf - Scalability" ls 3 with points
EOF
	    fi;

	    gnuplot $gp;
	done;
    done;
done;


