#! /bin/bash

GRAM=neg
GENUS=FIXME
SPECIES=FIXME

BUSCO_LINEAGE= # use --auto-lineage-prok
#BUSCO_LINEAGE=FIXME # consult busco --list-datasets

# if ${PGAP_HOME} is not set, run Prokka instead
#PGAP_HOME=$HOME/scratch/pgap

PGAP_ARGS=
PGAP_ARGS+=" --taxcheck"
# PGAP_ARGS+=" --quiet"
PGAP_ARGS+=" --verbose"
PGAP_ARGS+=" --report-usage-false"
# PGAP_ARGS+=" --report-usage-true"

