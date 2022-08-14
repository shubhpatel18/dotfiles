keychain() {
	if [ ! -S "$SSH_AUTH_SOCK" ] ; then
		if [ -n "$(pgrep -u $USER ssh-agent)" ] ; then
			export SSH_AGENT_PID="$(pgrep -u $USER ssh-agent)"
			export SSH_AUTH_SOCK="$(find /tmp/ssh-* -name \
			"agent.$(( $SSH_AGENT_PID - 1 ))")"
		else
			# start ssh-agent + keep keys in memory for 12 hours
			eval $(ssh-agent -t 43200) > /dev/null 2>&1
		fi
	fi

	# keep tmux and screens happy by maintaining $SSH_AUTH_SOCK at
	# .ssh/ssh_auth_sock
	home_sock="$HOME/.ssh/ssh_auth_sock"
	if [ "$SSH_AUTH_SOCK" != "$home_sock" ] && [ -S "$SSH_AUTH_SOCK" ] ; then
		ln -sf "$SSH_AUTH_SOCK" "$home_sock"
	fi
	export SSH_AUTH_SOCK="$home_sock"
	unset home_sock
}

keychain

keychain-debug() {
	echo "SSH_AUTH_SOCK: $SSH_AUTH_SOCK $([ -L "$SSH_AUTH_SOCK" ] \
		&& echo "-> $(readlink -f "$SSH_AUTH_SOCK")" )"
	echo "SSH Agents: $(pgrep -u $USER ssh-agent)"
}

keychain-reset() {
	kill "$(pgrep -u $USER ssh-agent)"
	unset SSH_AUTH_SOCK
	unset SSH_AGENT_PID
	rm "$HOME/.ssh/ssh_auth_sock"
	keychain
	keychain-debug
}
