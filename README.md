# OpenShift Templates Manager

Keep track of your OpenShift templates: commit them into your local copy of
this repository, keeping an history of your modifications over time.

[Fork Me!](https://github.com/faust64/oc-tpl-mgr#fork-destination-box)

Special thanks to Eloise Faure, whose idea it was to version templates,
operating some OpenShift cluster.

## Usage

You may change a few defaults editing `./profile`, then use:

 * `make export-templates` to export OpenShift templates into your working
   directory, creating a folder per project
 * `make import-templates` to import OpenShift templates from your working
   directory
