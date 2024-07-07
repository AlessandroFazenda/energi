# Step 5:

*Script grown-ups*: Solve the problem in question 4 using any programming language of your choice.

# The problem:
- Perform the following commands in python:
`sha256sum energi3-$VERSION-linux-amd64.tgz | awk {'print $1'}`
`grep energi3-$VERSION-linux-amd64.tgz SHA256SUMS | awk {'print $1'}`

# How the python script works:
- Get the SHA256 checksum from the given file
- Extract the checksum from the file with all checksum
- Compare if the checksums are the same

# Important note:
- The python file must be in same directory as the file to be checked and the file with the checksums
- TODO: use args to pass filenames

# References:
- https://gist.github.com/pjaudiomv/91729e20ce8846ef08a5b322f55a2d48