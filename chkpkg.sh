# Title: chkpkg.sh
# Description: Simple bash function to check if packages
# are installed or available 
# Created by: Jason Paulovicks

# Example list of packages to check, uncomment to test
# packages='audit audit-libs rsyslog'

function package_check() {
    if rpm -qa | grep "${1}" 1>/dev/null 2>&1; then
        return 0
    else
        if dnf search "${1}" 1>/dev/null 2>&1; then
            return 1
        else
            return 2
        fi
    fi
}

# For-loop to do the work
for p in ${packages}; do
    if package_check "${p}"; then
        echo "$p" "package is installed"
    else
        if test "$?" = 1; then
            echo "$p" "package is not installed, it is available in package repository"
        else
            echo "$p" "package is not installed, it is not available in package repository"
        fi
    fi
done
