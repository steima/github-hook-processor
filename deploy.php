<?php

$entityBody = file_get_contents('php://input');

$myfile = fopen("/tmp/github.json", "w");
fwrite($myfile, $entityBody);
fclose($myfile);

$githubHook = json_decode($entityBody);
if(isset($githubHook)) {
	// perform the actual processing
}
