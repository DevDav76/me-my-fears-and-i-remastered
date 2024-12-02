if (!despawning) {
	despawning = true;
	alarm[1] = 300;
} else if (despawning) {
	instance_destroy();
}