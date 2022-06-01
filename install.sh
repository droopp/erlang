#
# Install erlang from official github repo
#

yum install -y ncurses-devel

git clone https://github.com/erlang/otp.git
cd ./otp
git checkout maint-25

./otp_build autoconf
./configure --prefix=/opt/erlang

make 
make install

