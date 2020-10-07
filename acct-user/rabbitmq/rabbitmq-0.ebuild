# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="RabbitMQ program user"
KEYWORDS="~amd64 ~arm64 ~x86"

ACCT_USER_ID=-1
ACCT_USER_HOME=/var/lib/rabbitmq
ACCT_USER_GROUPS=( rabbitmq )

acct-user_add_deps
