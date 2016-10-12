local_dir=$(config local_dir)
export url=$(config url)
export project=$(config project)

echo url: $url
echo local_dir: $local_dir

cd $local_dir

find $local_dir -maxdepth 1 -mindepth 1 -type d -execdir perl -MFile::Basename \
-e '
my $p = basename(@ARGV[0]); 
my $wd = $ARGV[1]; 
my $project = $ENV{project};
my $url = $ENV{url};

if ($project){
  exit unless $p eq $project;
}

print "cd $wd/$p && ( git pull $url/$p.git && \\
git push --set-upstream $url/$p.git master -q ",
" || echo $p -- failed ) & \n"' {} $local_dir \; | bash && echo git-async-push-done
