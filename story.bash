local_dir=$(config local_dir)
export git_remote=$(config git_remote)
export project=$(config project)

echo git_remote: $git_remote
echo local_dir: $local_dir

cd $local_dir

find $local_dir -maxdepth 1 -mindepth 1 -type d -execdir perl -MFile::Basename \
-e '
my $p = basename(@ARGV[0]); 
my $wd = $ARGV[1]; 
my $project = $ENV{project};
my $git_remote = $ENV{git_remote};

if ($project){
  exit unless $p eq $project;
}

exit unless -d "$wd/$p/.git/";

print "(cd $wd/$p && git pull $git_remote/$p.git -q >/dev/null; \\
git push --set-upstream $git_remote/$p.git master  -q > /dev/null && echo $git_remote/$p.git updated",
" || echo $p -- failed ) & \n"' {} $local_dir \; | bash && echo git-async-push-done
wait


