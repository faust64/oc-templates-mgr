# OpenShift Template Manager

Keep track of your OpenShift templates: commit them into your local copy of
this repository, keeping an history of your modifications over time.

[Fork Me!](https://github.com/faust64/oc-tpl-mgr#fork-destination-box)

## Usage

 * `make export-templates` to export OpenShift templates into your working
   directory, creating a folder per project
 * `make import-templates` to import OpenShift templates from your working
   directory

## Arguments

 * `DO_CREATE_PROJECT=(false|true)` default behavior would be to not create
   missing projects and skip corresponding templates while importing local data
 * `DO_PURGE_DROPPED=(false|true)` default behavior would be to not purge
  templates that would have been dropped from local copy, importing to OpenShift
 * `DEBUG=(|string)` turn debugs on
 * `FILTER=str-or-regexpr` default behavior would be to export, check or import
  all templates, although you may only process those whose name would match a
  filter
