1. ensure python3 is installed
2. install requirements 

- `python3 -m pip install -r ./requirements.txt`
3. Try using the `solc-select` command

- If `solc-select` doesn't show up you must add your `~/.local/bin` to your $PATH
- `echo "export PATH=\$PATH:/home/$(whoami)/.local/bin" >> ~/.bashrc`
- `source ~/.bashrc`
3. set up sol c compiler 

- `solc-select install 0.7.6`
- `solc-select use 0.7.6`
4. ensure echidna works by running it on a lab

- `./linux/echidna-test ./lab1.sol` for linux
- `./mac/echidna-test ./lab1.sol` for macOS
