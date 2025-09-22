![Cartoview Logo](./docs/img/cartoview-logo.png)

[![GitHub stars](https://img.shields.io/github/stars/cartologic/cartoview.svg)](https://github.com/cartologic/cartoview/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/cartologic/cartoview.svg)](https://github.com/cartologic/cartoview/network)
[![Coverage Status](https://coveralls.io/repos/github/cartologic/cartoview/badge.svg?branch=master&service=github)](https://coveralls.io/github/cartologic/cartoview?branch=master&service=github)
[![Build Status](https://travis-ci.org/cartologic/cartoview.svg?branch=master)](https://travis-ci.org/cartologic/cartoview)
[![GitHub license](https://img.shields.io/github/license/cartologic/cartoview.svg)](https://github.com/cartologic/cartoview/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/cartologic/cartoview.svg)](https://github.com/cartologic/cartoview/issues)
[![Twitter](https://img.shields.io/twitter/url/https/github.com/cartologic/cartoview.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fcartologic%2Fcartoview)

## What is Cartoview?

[Cartoview](https://cartoview.net/) is a web platform that extends the popular [GeoNode](https://geonode.org/) SDI to provide the ability to create, share, and visualize GIS Web Mapping Applications easily and quickly from the browser. Cartoview Provides an [App Store](https://appstore.cartoview.net/) for GIS Developers.

Cartoview enables communities of users to share geospatial applications, to collaborate on these applications, and to exchange the underlying data as Open Geospatial Consortium (OGC) compliant web services.

Cartoview has been built utilizing open source software and open standards to make it available for all GIS operators and to maximize interoperability.

## Try Cartoview

You can try Cartoview by visiting our official demo online at: [http://try.cartoview.net/](http://try.cartoview.net/).

After registration, you will be able to explore all the basic functionalities of GeoNode like uploading layers, creation of maps, editing metadata, styles and much more but more importantly, the apps provided by Cartoview.

## Install Cartoview


## Prerequisites
	1. Install docker, git
	2. download geocatalog
	3. On windows, install from pre-requisites folder make-3.81.exe 
## Installation	
    1. Set environment variable GP_HOST with the public IP or hostname of the machine and the port used with ngnix in docker-compose/docker-compose-prod. Ex: GP_HOST=10.5.0.1:8080
	2. Launch init_host.bat to setup the host on the configuration files
	4. For dev:
		launch 'make run'
	   For prod:
	    launch 'make -f Makefile-prod run'

## Customizing Cartoview

If you're planning of customizing your Cartoview instance, or to extend its functionalities it's not advisable to change the core files here in any case. 

It's recommended to set up and install a [Cartoview Project Template](https://github.com/cartologic/cartoview-project) following the available guide [here](https://cartoview.readthedocs.io/en/latest/cartoview-project/).

## Support

If you have any inquiry regarding Cartoview, feel free to contact us by filling out the form [here](https://cartoview.net/#support) or sending an e-mail to [cartoview@cartologic.com](mailto:cartoview@cartologic.com)

## Most useful links

- Project homepage: [https://cartoview.net](https://cartoview.net)
- Repository: [https://github.com/cartologic/cartoview](https://github.com/cartologic/cartoview)
- Cartoview Project: [https://github.com/cartologic/cartoview-project](https://github.com/cartologic/cartoview-project)
- Official Demo: [http://try.cartoview.net](http://try.cartoview.net)
- Documentation: [https://cartoview.readthedocs.io](https://cartoview.readthedocs.io)
