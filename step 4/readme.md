# Step 4:

*Script kiddies*: Source or come up with a text manipulation problem and solve it with at least two of awk, sed, tr. and / or grep. Check the question below first though, maybe.

# How I did it:
- In step 1, I used `awk` and `grep` to verify if provided checksum:
`sha256sum energi3-$VERSION-linux-amd64.tgz | awk {'print $1'}`
`grep energi3-$VERSION-linux-amd64.tgz SHA256SUMS | awk {'print $1'}`
- I could not find any other way to use multiple of these commands or even manipulation and substitution like `sed` and `tr`.
