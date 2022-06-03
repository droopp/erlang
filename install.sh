#
# Install erlang from official github repo
#

set -e

# Install deps

is_u="$(awk -F= '/^NAME/{print $2}' /etc/os-release | grep Ubuntu | wc -l)"
if [[ "$is_u" -eq "1" ]]; then
    apt-get install -y libncurses5-dev libncursesw5-dev
else
    yum install -y ncurses-devel
fi

# Build from source

git clone https://github.com/erlang/otp.git
cd ./otp
git checkout maint-25

./configure --prefix=/opt/erlang

make 
make install
