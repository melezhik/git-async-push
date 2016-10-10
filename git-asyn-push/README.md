# SYNOPSIS

Make a asynchronous push to remote git repositories.


# INSTALL

    sparrow plg install git-async-push


# USAGE

    sparrow plg run git-async-push --param url=https://github.com/melezhik \
    --param local_dir=/path/to/chef/cookbooks/repository


# Parameters

## url

This should be a remote git repository URL _representing_ a realm of your multiple repositories.

For example, if you use BitBucket, this could be a `team` conatiner:

    --param url=https://bitbucket.org/my-cool-team

## local_dir

This should be a local path to a directory containing local repositories to gets pushed.

An example layout should be:

    # foo repository
    foo/ ---> $url/foo.git
    # baz repository
    baz/ ---> $url/baz.git


    so on ...

So the convention is that the name of directory to contain source does should _match the name of
remote repository_.

A plugin goes through the list of repositories and asynchronously push data into a remote git servers.
An asynchronous behavior is implimented by simple Linux background process using `&`.  

# Author

Alexey Melezhik

