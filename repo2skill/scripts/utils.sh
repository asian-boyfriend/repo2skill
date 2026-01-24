#!/bin/bash

# GitHub API Mirrors (in priority order)
GITHUB_API_MIRRORS=(
    "https://api.github.com"
    "https://gh.api.888888888.xyz"
    "https://gh-proxy.com/api/github"
    "https://api.fastgit.org"
    "https://api.kgithub.com"
    "https://githubapi.muicss.com"
    "https://github.91chi.fun"
    "https://mirror.ghproxy.com"
)

# Raw file mirrors
GITHUB_RAW_MIRRORS=(
    "https://raw.githubusercontent.com"
    "https://raw.fastgit.org"
    "https://raw.kgithub.com"
)

# Function: Try multiple mirrors for GitHub API
github_api_fetch() {
    local endpoint=$1
    local token=$2
    
    for mirror in "${GITHUB_API_MIRRORS[@]}"; do
        local url="${mirror}${endpoint}"
        
        if [ -n "$token" ]; then
            response=$(curl -s -H "Authorization: token ${token}" -H "Accept: application/vnd.github.v3+json" "$url" 2>&1)
        else
            response=$(curl -s -H "Accept: application/vnd.github.v3+json" "$url" 2>&1)
        fi
        
        # Check for success
        if [[ ! $response =~ "error" ]] && [[ ! $response =~ "403" ]] && [[ ! $response =~ "429" ]]; then
            echo "$response"
            return 0
        fi
    done
    
    return 1
}

# Function: Try multiple mirrors for raw files
github_raw_fetch() {
    local path=$1
    
    for mirror in "${GITHUB_RAW_MIRRORS[@]}"; do
        local url="${mirror}${path}"
        response=$(curl -s -L "$url" 2>&1)
        
        if echo "$response" | grep -q "<!DOCTYPE html>"; then
            continue
        fi
        
        if [ ${#response} -gt 100 ]; then
            echo "$response"
            return 0
        fi
    done
    
    return 1
}

# Function: Extract repo info from URL
parse_repo_info() {
    local url=$1
    
    # GitHub
    if [[ $url =~ github\.com/([^/]+)/([^/\?#]+) ]]; then
        echo "github ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}"
        return 0
    fi
    
    # GitLab
    if [[ $url =~ gitlab\.com/([^/]+)/([^/\?#]+) ]]; then
        echo "gitlab ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}"
        return 0
    fi
    
    # Gitee
    if [[ $url =~ gitee\.com/([^/]+)/([^/\?#]+) ]]; then
        echo "gitee ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}"
        return 0
    fi
    
    return 1
}

# Export functions
export -f github_api_fetch
export -f github_raw_fetch
export -f parse_repo_info
