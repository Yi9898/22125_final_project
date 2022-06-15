#! /bin/tcsh -f

## Define path to your code directory
set RDIR = /Users/yi/Documents/DTU/2022Spring/Algo_in_bioinfo/Project/22125_final_project/scripts

## Define path you where you have placed the HLA data sets
set DDIR = /Users/yi/Documents/DTU/2022Spring/Algo_in_bioinfo/Project/22125_final_project/data

# Here you can type your allele names
foreach a ( B3501 )


mkdir -p $a.fake

cd $a.fake

# Here you can type the lambdas to test
# foreach l ( 0 0.02 )

# mkdir -p l.$l

# cd l.$l

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

# Do concatinated evaluation
echo $a `cat c00?.pred | grep -v "#" | gawk '{print $2,$3}' | ../xycorr` \
`cat c00?.pred | grep -v "#" | gawk '{print $2,$3}' | gawk 'BEGIN{n+0; e=0.0}{n++; e += ($1-$2)*($1-$2)}END{print e/n}' `

cd ..

end

# cd ..

# end
