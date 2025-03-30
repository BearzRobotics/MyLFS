./configure --prefix=/usr

sed -i '/#include "sox.h"/a #include <math.h>' src/sox_sample_test.h

make    
make installg