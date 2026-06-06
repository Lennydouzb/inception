#!/bin/bash

cscli bouncers add wordpress-bouncer -k $CROWDSEC_KEY || true
exec crowdsec