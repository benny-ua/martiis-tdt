#!/bin/bash

CURDIR=$1
TUFSBOXDIR=$2
OUTDIR=$3
TMPKERNELDIR=$4
TMPROOTDIR=$5

echo "CURDIR       = $CURDIR"
echo "TUFSBOXDIR   = $TUFSBOXDIR"
echo "OUTDIR       = $OUTDIR"
echo "TMPKERNELDIR = $TMPKERNELDIR"
echo "TMPROOTDIR   = $TMPROOTDIR"

MKFSJFFS2=$TUFSBOXDIR/host/bin/mkfs.jffs2
MUP=$CURDIR/mup

OUTFILE=$OUTDIR/update_wo_fw.img

if [ ! -e $OUTDIR ]; then
  mkdir $OUTDIR
fi

if [ -e $OUTFILE ]; then
  rm -f $OUTFILE
fi

cp $TMPKERNELDIR/uImage $CURDIR/uImage

# Create a jffs2 partition for root
# Size 64mb = -p0x4000000
# Folder which contains fw's is -r fw
# e.g.
# .
# ./release
# ./release/etc
# ./release/usr
$MKFSJFFS2 -qUnfv -r $TMPROOTDIR -s0x800 -p0x4000000 -e0x20000 -o $CURDIR/mtd_root.bin

# Create a kathrein update file for fw's 
# Offset on NAND Disk = 0x00400000
$MUP c $OUTFILE << EOF
2
0x00000000, 1, uImage
0x00C00000, 1, mtd_root.bin
;
EOF

rm -f $CURDIR/uImage
rm -f $CURDIR/mtd_root.bin

zip $OUTFILE.zip $OUTFILE
