#!/bin/bash
grep $1 * | awk -F" " '{print $1, $2, $5, $6}' ||
grep '....' *
