#! /bin/tcsh -f

## Define path to your code directory
set RDIR = /Users/yi/Documents/DTU/2022Spring/Algo_in_bioinfo/Project/22125_final_project/scripts

## Define path you where you have placed the HLA data sets
set DDIR = /Users/yi/Documents/DTU/2022Spring/Algo_in_bioinfo/Project/22125_final_project/data

# Here you can type your allele names
foreach a ( A0201 A0206 A1101 A2403 B3501 )


mkdir -p $a.fake

cd $a.fake

# Here you can type the lambdas to test
# foreach l ( 0 0.02 )

# mkdir -p l.$l

# cd l.$l

# Loop over the 5 cross validation configurations
foreach n ( 0 1 2 3 4 )


# Do training
if ( ! -e mat.$n ) then
    python $RDIR/smm_gradient_descent.py -t $DDIR/$a/fakeCV/f00$n -e $DDIR/$a/fakeCV/c00$n | grep -v "#" > mat.$n
endif

# Do evaluation
if ( ! -e c00$n.pred ) thenc
    python $RDIR/pep2score.py -mat mat.$n -f $DDIR/$a/fakeCV/c00$n | grep -v "PCC:" > c00$n.pred
endif

end

# # Do concatinated evaluation
# echo $a `cat c00?.pred | grep -v "#" | gawk '{print $2,$3}' | ../xycorr` \
# `cat c00?.pred | grep -v "#" | gawk '{print $2,$3}' | gawk 'BEGIN{n+0; e=0.0}{n++; e += ($1-$2)*($1-$2)}END{print e/n}' `

cd ..

end

# cd ..

# end
