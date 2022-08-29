# TOKEN=$1  # Directly set from outside
REPO_HOME=https://raw.githubusercontent.com/yuneg11/Cloud-TPU-Setup/master/

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

# sed -i "s/TPU_NAME=/TPU_NAME=\"$TPU_NAME\"/g" $HOME/.zshrc


# PyTorch (Specify TPU version instead)
# sudo bash /var/scripts/docker-login.sh
# sudo docker rm libtpu || true
# sudo docker create --name libtpu gcr.io/cloud-tpu-v2-images/libtpu:pytorch-1.9 "/bin/bash"
# sudo docker cp libtpu:libtpu.so /lib
# sudo pip3 uninstall --yes torch torch_xla torchvision
# sudo pip3 install torch==1.12
# sudo pip3 install torchvision==0.13
# sudo pip3 install https://storage.googleapis.com/tpu-pytorch/wheels/tpuvm/torch_xla-1.12-cp38-cp38-linux_x86_64.whl
