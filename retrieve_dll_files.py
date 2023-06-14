import platform
import subprocess
import sys

def is_git_lfs_installed():
    try:
        subprocess.check_output(["git", "lfs", "version"])
        return True
    except FileNotFoundError:
        return False



def install_git_lfs():
    system = platform.system()
    match system :
        case "Windows":
            subprocess.call(["choco", "install", "git-lfs"])
        case "Darwin":
            subprocess.call(["brew", "install", "git-lfs"])
        case "Linux":
            subprocess.call(["sudo", "apt-get", "install", "git-lfs"])
        case _:
            print("Unsupported operating system.")
            sys.exit(1)


def retrieve_dll():
    system = platform.system()
    match system :
        case "Windows":
            subprocess.call(["git", "lfs", "install"])
            subprocess.call(["git", "lfs", "fetch"])
            subprocess.call(["git", "lfs", "checkout", "*.dll"])
        case "Darwin":
            print("mac")    #Mac OS
        case "Linux":
                print("Linux")
        case _:
            print("Unsupported operating system.")
            sys.exit(1)




print(is_git_lfs_installed())


if(is_git_lfs_installed):
    install_git_lfs()
    retrieve_dll()

