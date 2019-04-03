FROM monokrome/wine
MAINTAINER Drew Petersen <senofpeter@gmail.com>

RUN chmod +x /usr/local/bin/xvfb-run

# docker will automatically unzip known archive formats
ADD yoda-stories.tgz /yoda-files/

ENTRYPOINT xvfb-run -a wine64 /yoda-files/Yoda/YODESK.EXE

