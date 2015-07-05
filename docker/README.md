Docker Instructions
---

Instructions here are meant to get you going and not a docker tutorial

Build
##
        $ docker build -t risu .

Run
##
        $ docker run -i -t risu /bin/bash

        root@6ea8b273ea64:/# risu -v
        WARNING: Nokogiri was built against LibXML version 2.8.0, but has
        dynamically loaded 2.9.1
        risu: 1.7.4
        Ruby Version: 2.1.6
        Rubygems Version: 2.2.3
