#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                                             #
#  Script to flush the DNS caches in macOS. The script checks the version of macOS and then   #
#  issues the appropriate command to flush the caches. The script is designed to run from a   #
#  management server or from Apple Remote Desktop, and requires root privileges to succeed.   #
#                                                                                             #
#                -  *  -  *  -  *  -  *  -  *  -  *  -  *  -  *  -  *  -  *  -                #
#                                                                                             #
#                 This script was created by Martyn Powell on 13th July 2016                  #
#                                                                                             #
#                -  *  -  *  -  *  -  *  -  *  -  *  -  *  -  *  -  *  -  *  -                #
#                                                                                             #
#  This program is free software: you can redistribute it and/or modify it under the terms    #
#  of the GNU General Public License as published by the Free Software Foundation, either     #
#  version 3 of the License, or (at your option) any later version.                           #
#                                                                                             #
#  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;  #
#  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  #
#  See the GNU General Public License for more details.                                       #
#                                                                                             #
#  You should have received a copy of the GNU General Public License along with this program. #
#  If not, see <http://www.gnu.org/licenses/>.                                                #
#                                                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# - - - - - - - - - - - - - - - - DO NOT EDIT BELOW THIS LINE - - - - - - - - - - - - - - - - #

# Set variable for macOS Version
macosVersion=$(sw_vers -productVersion)

# Define correct flush command for the macOS Version
if [[ $macosVersion == "10.6"* ]]
then
	dnsFlushCommand="dscacheutil -flushcache"
else
	if [[ $macosVersion == "10.7"* ]]
	then
		dnsFlushCommand="killall -HUP mDNSResponder"
	else
		if [[ $macosVersion == "10.8"* ]]
		then
			dnsFlushCommand="killall -HUP mDNSResponder"
		else
			if [[ $macosVersion == "10.9"* ]]
			then
				dnsFlushCommand="killall -HUP mDNSResponder"
			else
				if [[ $macosVersion == "10.10" ]]
				then
					dnsFlushCommand="discoveryutil mdnsflushcache"
				else
					if [[ $macosVersion == "10.10.1" ]]
					then
						dnsFlushCommand="discoveryutil mdnsflushcache"
					else
						if [[ $macosVersion == "10.10.2" ]]
						then
							dnsFlushCommand="discoveryutil mdnsflushcache"
						else
							if [[ $macosVersion == "10.10.3" ]]
							then
								dnsFlushCommand="discoveryutil mdnsflushcache"
							else
								if [[ $macosVersion == "10.10.4" ]]
								then
									dnsFlushCommand="killall -HUP mDNSResponder"
								else
									if [[ $macosVersion == "10.10.5" ]]
									then
										dnsFlushCommand="killall -HUP mDNSResponder"
									else
										if [[ $macosVersion == "10.11"* ]]
										then
											dnsFlushCommand="killall -HUP mDNSResponder"
										else
											if [[ $macosVersion == "10.12"* ]]
											then
												dnsFlushCommand="killall -HUP mDNSResponder"
											else
												echo "ERROR : Unsupported macOS version."
												exit 1
											fi
										fi
									fi
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi
fi

# Issue flush command
echo "SUCCESS : macOS version is $macosVersion. Flushing DNS caches with '$dnsFlushCommand'."
$dnsFlushCommand
