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

_testBuilt_prog_sequence() {
	_start
	
	! [[ -e "$scriptLib"/translate2geda/translate2geda.class ]] && _stop 1
	
	cd "$scriptLib"/translate2geda
	! _java_openjdk11 translate2geda > /dev/null 2>&1 && _stop 1
	
	_stop
}

_testBuilt_prog() {
	if "$scriptAbsoluteLocation" _testBuilt_prog_sequence
	then
		return 0
	fi
	
	_stop 1
}







_build-app-translate2geda() {
	_start
	
	cd "$scriptLib"/translate2geda
	
	if java --version | grep openjdk > /dev/null 2>&1 && type javac > /dev/null 2>&1
	then
		javac ./*.java
	else
		_javac_openjdk11 ./*.java
	fi
	
	
	_stop
}

_build_prog() {
	_test_build-app-translate2geda
	
	"$scriptAbsoluteLocation" _build-app-translate2geda
}


_setup_prog() {
	true
}




