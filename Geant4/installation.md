# prerequisites
* GDML support:	libxerces-c-dev
* User Interface and Visulizatoin:  qt4-dev-tools, freeglut3-dev, libmotif-dev, tk-dev
* others:   libxpm-dev, libxmu-dev, libxi-dev

# configureation
 cmake -DCMAKE_INSTALL_PREFIX=/path/to/installation -DGEANT4_USE_GDML=ON -DGEANT4_INSTALL_DATA=ON -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_QT=ON -DGEANT4_BUILD_MULTITHREAD=ON /path/to/source
