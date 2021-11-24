1. ensure python3 is installed
2. install requirements 

- `python3 -m pip install -r ./requirements.txt`
3. set up sol c compiler 

- `solc-select install 0.8.7`
- `solc-select use 0.8.7`
4. ensure echidna works by running it on a lab

- `./linux/echidna-test ./lab1.sol` for linux
- `./mac/echidna-test ./lab1.sol` for macOS
