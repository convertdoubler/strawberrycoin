
# x86_64-pc-linux-gnu
./autogen.sh;
./configure --prefix=`pwd`/depends/x86_64-pc-linux-gnu
make -j4 -k
mkdir -p build/v2.0.0.0/x86_64-pc-linux-gnu;
cp ./src/airind ./build/v2.0.0.0/x86_64-pc-linux-gnu/airind;
cp ./src/airin-tx ./build/v2.0.0.0/x86_64-pc-linux-gnu/airin-tx;
cp ./src/airin-cli ./build/v2.0.0.0/x86_64-pc-linux-gnu/airin-cli;
cp ./src/qt/airin-qt ./build/v2.0.0.0/x86_64-pc-linux-gnu/airin-qt;
strip ./build/v2.0.0.0/x86_64-pc-linux-gnu/airind
strip ./build/v2.0.0.0/x86_64-pc-linux-gnu/airin-tx
strip ./build/v2.0.0.0/x86_64-pc-linux-gnu/airin-cli
strip ./build/v2.0.0.0/x86_64-pc-linux-gnu/airin-qt

cd build/v2.0.0.0/x86_64-pc-linux-gnu;
cd ../../..;

make clean;cd src;make clean;cd ..;

# x86_64-w64-mingw32
./autogen.sh;
./configure --prefix=`pwd`/depends/x86_64-w64-mingw32
make HOST=x86_64-w64-mingw32 -j4 -k;

mkdir -p build/v2.0.0.0/x86_64-w64-mingw32;
cp ./src/airind.exe ./build/v2.0.0.0/x86_64-w64-mingw32/airind.exe;
cp ./src/airin-tx.exe ./build/v2.0.0.0/x86_64-w64-mingw32/airin-tx.exe;
cp ./src/airin-cli.exe ./build/v2.0.0.0/x86_64-w64-mingw32/airin-cli.exe;
cp ./src/qt/airin-qt.exe ./build/v2.0.0.0/x86_64-w64-mingw32/airin-qt.exe;
strip ./build/v2.0.0.0/x86_64-w64-mingw32/airind.exe
strip ./build/v2.0.0.0/x86_64-w64-mingw32/airin-tx.exe
strip ./build/v2.0.0.0/x86_64-w64-mingw32/airin-cli.exe
strip ./build/v2.0.0.0/x86_64-w64-mingw32/airin-qt.exe
## created detached signatures
cd build/v2.0.0.0/x86_64-w64-mingw32;


##/C= 	Country 	GB
##/ST= 	State 	London
##/L= 	Location 	London
##/O= 	Organization 	Global Security
##/OU= 	Organizational Unit 	IT Department
##/CN= 	Common Name 	example.com

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airin-qt-selfsigned.key -out ./airin-qt-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airind-selfsigned.key -out ./airind-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airin-tx-selfsigned.key -out ./airin-tx-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net"; 
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airin-cli-selfsigned.key -out ./airin-cli-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net"; 

osslsigncode sign -certs airin-qt-selfsigned.crt -key airin-qt-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airin-qt.exe -out airin-qt-signed.exe

osslsigncode sign -certs airind-selfsigned.crt -key airind-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airind.exe -out airind-signed.exe

osslsigncode sign -certs airin-tx-selfsigned.crt -key airin-tx-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airin-tx.exe -out airin-tx-signed.exe

osslsigncode sign -certs airin-cli-selfsigned.crt -key airin-cli-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airin-cli.exe -out airin-cli-signed.exe

mv airin-qt-signed.exe airin-qt.exe;
mv airind-signed.exe airind.exe;
mv airin-tx-signed.exe airin-tx.exe;
mv airin-cli-signed.exe airin-cli.exe;

cd ../../..;
make clean;cd src;make clean;cd ..;

# i686-w64-mingw32
./autogen.sh;
./configure --prefix=`pwd`/depends/i686-w64-mingw32
make HOST=i686-w64-mingw32 -j4 -k;

mkdir -p build/v2.0.0.0/i686-w64-mingw32;
cp ./src/airind.exe ./build/v2.0.0.0/i686-w64-mingw32/airind.exe;
cp ./src/airin-tx.exe ./build/v2.0.0.0/i686-w64-mingw32/airin-tx.exe;
cp ./src/airin-cli.exe ./build/v2.0.0.0/i686-w64-mingw32/airin-cli.exe;
cp ./src/qt/airin-qt.exe ./build/v2.0.0.0/i686-w64-mingw32/airin-qt.exe;
strip ./build/v2.0.0.0/i686-w64-mingw32/airind.exe
strip ./build/v2.0.0.0/i686-w64-mingw32/airin-tx.exe
strip ./build/v2.0.0.0/i686-w64-mingw32/airin-cli.exe
strip ./build/v2.0.0.0/i686-w64-mingw32/airin-qt.exe
## created detached signatures
cd build/v2.0.0.0/i686-w64-mingw32;

##/C= 	Country 	GB
##/ST= 	State 	London
##/L= 	Location 	London
##/O= 	Organization 	Global Security
##/OU= 	Organizational Unit 	IT Department
##/CN= 	Common Name 	example.com

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airin-qt-selfsigned.key -out ./airin-qt-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airind-selfsigned.key -out ./airind-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airin-tx-selfsigned.key -out ./airin-tx-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net"; 
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./airin-cli-selfsigned.key -out ./airin-cli-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=airinltd.net"; 

osslsigncode sign -certs airin-qt-selfsigned.crt -key airin-qt-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airin-qt.exe -out airin-qt-signed.exe

osslsigncode sign -certs airind-selfsigned.crt -key airind-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airind.exe -out airind-signed.exe

osslsigncode sign -certs airin-tx-selfsigned.crt -key airin-tx-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airin-tx.exe -out airin-tx-signed.exe

osslsigncode sign -certs airin-cli-selfsigned.crt -key airin-cli-selfsigned.key \
        -n "Airin Ltd" -i http://www.airinltd.net/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in airin-cli.exe -out airin-cli-signed.exe

mv airin-qt-signed.exe airin-qt.exe;
mv airind-signed.exe airind.exe;
mv airin-tx-signed.exe airin-tx.exe;
mv airin-cli-signed.exe airin-cli.exe;

cd ../../..;
make clean;cd src;make clean;cd ..;

# arm-linux-gnueabihf
./autogen.sh;
./configure --prefix=`pwd`/depends/arm-linux-gnueabihf
make HOST=arm-linux-gnueabihf -j4 -k;

mkdir -p build/v2.0.0.0/arm-linux-gnueabihf;
cp ./src/airind ./build/v2.0.0.0/arm-linux-gnueabihf/airind;
cp ./src/airin-tx ./build/v2.0.0.0/arm-linux-gnueabihf/airin-tx;
cp ./src/airin-cli ./build/v2.0.0.0/arm-linux-gnueabihf/airin-cli;
cp ./src/qt/airin-qt ./build/v2.0.0.0/arm-linux-gnueabihf/airin-qt;
strip ./build/v2.0.0.0/arm-linux-gnueabihf/airind
strip ./build/v2.0.0.0/arm-linux-gnueabihf/airin-tx
strip ./build/v2.0.0.0/arm-linux-gnueabihf/airin-cli
strip ./build/v2.0.0.0/arm-linux-gnueabihf/airin-qt
# created detached signatures
cd build/v2.0.0.0/arm-linux-gnueabihf;
cd ../../..;
make clean;cd src;make clean;cd ..;

# aarch64-linux-gnu
./autogen.sh;
./configure --prefix=`pwd`/depends/aarch64-linux-gnu
make HOST=aarch64-linux-gnu -j4 -k;

mkdir -p build/v2.0.0.0/aarch64-linux-gnu;
cp ./src/airind ./build/v2.0.0.0/aarch64-linux-gnu/airind;
cp ./src/airin-tx ./build/v2.0.0.0/aarch64-linux-gnu/airin-tx;
cp ./src/airin-cli ./build/v2.0.0.0/aarch64-linux-gnu/airin-cli;
cp ./src/qt/airin-qt ./build/v2.0.0.0/aarch64-linux-gnu/airin-qt;
strip ./build/v2.0.0.0/aarch64-linux-gnu/airind
strip ./build/v2.0.0.0/aarch64-linux-gnu/airin-tx
strip ./build/v2.0.0.0/aarch64-linux-gnu/airin-cli
strip ./build/v2.0.0.0/aarch64-linux-gnu/airin-qt
# created detached signatures
cd build/v2.0.0.0/aarch64-linux-gnu;
cd ../../..;
make clean;cd src;make clean;cd ..;
