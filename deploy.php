<?php

$entityBody = file_get_contents('php://input');
$githubHook = json_decode($entityBody);
if(isset($githubHook)) {
	// perform the actual processing
}
