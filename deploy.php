<?php
header('Content-type: application/json');

$entityBody = file_get_contents('php://input');

$githubHook = json_decode($entityBody);
if(isset($githubHook)) {
	$repoName = $githubHook->repository->name;
	shell_exec('/usr/local/bin/github-hook-processor.sh ' . $repoName);
}

echo '{"message": "This is to notify you that I did what you told me"}';
