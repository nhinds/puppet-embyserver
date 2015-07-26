# embyserver

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with embyserver](#setup)
    * [What embyserver affects](#what-embyserver-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with embyserver](#beginning-with-embyserver)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs [Emby server](http://emby.media/) on a node running Ubuntu or Debian Linux.


## Module Description

The module installs Emby by adding the official apt repo to the system, installing the package, and ensuring the service is running. No configuration is done at the moment.

Emby itself also supports Arch, CentOS, Fedora, Docker, Mac OSX, Windows and FreeBSD - but alas, I am lazy.

## Setup

### What embyserver affects

* Packages: Emby repository, emby-server
* Services: emby-server

### Setup Requirements **OPTIONAL**

Requires the Puppetlabs APT module.

## Usage

Currently there's not a lot to do:

include 'embyserver'

or

class{'embyserver': }

You can, if you like, specify the package name, service name and repo (the OS-specific URL part from http://emby.media/downloads/linux-server/) - however these are OS-dependent, so probably don't mess with them...

class{'embyserver':
	package => 'emby-server',
	service => 'emby-server',
	repo => 'xUbuntu_14.04',
}

## Reference

* class embyserver - installs Emby package repository, emby-server package, keeps emby-server service running.

## Limitations

* Requires Ubuntu or Debian linux (only tested on Ubuntu)
* OS version compatibility is done by simple checking of version and matching to a supported version on the Emby website; this may (let's face it, will) get out of date
* Does not configure Emby server

## Development

Pull requests welcome. If you want this to work on another linux distro and don't feel like coding, give me a yell and I can probably sort that out; other platforms you're probably better off writing it yourself...

