#!/bin/sh

# Process the template
chezmoi execute-template < $(chezmoi source-path)/dot_czhelpers.tmpl > /tmp/helper

# Move the processed file to the destination
mv /tmp/helper "$(chezmoi target-path)/.czhelpers"
