#! /bin/tcsh -f

## Define path to your code directory
set RDIR = /Users/yi/Documents/DTU/2022Spring/Algo_in_bioinfo/Project/22125_final_project/scripts

## Define path you where you have placed the HLA data sets
set DDIR = /Users/yi/Documents/DTU/2022Spring/Algo_in_bioinfo/Project/22125_final_project/data

# Here you can type your allele names
foreach a ( A0202 A0203 A0301 A6801 A3101 A6802 B0702 A3301 B1501 B5301 B5801 A0101 A2402 A6901 B5101 B5401 A3001 A2902 B2705 A2601 A2301 B4501 B1801 B4402 B4001 B4002 B4403 A3002 B0801 B5701 )


mkdir -p $a.fake

cd $a.fake


# Loop over the 5 cross validation configurations
foreach n ( 0 1 2 3 4 )


# Do training
if ( ! -e out.$n ) then
    python $RDIR/ANN_train.py -bl -nh 5 -syn syn.$n -t $DDIR/$a/fakeCV/f00$n -e $DDIR/$a/fakeCV/c00$n -stop | grep -v "#" > out.$n
endif

# Do evaluation
if ( ! -e c00$n.pred ) then
    python $RDIR/ANN_forward.py -bl -syn syn.$n -e $DDIR/$a/fakeCV/c00$n | grep -v "#" > c00$n.pred
endif

end

# # Do concatinated evaluation
# echo $a `cat c00?.pred | grep -v "#" | gawk '{print $2,$3}' | ../xycorr` \
# `cat c00?.pred | grep -v "#" | gawk '{print $2,$3}' | gawk 'BEGIN{n+0; e=0.0}{n++; e += ($1-$2)*($1-$2)}END{print e/n}' `

cd ..

end

# cd ..

# end
