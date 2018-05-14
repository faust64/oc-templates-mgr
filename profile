# Should we create OpenShift projects importing templates?
test -z "$DO_CREATE_PROJECT" && DO_CREATE_PROJECT=true

# Should we purge dropped items from OpenShift importing templates?
test -z "$DO_PURGE_DROPPED" && DO_PURGE_DROPPED=false

# Validating templates: should we ensure CPU/Memory limits have been set?
test -z "$ENFORCE_LIMITS" && ENFORCE_LIMITS=true

# Validating templates: should we ensure CPU/Memory requests have been set?
test -z "$ENFORCE_REQUESTS" && ENFORCE_REQUESTS=true

# Only process templates from project or whose name matches your filter:
test -z "$FILTER" && FILTER=my-custom-project

#DEBUG=yes
