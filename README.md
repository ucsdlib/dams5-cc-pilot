# dams5-cc-pilot
A repository for doing shared R&amp;D on CurationConcerns for the Development team.

**Note** This repository will be used for R&D [Development spikes](https://en.wikipedia.org/wiki/Spike_(software_development)) only. It is not intended to be used as the new DAMS5 Digital Collections codebase.

## Prerequisites

The following software are required:

1. Solr
1. [Fedora Commons](http://www.fedora-commons.org/) digital repository
1. A SQL RDBMS (MySQL, PostgreSQL), though **note** that SQLite will be used by default if you're looking to get up and running quickly.
1. [Redis](http://redis.io/), a key-value store. The `redlock` gem requires Redis >= 2.6.
1. [ImageMagick](http://www.imagemagick.org/) with JPEG-2000 support.
1. [LibreOffice](https://www.libreoffice.org/download/libreoffice-fresh/)
1. [FITS](http://projects.iq.harvard.edu/fits/downloads) version 0.8.5.
1. [FFMPEG](https://ffmpeg.org/)

Please visit [Curation Concerns](https://github.com/projecthydra/curation_concerns) for installation guide.

### Check out DAMSPAS from GIT
1. Clone Project: ```git clone https://github.com/ucsdlib/dams5-cc-pilot```
2. Open Project: ```cd dams5-cc-pilot```
3. Install gems: ```bundle install```
4. Update DB: ```bundle exec rake db:migrate```

### Running Tests
```bash
# Start the test servers
rake hydra:test_server

# run the test suits
bundle exec rake spec
```

### Running dams5-cc-pilot (demo only)
```rake hydra:test_server```

Or do it in the following steps:

```bash
solr_wrapper -p 8983 -d solr/config/ --collection_name hydra-development

# in another window
fcrepo_wrapper -p 8984 --no-jms

# and in another window
rails s
```
Go to http://localhost:3000/ and register to start

### Import sample Authority records (demo only)
```bash
bin/import-authorities
```

