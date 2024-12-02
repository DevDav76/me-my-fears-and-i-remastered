function scrScreenshake(_mag,_frames) {
	with (objCamera) {
		if (_mag > shakeRemain) {
			shakeMagnitude = _mag;
			shakeRemain = shakeMagnitude;
			shakeLength = _frames;
		}
	}
}