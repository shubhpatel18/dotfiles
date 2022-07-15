keychain() {
	if [ -n "$SSH_AUTH_SOCK" ] ; then
		echo "SSH_AUTH_SOCK already set: $SSH_AUTH_SOCK"
	else
		if [ -n "$(pgrep -u $USER ssh-agent)" ] ; then
			export SSH_AGENT_PID="$(pgrep -u $USER ssh-agent)"
			export SSH_AUTH_SOCK="$(find /tmp/ssh-* -name \
			"agent.$(expr $SSH_AGENT_PID - 1)")"
			echo "Found existing ssh-agent: $SSH_AGENT_PID"
		else
			# start ssh-agent + keep keys in memory for 12 hours
			eval $(ssh-agent -t 43200) > /dev/null 2>&1
			echo "Starting new ssh-agent: $SSH_AGENT_PID"
		fi
	fi
}

keychain

