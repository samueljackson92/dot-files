#!/bin/bash

RAW_BLOG_PATH=~/git/samueljackson92.github.io.raw
BLOG_PATH=~/git/samueljackson92.github.io

# Build the blog using jekyll and publish it to Gihub
function build() {
	local current_path=`pwd`
	cd $RAW_BLOG_PATH
	jekyll build
	cp -r $RAW_BLOG_PATH/_site/* $BLOG_PATH
	cd "$BLOG_PATH"
	git add .
	git commit -am 'Latest build.'
	git push
	cd $current_path
}

function help() {
	echo $OPTIONS
	echo "blog commands"
	echo "build - build blog using jekyll and publish to Github"
}

function post() {
	cd $RAW_BLOG_PATH
	post_content="---\nlayout: post\ntitle: $2 \nexcerpt_separator: <!--more-->\n---"
	post_path=`date "+%Y-%m-%d-"`$3".md"
	post_content=$(echo -e $post_content) 
	echo "$post_content" > $RAW_BLOG_PATH/_posts/$post_path
}


if [[ $1 =~ ^(build|post|help)$ ]]; then
	$1 $@
else
	echo "Invalid subcommand $1" >&2
	exit 1
fi
