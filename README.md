# test-versioneer
Test versioneer in sub-directories


Run `./test.sh`

For the top-level directory, it will display a version number generated from the
Git repo SHA.

For the sub-directory, it will display the same version number.

Compare the repo with the previously broken version, using
```
$ git diff 1fa2aa547368ce6a63bc3ef49ba8e2f2a1359b39
```