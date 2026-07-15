<?php
/**
 * Shared hit counter for static sites.
 *
 * Usage:
 *   POST /counter?name=hastherapturehappened
 *   GET  /counter?name=hastherapturehappened&peek=1   (read without incrementing)
 *
 * Counter files live under DATA_DIR (one file per name).
 * Install this script e.g. at /usr/share/site-counters/counter.php and
 * Alias it from each Apache vhost.
 */

declare(strict_types=1);

const DATA_DIR = '/var/lib/site-counters';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

function fail(int $code, string $message): void
{
    http_response_code($code);
    echo json_encode(['error' => $message], JSON_UNESCAPED_SLASHES);
    exit;
}

$name = $_GET['name'] ?? '';
if (!is_string($name) || !preg_match('/^[a-z0-9][a-z0-9_-]{0,63}$/', $name)) {
    fail(400, 'invalid counter name');
}

$peek = isset($_GET['peek']) && $_GET['peek'] !== '0' && $_GET['peek'] !== '';

if (!is_dir(DATA_DIR)) {
    fail(500, 'counter data directory missing');
}

$path = DATA_DIR . '/' . $name . '.count';
$fp = @fopen($path, 'c+');
if ($fp === false) {
    fail(500, 'unable to open counter');
}

if (!flock($fp, LOCK_EX)) {
    fclose($fp);
    fail(500, 'unable to lock counter');
}

$raw = stream_get_contents($fp);
$count = ($raw === false || $raw === '') ? 0 : (int) trim($raw);
if ($count < 0) {
    $count = 0;
}

if (!$peek) {
    $count++;
    rewind($fp);
    ftruncate($fp, 0);
    fwrite($fp, (string) $count);
    fflush($fp);
}

flock($fp, LOCK_UN);
fclose($fp);

echo json_encode([
    'name'  => $name,
    'count' => $count,
], JSON_UNESCAPED_SLASHES);
