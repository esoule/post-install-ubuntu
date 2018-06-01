#!/bin/bash
# This script tries to send e-mail using sendmail
#
# The following corner cases for sender MTA, receiver MTA and receiver MUA are tested
#
# * Modification of Date header by sender or receiver MTA
# * UTF-8 in body
# * UTF-8 in header (must be encoded 7-bit, base64 or quoted-printable by sender)
# * Simultaneous Russian, Greek, Hebrew and Tamil content in header and body
# * /etc/aliases forwarding rules
# * /etc/postfix/sender_canonical and /etc/postfix/recipient_canonical address rewriting

D="$( TZ=Pacific/Auckland date --rfc-email )"

SUBJ="Postfix test / Hello / Привет / Γεια σου / שלום / வணக்கம் / ${D}"

# SUBJ="Postfix test / Hello / ${D}"

SUBJ_B64="$( echo -n "${SUBJ}" | base64 -w 0 )"

sendmail -f logwatch -t <<__EOF__
From: logwatch
To: root
Date: ${D}
Subject: =?UTF-8?B?${SUBJ_B64}?=
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Postfix is good to go.

${SUBJ}

The first stanza of Pushkin's Bronze Horseman (Russian):

На берегу пустынных волн
Стоял он, дум великих полн,
И вдаль глядел. Пред ним широко
Река неслася; бедный чёлн
По ней стремился одиноко.
По мшистым, топким берегам
Чернели избы здесь и там,
Приют убогого чухонца;
И лес, неведомый лучам
В тумане спрятанного солнца,
Кругом шумел.

"I can eat glass and it does not hurt me" phrase in Greek:

Μπορώ να φάω σπασμένα γυαλιά χωρίς να πάθω τίποτα.

Check if your server changes date header. Original
header was "Date: ${D}"

__EOF__
