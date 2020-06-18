_test_prog() {
	_test_java
	! _check_java_openjdkANY && echo 'missing: openjdk'
}



_test_build-app-translate2geda_sequence() {
	_start
	
	export ubJavac="c"
	! _check_java_openjdkANY && echo 'missing: openjdk' && _stop 1
	
	_stop
}

_test_build-app-translate2geda() {
	"$scriptAbsoluteLocation" _test_build-app-translate2geda_sequence
}

_test_build_prog() {
	_test_build-app-translate2geda
}

_testBuilt_prog() {
	_stop 1
}







_build-app-translate2geda() {
	_start
	
	cd "$scriptLib"/translate2geda
	
	_javac_openjdk11 ./*.java
	
	
	_stop
}

_build_prog() {
	_test_build-app-translate2geda
	
	"$scriptAbsoluteLocation" _build-app-translate2geda
}


_setup_prog() {
	true
}




