# How to ssh into vscode without entering your password 1million times

## Windows Machine

1. On your local machine open up powershell in admin mode. Powershell is like command prompt but you can use linux commands. You can open it by clicking the windows start menu button and typing "Powershell" in the search bar.

2. Type the following command into powershell:

```powershell
ssh-keygen -t ed25519
```

3. Once you hit enter it will prompt you for a passphrase and name, do not worry about changing these, just hit enter a few times. The output should look like this:

```powershell
PS C:\Users\m25XXXX> ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (C:\Users\m25XXXX/.ssh/id_ed25519):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in id_ed25519.
Your public key has been saved in id_ed25519.pub.
The key fingerprint is:
SHA256:W0713e/6aE/SomeRandomStringOfNumbersAndLettersHere academy\m25XXXX@WK5CG1234B34MID
The key's randomart image is:
+--[ED25519 256]--+
|         .*%&o o |
|          +X+*+ .|
|         + .B..= |
|      . o .. .=.o|
|       oS o  o. +|
|         =    E.o|
|        . .   o =|
|              .O |
|             .o+*|
+----[SHA256]-----+
```

4. Print out your public key with this command

```powershell
cat C:\Users\m251806\.ssh\id_ed25519.pub
```

The output should look something like this:

```powershell
PS C:\Users\m25XXXX> cat C:\Users\m25XXXX\.ssh\id_ed25519.pub
ssh-ed25519 SomeRandomStringOfNumbersAndLettersHere academy\m25XXXX@WK5CG1234B34MID
```

5. Copy the entire line that came out of that command that starts with ```ssh-ed25519```

## VSCode SSH

1. SSH into the lab machiene in VSCode like you normally would

2. Open the terminal in vscode once you are sshd into the lab machine

3. Paste the line copied from powershell into the following command as shown below:

```terminal
echo "ssh-ed25519 SomeRandomStringOfNumbersAndLettersHere academy\m25XXXX@WK5CG1234B34MID" >> ~/.ssh/authorized_keys
```

4. Exit VSCode.

5. Now you should be able to ssh without typing in your password a bazillion times!

## Trouble shooting

Still not working? Just text me 6502559482. I don't care enough to write a troubleshooting section
