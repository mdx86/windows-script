<?php

$dir=$argc>1 ?$argv[1]: null;

if($dir){
	echo "target:$dir\n";
	chdir($dir);
}

$paths = shell_exec('git remote -v');
echo "current remote:\n$paths\n";
$p = preg_quote('http(s)?://[\w\./@]+');

$pattern = '/http(s)?:\/\/[\w\.\/@]+/i';
preg_match($pattern, $paths, $ms);
if (!$ms) {
    echo "Can't get current origin url\n";
    return;
}

$url = $ms[0];
$newDomain = 'fdcode.feidaojsq.cn';
$pattern = '/(http(s)?:\/\/)([\w\.@]+)/i';
$newUrl = preg_replace($pattern, "$1$newDomain", $url);

passthru('git remote remove origin');
$cmd = "git remote add origin $newUrl";
passthru($cmd);
echo "updated remote:\n";
passthru('git remote -v');
