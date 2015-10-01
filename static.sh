#!/bin/sh

###
###
### Author: Francisco Suarez
### Static Mirror
### Description: Creates Static Sites and pushes them to Host[s]
###

WGET="/usr/local/bin/wget"
ECHO="/bin/echo"
MKDIR="/bin/mkdir"
EXTRA1="_img"

source=$1
destination=$2

cd /thr_static/

if [ "$destination" = "" ] ; then
  destination="."
fi

if [ "$source" = "" ] ; then
  $ECHO "Usage: $0 <source> [destination]"
  $ECHO "  <source> is the URL to copy"
  $ECHO "  [destination] is where to store the copy (default is the current directory)"
  $ECHO ""
  $ECHO "Note: destination is optional"
  exit 1
fi


echo $source " last replication started on:" >> /thr_static/thr_static.log
date >> /thr_static/thr_static.log

rm -rf $source

## Make Static Site / Save Local
$WGET \
     --mirror \
     -p \
     --convert-links \
  "$source"

cd $source


for file in *.html */*.html
do
    cat >> $file <<EOF
<script type="text/javascript">
<!--
if ( window.innerWidth < 700 ) {
window.location = "http://$mobile_redirect";
}
//-->
</script>

<script type="text/javascript">
if ( window.addEventListener ) {
  var state1 = 0, konami = [78,79,86,65,67,77,83];
  window.addEventListener("keydown", function(e) {
    if ( e.keyCode == konami[state1] ) state1++;
    else state1 = 0;
    if ( state1 == 7 )
      window.location = "http://$cms_redirect";
    }, true);
}
</script>
EOF
done

## Fetch Slider Images src = asrc
if [ -d "$EXTRA1" ]; then
  cd $EXTRA1
  cat index.html | grep -E 'asrc' | awk -v FS='asrc="' '{print "$source"$2}' | cut -d'"' -f 1 | xargs wget
fi

## Rsync Static Site to Host
rsync -rtvu --delete-after -e ssh /thr_static/$source/ ubuntu@hostdomain.com:/var/www/sites/$destination


echo $source " last replication ended on:" >> /thr_static/thr_static.log
date >> /thr_static/thr_static.log