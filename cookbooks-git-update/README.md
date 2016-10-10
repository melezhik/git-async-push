# SYNOPSIS

Make a bulk upload of chef cookbooks source code into Git


# INSTALL

    sparrow plg install cookbook-git-update


# USAGE

    sparrow plg run cookbook-git-update --param url=https://bitbucket.org/nibrdevops/ \
    --param local_dir=/path/to/chef/cookbooks/repository


# Parameters

## url

This should be bitbucket URL representing a team to hold a project where cookbooks git repository belongs to

## local_dir

This should be a local path to a directory containing a cookbooks, every cookbook should be named
as the directory where a cookbooks source resides at. And example layout should be:

    # foo cookbook
    foo/ ---> $url/foo.git
    # baz cookbook
    baz/ ---> $url/baz.git


    so on ...


