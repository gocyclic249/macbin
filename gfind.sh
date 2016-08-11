#!/bin/sh

goobook query "$*" | sed -e ‘/^$/d’ -e ‘s/\(.*\) \(.*\)\t.*/\1 \2/’
