
sed -i 's/^\(\s*\)g_string_free(parsed_value, FALSE);/\1gchar *dummy = g_string_free_and_steal(parsed_value); (void) dummy;/' src/update-mime-database.cpp
sed -i 's/4.1.2/4.5/g' data/shared-mime-info-spec.xml

export CPLUS_INCLUDE_PATH=/usr/include/c++/14.2.0/


mkdir build
cd    build


meson setup --prefix=/usr --buildtype=release -D update-mimedb=true  ..
xmlto --skip-validation -o ../data/shared-mime-info-spec-html html-nochunks ../data/shared-mime-info-spec.xml
ninja

ninja install
