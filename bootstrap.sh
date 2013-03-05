#!/bin/bash
mkdir -p .spm/
REPO=file://${HOME}/work/tuprepo

# Parameters for getpack are (category)/(package) (base_package_name) (tag/branch)
# Note that remote tags can be fetched running
# `git ls-remote --tags (remote_url)`
function getpack {
	git clone ${REPO}/${1}.build deps/${2}.build --single-branch --branch ${3} | tee .spm/log -a;
	git clone ${REPO}/${1} deps/${2} --single-branch --branch ${3} | tee .spm/log -a;
	cp -Rf deps/${2}.build/* deps/${2};
	rm -Rf deps/${2}.build/;
}
if [ ! -d "deps/lua" ]; then
	printf "Fetching dev-lang/lua v5.2.1 from repos...\n" | tee .spm/log -a;
	getpack dev-lang/lua lua v5.2.1;
fi
if [ ! -d "deps/tinycc" ]; then
	printf "Fetching dev-lang/tinycc release_0_9_26 from repos...\n" | tee .spm/log -a;
	getpack dev-lang/tinycc tinycc release_0_9_26;
fi
if [ ! -d "deps/tup" ]; then
	printf "Fetching dev-util/tup v0.6 from upstream...\n" | tee .spm/log -a;
	git clone git://github.com/gittup/tup.git deps/tup --single-branch --branch v0.6 | tee .spm/log -a
fi
TUP=$(which tup);
if [ ! -e $TUP ]; then
	printf "Building tup...\n" | tee .spm/log -a;
	cd deps/tup;
	./bootstrap.sh;
	cp -Rf {.tup,tup} ../../
	cd ../..;
	TUP=${PWD}/tup;
	rm -Rf;
fi
if [ ! -d ".tup" ]; then
	$TUP init;
fi
$TUP upd;
