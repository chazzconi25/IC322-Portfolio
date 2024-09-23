# How to set up SSH keys for GitHub / Gitlab / Gitlab USNA

## Forward - Please Read

There are three different websites we use for repository storage at USNA because this school is really dumb. Even dumber is that they all have very similar names. The three sites are [Github](https://github.com/), [Gitlab](https://gitlab.com/), and [Gitlab USNA](https://gitlab.usna.edu/). If you want more explanation on why this is like this you can ask me but all you need to understand for this guide is that these are three completely independent sites. In order to clone via SSH from any of the three you will need an account **ON EACH WEBSITE INDIVIDUALLY** and an SSH key set up for that account.

## Windows Machine

1. On your local machine open up **powershell** in admin mode. Powershell is like command prompt but you can use some linux commands. You can open it by clicking the windows start menu button and typing "Powershell" in the search bar.

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

4. Print out your public key with this command (replace m25XXXX with your alpha)

```powershell
cat C:\Users\m25XXXX\.ssh\id_ed25519.pub
```

The output should look something like this:

```powershell
PS C:\Users\m25XXXX> cat C:\Users\m25XXXX\.ssh\id_ed25519.pub
ssh-ed25519 SomeRandomStringOfNumbersAndLettersHere academy\m25XXXX@WK5CG1234B34MID
```

5. Copy the **entire** line (this is called your SSH public key) that came out of that command, starting with ```ssh-ed25519```

## Add Public key to Github


## Add Public key to Gitlab

1. First log into [Gitlab](https://gitlab.com/). If you have a USNA Gitlab account it will not work for Gitlab because life is hell. You will need a Gitlab account even if you have a USNA gitlab account because sometimes people put things on either as a practical joke and if you don't have both set up you will be screwed.
2. Click on your disguising profile photo and click "Preferences". ![Gitlab](/img/gitlab_user_prefrences.png)
3. Click SSH Keys on the left side bar. ![Gitlab](/img/gitlab_user_prefrences.png)
4. Click "Add new key". ![Gitlab](/img/gitlab_ssh_keys_page.png)
5. Paste your SSH public key in the box that says "Key" and click the blue "Add key button"![Gitlab](/img/gitlab_add_key.png)
6. After that you're set and you should be able to clone repos from Gitlab using ``git clone`` and then pasting in the **SSH** link from the clone menu on Gitlab.

## Add Public key to Gitlab USNA

Turns out its basically the exact same as adding a public key to Gitlab so just follow all those steps but instead start by logging into [Gitlab USNA](https://gitlab.usna.edu/).

## Trouble shooting

Still not working? Just text me 6502559482. Or you can leave an issue on this Github repo but ngl if you're reading this guide thats probably way over your head (I do appreciate you being here though!). I don't care enough to write a troubleshooting section.
