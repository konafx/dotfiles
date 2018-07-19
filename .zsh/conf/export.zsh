# export.zsh

# 言語設定
export LANG=ja_JP.UTF-8

# 環境変数
export PATH=${HOME}/local/bin:${HOME}/.local/bin:${PATH}

# 研究
export PYENV_ROOT="$HOME/.pyenv"
export CPATH="$CUDA_HOME/include"
export CUDA_ROOT=/usr/local/cuda-9.1
export CUDA_HOME=/usr/local/cuda-9.1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/targets/x86_64-linux/lib
export PATH="$PYENV_ROOT/bin:$CUDA_HOME/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"
source /home/lab/kon/.pyenv/versions/anaconda3-5.1.0/etc/profile.d/conda.sh
alias activate="source $PYENV_ROOT/versions/anaconda3-5.1.0/bin/activate"
export TF_BINARY_URL_PY36=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.6.0-cp36-cp36m-linux_x86_64.whl
