local_dir=$(config local_dir)
export url=$(config url)
cd $local_dir
find -maxdepth 2 -mindepth 2 -name metadata.rb \
-execdir perl6 -e 'say "cd " ~ $*CWD.basename 
~ " ; (git  push --set-upstream %*ENV<url>/" 
~ $*CWD.basename ~ " master  -q  || echo " 
~ $*CWD.basename  ~ " --- failed ) &  cd ../ " ' \; | bash  && echo ok
