# TOKEN=$1  # Directly set from outside
REPO_HOME=https://raw.githubusercontent.com/yuneg11/Cloud-TPU-Setup/master/
TPU_NAME=$(curl -s -H 'Metadata-Flavor: Google' -X GET http://metadata.google.internal/computeMetadata/v1/instance/description)
HOSTNAME=${TPU_NAME^^}

cd $HOME

# Python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 9


# ZSH

## ZSH setup
sudo apt update
sudo apt install zsh -y

## Oh-My-Zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions         ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions             ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git   ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## Change default shell
sudo sed -i "s/\/home\/$USER:\/bin\/bash/\/home\/$USER:\/bin\/zsh/g" /etc/passwd


# Dotfiles
wget --header="Authorization: token $TOKEN" $REPO_HOME/.zshrc     -O $HOME/.zshrc
wget --header="Authorization: token $TOKEN" $REPO_HOME/.p10k.zsh  -O $HOME/.p10k.zsh
wget --header="Authorization: token $TOKEN" $REPO_HOME/.tmux.conf -O $HOME/.tmux.conf
wget --header="Authorization: token $TOKEN" $REPO_HOME/.gitignore -O $HOME/.gitignore
wget --header="Authorization: token $TOKEN" $REPO_HOME/.gitconfig  -O $HOME/.gitconfig
touch $HOME/.hushlogin

sudo rm -rm /etc/hostname
echo "$HOSTNAME" | sudo tee /etc/hostname
sudo hostnamectl set-hostname $HOSTNAME

sed -i "s/TPU_NAME=/TPU_NAME=\"$HOSTNAME\"/g" $HOME/.zshrc

# Timezone
sudo timedatectl set-timezone 'Asia/Seoul'
