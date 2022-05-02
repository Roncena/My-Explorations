#!/bin/bash
grep $1 * | awk -F" " '{print $1, $2, $3, $4, $5, $6, $7, $8}' ||
grep '....' * ||
grep '*FNAME LAST' | awk -F" " '{print $3, $4, $5, $6,$7, $8}'
