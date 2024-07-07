import hashlib

# Get SHA256 hash - https://gist.github.com/pjaudiomv/91729e20ce8846ef08a5b322f55a2d48
def get_hash(file):
    sha256_hash = hashlib.sha256()
    with open(file, "rb") as f:
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()

# Get the expected checksum
# file struct: <checksum> <filename>
def get_checksum(file, checksum_file):
    with open(checksum_file, "r") as f:
        for line in f:
            if file in line:
                return line.split()[0]
    return None

# Define filenames
filename = 'energi3-v1.1.7-linux-amd64.tgz'
checksum_file = 'SHA256SUMS'

# Compute the sha256 checksum of the file
computed_checksum = get_hash(filename)
print(f"Computed Checksum: {computed_checksum}")

# Extract the expected checksum from the SHA256SUMS file
expected_checksum = get_checksum(filename, checksum_file)
print(f"Expected Checksum: {expected_checksum}")

# Verify if the checksums match
if computed_checksum == expected_checksum:
    print("Checksum verification passed!")
else:
    print("Checksum verification failed!")

