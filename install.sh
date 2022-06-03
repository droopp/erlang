#
# Install erlang from official github repo
#

set -e

is_u="$(awk -F= '/^NAME/{print $2}' /etc/os-release | grep Ubuntu | wc -l)"
if [[ "$is_u" -eq "0" ]]; then
    yum install -y ncurses-devel
else
    apt-get install -y libncurses5-dev libncursesw5-dev
fi

git clone https://github.com/erlang/otp.git
cd ./otp
git checkout maint-25

./configure --prefix=/opt/erlang

make 
make install
