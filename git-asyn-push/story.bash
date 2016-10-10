local_dir=$(config local_dir)
export url=$(config url)


cd $local_dir

echo url: $url
echo local_dir: $local_dir
echo pwd: `pwd`


find -maxdepth 1 -mindepth 1 -type d \
-execdir perl6 -e 'say "cd " ~ $*CWD.basename 
~ " ; (git  push --set-upstream %*ENV<url>/" 
~ $*CWD.basename ~ " master  -q  || echo " 
~ $*CWD.basename  ~ " --- failed ) &  cd ../ " ' \; | bash  && echo git-async-push-done
