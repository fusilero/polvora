# pólvora ![](https://raw.githubusercontent.com/steveno/polvora/master/data/hicolor/48x48/apps/polvora.png)
[![Stories in Ready](https://badge.waffle.io/steveno/polvora.png?label=ready)](https://waffle.io/steveno/polvora)

## About
pólvora is a simple open source reloading database. It's 
named after the Catalan word for "gunpowder" in English. Enjoy!

## Minimum Requirements
* vala >= 0.36.8
* glib-2.0 >= 2.40.0
* gtk+-3.0 >= 3.10.8
* gee-0.8 >= 0.20.0

### Ubuntu
```bash
sudo apt-get install build-essential libgtk-3-dev vala ninja python3-pip
sudo pip3 install meson-build
```

## Build Instructions
```bash
cd polvora
mkdir build
meson . build/
cd build
ninja
sudo ninja install
```

## Contributing
Please see [the contributing file](https://github.com/steveno/polvora/blob/master/CONTRIBUTING.md)
