#!/bin/bash

moshp()
{
	mosh --ssh="ssh -p $1" "$2"
}
