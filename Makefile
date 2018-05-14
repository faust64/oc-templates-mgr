check-oc:
	@@if ! oc get templates -n openshift >/dev/null 2>&1; then \
	    echo "OpenShift unreachable" >&2; \
	    exit 1; \
	fi

check-templates:
	@@./utils/check-templates

export: check-oc
	@@./utils/export-templates

import: check-oc check-templates
	@@./utils/import-templates

pre-commit:
	@@GIT_HOOK=true ./utils/check-templates
