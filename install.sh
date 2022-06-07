#
# Install erlang from official github repo
#

set -e

# Install deps

distrib="$(awk -F= '/^NAME/{print $2}' /etc/os-release)"
echo $distrib                                                                        

if [[ "$distrib" == *"Ubuntu"* ]]; then
    apt-get install -y libncurses5-dev libncursesw5-dev

elif [[ "$distrib" == *"CentOS"* ]]; then
    yum install -y ncurses-devel
else
    echo "undefine OS"                                                          
    exit 1
fi

# Build from source

git clone https://github.com/erlang/otp.git
cd ./otp
git checkout maint-25

./configure --prefix=/opt/erlang

make 
make install
