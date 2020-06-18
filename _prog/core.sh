##### Core


_translate2geda_sequence() {
	_start
	
	export sharedHostProjectDir=/
	export sharedGuestProjectDir=/
	_virtUser "$@"
	cd "$scriptLib"/translate2geda
	_java_openjdk11 translate2geda "${processedArgs[@]}"
	
	_stop "$?"
}

_translate2geda() {
	"$scriptAbsoluteLocation" _translate2geda_sequence "$@"
}














# # ATTENTION: Add to ops!
_refresh_anchors_task() {
	true
	#cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_task_translate2geda_project
}

_refresh_anchors_specific() {
	true
	
	_refresh_anchors_specific_single_procedure _translate2geda
}

_refresh_anchors_user() {
	true
	
	_refresh_anchors_user_single_procedure _translate2geda
}

_associate_anchors_request() {
	if type "_refresh_anchors_user" > /dev/null 2>&1
	then
		_tryExec "_refresh_anchors_user"
		#return
	fi
	
	
	_messagePlain_request 'association: dir, *.pcb'
	echo _translate2geda"$ub_anchor_suffix"
}


_refresh_anchors() {
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_translate2geda
	
	_tryExec "_refresh_anchors_task"
	
	return 0
}

