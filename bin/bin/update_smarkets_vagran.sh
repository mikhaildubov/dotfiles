#!/bin/bash
paver stop \
    && paver clean_data \
    && paver migrate_data \
    && paver load_development_data \
    && paver start \
    && /vagrant/bin/event-creator -t football -f 1 \
    && /vagrant/bin/horse_data_fetcher.py \
    && /vagrant/bin/horse-event-creator /vagrant/bin \
    && /vagrant/bin/build_new_navigation
# This is from Thomas and needs to be run from the smarkets vagrant
# Could be done on a cron job for instance, every monrning at 5am to make sure
# the smarkets vagrant is ready for the day
