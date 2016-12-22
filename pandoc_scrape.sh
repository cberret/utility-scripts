#!/usr/local/bin/bash

dir="/Users/charles/Cloud/Notes/scraped"
date=$(date +%Y%m%d) ## date as e.g. 20160704
fulldate=$(date +'%v') ## date as e.g. 04-July-2016

## prompt for the url to scrape
echo "ENTER THE URL OF THE WEBSITE"
read url

## extracts the domain name, e.g. everything after the final slash in the url
domain="${url#*//}" 
domain="${domain%%/*}"
## extracts the pagename, e.g. the chunk of the url after the final slash
page=$(echo ${url##*/})

## path to directory and filename as date + domain name + page name dot markdown
filename="$dir/$date-$domain-$page.md"
echo -e "FILE WILL BE SAVED TO:\n$filename"

## pandoc reads html directly from the url
## "+RTS -K16777216 -RTS" segment is debug to increase buffer size
pandoc -f html -t markdown +RTS -K16777216 -RTS $url > $filename

# enter the full date and source url to the first line of whatever.md
sed -i "1s|^|Downloaded on $fulldate from $url \n\n|" $filename

## remove any line beginning with "<" ; cleans up most remaining HTML elements
sed -i -e '/^</ d' $filename

echo "FINISHED"
