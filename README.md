# Thingfish PostgreSQL Metastore

home
: https://hg.sr.ht/~ged/thingfish-metastore-pg

code
: https://hg.sr.ht/~ged/thingfish-metastore-pg

github
: https://github.com/ged/thingfish-metastore-pg

docs
: https://deveiate.org/code/thingfish-metastore-pg


## Description

This is a metadata storage plugin for the Thingfish digital asset manager. It
provides persistent storage for uploaded data to a PostgreSQL table.


## Authors

* Michael Granger <ged@FaerieMUD.org>
* Mahlon E. Smith <mahlon@martini.nu>


## Installation

    $ gem install thingfish-metastore-pg


##  Usage

As with Thingfish itself, this plugin uses
Configurability[https://rubygems.org/gems/configurability] to modify default
behaviors.

Here's an example configuration file that enables this plugin.

    ---
    thingfish:
      metastore: pg
      pg_metastore:
        uri: postgres://thingfish:password@db.example.com/database


When Thingfish starts, it will install the necessary database schema
automatically.


## License

Copyright (c) 2014-2020, Michael Granger and Mahlon E. Smith.

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this
  list of conditions and the following disclaimer in the documentation and/or
  other materials provided with the distribution.

* Neither the name of the authors, nor the names of its contributors may be
  used to endorse or promote products derived from this software without
  specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

