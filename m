Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 256AF64B3FB
	for <lists.virtualization@lfdr.de>; Tue, 13 Dec 2022 12:18:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5808D416FD;
	Tue, 13 Dec 2022 11:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5808D416FD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L63yg5Wx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fj_tIsdjbyUs; Tue, 13 Dec 2022 11:18:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3594D416F6;
	Tue, 13 Dec 2022 11:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3594D416F6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46773C007C;
	Tue, 13 Dec 2022 11:18:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55B92C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 11:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C8DE416FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 11:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C8DE416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUi6Nl95117O
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 11:18:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A927B416F6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A927B416F6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670930284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M2dtgDX/EG3rPnyUDLgsh1dHZqUvxP55J7Mazixhl88=;
 b=L63yg5Wx7mTLk8TFGfAhDMEuCrKBUF6yCVNEjNeYdQqDydjo53Cyi0E7zV8yvZh/G+4MBN
 P+q6FnYOIyzbf4sqULsDffaxvfXNdNwejrvIjrv4mTIZ1DWvHAmXQWuvE9K2SNEqHcoCns
 iKtqW2QaonwmpQKoDpQk5vCkGeDGMNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-4Oj5KdHVPcuo3UIzVD4oeA-1; Tue, 13 Dec 2022 06:18:03 -0500
X-MC-Unique: 4Oj5KdHVPcuo3UIzVD4oeA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so5507812wma.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 03:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2dtgDX/EG3rPnyUDLgsh1dHZqUvxP55J7Mazixhl88=;
 b=O3QXsqjjtwCZeH/Y3BhmcEyIHGGHdMpkTzgIVyCkALVjZ5aFGi3Ct6H+7S2lFshtvB
 pTFL7dJRMcyRJixNrw98QY/uRgZGIgWLyOR+yGXH9R6zSv7lW0AM2gTsrMiBsaAuGTOj
 un62oQLDcUQvCHKqgRV7/GdL0nUZuXe3bD5+wU2pqchv/X/NYNEehp/AYW+h6nzPx61c
 LWwbTKeLM2lTAt+LI2E6OjY4+eRb5NhzourdrKuny15cfM66co4qy5we9TzVWTiR+zhu
 pNvI63hArz5hDBjhKl9B4z7PfW7hIgQT6MBjJDCQ7vMq06rCulbiyfMkyVR+iCbUQkR1
 P5DQ==
X-Gm-Message-State: ANoB5pn51IhYOdVD5RCrRTgfXUBSAbIvGHrDd2WiAJEFe8X1WX3f1eZ3
 n6ig5iG5Fez7QhOJewjts1hh0U3pHbb9HKSoHC4iQOpLnRtessnPzJwbT/eBpOXMa5I0sc+iN6y
 l92rLJYMn88V9A0+AatdP0Ricv/LonhJ9JlyVS4Z2YA==
X-Received: by 2002:a05:6000:1e0d:b0:252:5adc:238a with SMTP id
 bj13-20020a0560001e0d00b002525adc238amr1527727wrb.33.1670930281799; 
 Tue, 13 Dec 2022 03:18:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5006NwGEbx2T0SWW1xMMoYPJQvaZbG5Tu6e6cSbuXP9dhWEtaKzValGv4BBRlWqM9kf1Wcog==
X-Received: by 2002:a05:6000:1e0d:b0:252:5adc:238a with SMTP id
 bj13-20020a0560001e0d00b002525adc238amr1527702wrb.33.1670930281491; 
 Tue, 13 Dec 2022 03:18:01 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 m18-20020adff392000000b00242109cf587sm11274758wro.28.2022.12.13.03.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 03:18:00 -0800 (PST)
Date: Tue, 13 Dec 2022 12:17:56 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Subject: Re: [RFC PATCH v4 4/4] test/vsock: vsock_perf utility
Message-ID: <20221213111756.j5qrvnqaxljoyffj@sgarzare-redhat>
References: <6be11122-7cf2-641f-abd8-6e379ee1b88f@sberdevices.ru>
 <281c876b-5c87-7ecf-f13e-1ceaf5a57371@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <281c876b-5c87-7ecf-f13e-1ceaf5a57371@sberdevices.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bobby Eshleman <bobby.eshleman@bytedance.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 Krasnov Arseniy <oxffffaa@gmail.com>, kernel <kernel@sberdevices.ru>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Dec 06, 2022 at 08:54:28PM +0000, Arseniy Krasnov wrote:
>This adds utility to check vsock rx/tx performance.
>
>Usage as sender:
>./vsock_perf --sender <cid> --port <port> --bytes <bytes to send)

Little typo "<bytes to send>". I mean replace `)` with `>`

>Usage as receiver:
>./vsock_perf --port <port> --rcvlowat <SO_RCVLOWAT>
>
>Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>---
> tools/testing/vsock/Makefile     |   3 +-
> tools/testing/vsock/README       |  34 +++
> tools/testing/vsock/vsock_perf.c | 434 +++++++++++++++++++++++++++++++
> 3 files changed, 470 insertions(+), 1 deletion(-)
> create mode 100644 tools/testing/vsock/vsock_perf.c
>
>diff --git a/tools/testing/vsock/Makefile b/tools/testing/vsock/Makefile
>index f8293c6910c9..43a254f0e14d 100644
>--- a/tools/testing/vsock/Makefile
>+++ b/tools/testing/vsock/Makefile
>@@ -1,8 +1,9 @@
> # SPDX-License-Identifier: GPL-2.0-only
>-all: test
>+all: test vsock_perf
> test: vsock_test vsock_diag_test
> vsock_test: vsock_test.o timeout.o control.o util.o
> vsock_diag_test: vsock_diag_test.o timeout.o control.o util.o
>+vsock_perf: vsock_perf.o
>
> CFLAGS += -g -O2 -Werror -Wall -I. -I../../include -I../../../usr/include -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -D_GNU_SOURCE
> .PHONY: all test clean
>diff --git a/tools/testing/vsock/README b/tools/testing/vsock/README
>index 4d5045e7d2c3..e6f6735bba05 100644
>--- a/tools/testing/vsock/README
>+++ b/tools/testing/vsock/README
>@@ -35,3 +35,37 @@ Invoke test binaries in both directions as follows:
>                        --control-port=$GUEST_IP \
>                        --control-port=1234 \
>                        --peer-cid=3
>+
>+vsock_perf utility
>+-------------------
>+'vsock_perf' is a simple tool to measure vsock performance. It works in
>+sender/receiver modes: sender connect to peer at the specified port and
>+starts data transmission to the receiver. After data processing is done,
>+it prints several metrics(see below).
>+
>+Usage:
>+# run as sender
>+# connect to CID 2, port 1234, send 1G of data, tx buf size is 1M
>+./vsock_perf --sender 2 --port 1234 --bytes 1G --buf-size 1M
>+
>+Output:
>+tx performance: A Gb/s
>+
>+Output explanation:
>+A is calculated as "number of bytes to send" / "time in tx loop"
>+
>+# run as receiver
>+# listen port 1234, rx buf size is 1M, socket buf size is 1G, SO_RCVLOWAT is 64K
>+./vsock_perf --port 1234 --buf-size 1M --vsk-size 1G --rcvlowat 64K
>+
>+Output:
>+rx performance: A Gb/s
>+total in 'read()': B sec
>+POLLIN wakeups: C
>+average in 'read()': D ns
>+
>+Output explanation:
>+A is calculated as "number of received bytes" / "time in rx loop".
>+B is time, spent in 'read()' system call(excluding 'poll()')
>+C is number of 'poll()' wake ups with POLLIN bit set.
>+D is B / C, e.g. average amount of time, spent in single 'read()'.
>diff --git a/tools/testing/vsock/vsock_perf.c b/tools/testing/vsock/vsock_perf.c
>new file mode 100644
>index 000000000000..248fc3285d5c
>--- /dev/null
>+++ b/tools/testing/vsock/vsock_perf.c
>@@ -0,0 +1,434 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/*
>+ * vsock_perf - benchmark utility for vsock.
>+ *
>+ * Copyright (C) 2022 SberDevices.
>+ *
>+ * Author: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>+ */
>+#include <getopt.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <stdbool.h>
>+#include <string.h>
>+#include <errno.h>
>+#include <unistd.h>
>+#include <time.h>
>+#include <stdint.h>
>+#include <poll.h>
>+#include <sys/socket.h>
>+#include <linux/vm_sockets.h>
>+
>+#define DEFAULT_BUF_SIZE_BYTES	(128 * 1024)
>+#define DEFAULT_TO_SEND_BYTES	(64 * 1024)
>+#define DEFAULT_VSOCK_BUF_BYTES (256 * 1024)
>+#define DEFAULT_RCVLOWAT_BYTES	1
>+#define DEFAULT_PORT		1234
>+
>+#define BYTES_PER_GB		(1024 * 1024 * 1024ULL)
>+#define NSEC_PER_SEC		(1000000000ULL)
>+
>+static unsigned int port = DEFAULT_PORT;
>+static unsigned long buf_size_bytes = DEFAULT_BUF_SIZE_BYTES;
>+static unsigned long vsock_buf_bytes = DEFAULT_VSOCK_BUF_BYTES;
>+
>+static inline time_t current_nsec(void)
>+{
>+	struct timespec ts;
>+
>+	if (clock_gettime(CLOCK_REALTIME, &ts)) {
>+		perror("clock_gettime");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	return (ts.tv_sec * NSEC_PER_SEC) + ts.tv_nsec;
>+}
>+
>+/* From lib/cmdline.c. */
>+static unsigned long memparse(const char *ptr)
>+{
>+	char *endptr;
>+
>+	unsigned long long ret = strtoull(ptr, &endptr, 0);
>+
>+	switch (*endptr) {
>+	case 'E':
>+	case 'e':
>+		ret <<= 10;
>+	case 'P':
>+	case 'p':
>+		ret <<= 10;
>+	case 'T':
>+	case 't':
>+		ret <<= 10;
>+	case 'G':
>+	case 'g':
>+		ret <<= 10;
>+	case 'M':
>+	case 'm':
>+		ret <<= 10;
>+	case 'K':
>+	case 'k':
>+		ret <<= 10;
>+		endptr++;
>+	default:
>+		break;
>+	}
>+
>+	return ret;
>+}
>+
>+static void vsock_increase_buf_size(int fd)
>+{
>+	if (setsockopt(fd, AF_VSOCK, SO_VM_SOCKETS_BUFFER_MAX_SIZE,
>+		       &vsock_buf_bytes, sizeof(vsock_buf_bytes))) {
>+		perror("setsockopt(SO_VM_SOCKETS_BUFFER_MAX_SIZE)");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (setsockopt(fd, AF_VSOCK, SO_VM_SOCKETS_BUFFER_SIZE,
>+		       &vsock_buf_bytes, sizeof(vsock_buf_bytes))) {
>+		perror("setsockopt(SO_VM_SOCKETS_BUFFER_SIZE)");
>+		exit(EXIT_FAILURE);
>+	}
>+}
>+
>+static int vsock_connect(unsigned int cid, unsigned int port)
>+{
>+	union {
>+		struct sockaddr sa;
>+		struct sockaddr_vm svm;
>+	} addr = {
>+		.svm = {
>+			.svm_family = AF_VSOCK,
>+			.svm_port = port,
>+			.svm_cid = cid,
>+		},
>+	};
>+	int fd;
>+
>+	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
>+
>+	if (fd < 0) {
>+		perror("socket");
>+		return -1;
>+	}
>+
>+	if (connect(fd, &addr.sa, sizeof(addr.svm)) < 0) {
>+		perror("connect");
>+		close(fd);
>+		return -1;
>+	}
>+
>+	return fd;
>+}
>+
>+static float get_gbps(unsigned long bytes, time_t ns_delta)
>+{
>+	return ((float)bytes / BYTES_PER_GB) /
>+	       ((float)ns_delta / NSEC_PER_SEC);
>+}
>+
>+static void run_receiver(unsigned long rcvlowat_bytes)
>+{
>+	unsigned int read_cnt;
>+	time_t rx_begin_ns;
>+	time_t in_read_ns;
>+	size_t total_recv;
>+	int client_fd;
>+	char *data;
>+	int fd;
>+	union {
>+		struct sockaddr sa;
>+		struct sockaddr_vm svm;
>+	} addr = {
>+		.svm = {
>+			.svm_family = AF_VSOCK,
>+			.svm_port = port,
>+			.svm_cid = VMADDR_CID_ANY,
>+		},
>+	};
>+	union {
>+		struct sockaddr sa;
>+		struct sockaddr_vm svm;
>+	} clientaddr;
>+
>+	socklen_t clientaddr_len = sizeof(clientaddr.svm);
>+
>+	printf("Run as receiver\n");
>+	printf("Listen port %u\n", port);
>+	printf("RX buffer %lu bytes\n", buf_size_bytes);
>+	printf("vsock buffer %lu bytes\n", vsock_buf_bytes);
>+	printf("SO_RCVLOWAT %lu bytes\n", rcvlowat_bytes);
>+
>+	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
>+
>+	if (fd < 0) {
>+		perror("socket");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (bind(fd, &addr.sa, sizeof(addr.svm)) < 0) {
>+		perror("bind");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (listen(fd, 1) < 0) {
>+		perror("listen");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	client_fd = accept(fd, &clientaddr.sa, &clientaddr_len);
>+
>+	if (client_fd < 0) {
>+		perror("accept");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	vsock_increase_buf_size(client_fd);
>+
>+	if (setsockopt(client_fd, SOL_SOCKET, SO_RCVLOWAT,
>+		       &rcvlowat_bytes,
>+		       sizeof(rcvlowat_bytes))) {
>+		perror("setsockopt(SO_RCVLOWAT)");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	data = malloc(buf_size_bytes);
>+
>+	if (!data) {
>+		printf("malloc failed\n");

This is an error message, so we can use fprintf(stderr, ...)

>+		exit(EXIT_FAILURE);
>+	}
>+
>+	read_cnt = 0;
>+	in_read_ns = 0;
>+	total_recv = 0;
>+	rx_begin_ns = current_nsec();
>+
>+	while (1) {
>+		struct pollfd fds = { 0 };
>+
>+		fds.fd = client_fd;
>+		fds.events = POLLIN | POLLERR |
>+			     POLLHUP | POLLRDHUP;
>+
>+		if (poll(&fds, 1, -1) < 0) {
>+			perror("poll");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		if (fds.revents & POLLERR) {
>+			printf("'poll()' error\n");

Ditto.

>+			exit(EXIT_FAILURE);
>+		}
>+
>+		if (fds.revents & POLLIN) {
>+			ssize_t bytes_read;
>+			time_t t;
>+
>+			t = current_nsec();
>+			bytes_read = read(fds.fd, data, buf_size_bytes);
>+			in_read_ns += (current_nsec() - t);
>+			read_cnt++;
>+
>+			if (!bytes_read)
>+				break;
>+
>+			if (bytes_read < 0) {
>+				perror("read");
>+				exit(EXIT_FAILURE);
>+			}
>+
>+			total_recv += bytes_read;
>+		}
>+
>+		if (fds.revents & (POLLHUP | POLLRDHUP))
>+			break;
>+	}
>+
>+	printf("rx performance: %f Gb/s\n",
>+	       get_gbps(total_recv, current_nsec() - rx_begin_ns));
>+	printf("total time in 'read()': %f sec\n", (float)in_read_ns / NSEC_PER_SEC);
>+	printf("POLLIN wakeups: %i\n", read_cnt);
>+	printf("average time in 'read()': %f ns\n", (float)in_read_ns / read_cnt);
>+
>+	free(data);
>+	close(client_fd);
>+	close(fd);
>+}
>+
>+static void run_sender(int peer_cid, unsigned long to_send_bytes)
>+{
>+	time_t tx_begin_ns;
>+	size_t total_send;
>+	void *data;
>+	int fd;
>+
>+	printf("Run as sender\n");
>+	printf("Connect to %i:%u\n", peer_cid, port);
>+	printf("Send %lu bytes\n", to_send_bytes);
>+	printf("TX buffer %lu bytes\n", buf_size_bytes);
>+
>+	fd = vsock_connect(peer_cid, port);
>+
>+	if (fd < 0)
>+		exit(EXIT_FAILURE);
>+
>+	data = malloc(buf_size_bytes);
>+
>+	if (!data) {
>+		printf("malloc failed\n");

Ditto.

>+		exit(EXIT_FAILURE);
>+	}
>+
>+	memset(data, 0, buf_size_bytes);
>+	total_send = 0;
>+	tx_begin_ns = current_nsec();
>+
>+	while (total_send < to_send_bytes) {
>+		ssize_t sent;
>+
>+		sent = write(fd, data, buf_size_bytes);
>+
>+		if (sent <= 0) {
>+			perror("write");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		total_send += sent;
>+	}

I don't know if it would be useful, but maybe we can also print the 
total number of bytes and the time spent (the same in the receiver as 
well).

Here I would add

         tx_end_ns = current_nsec();

Then use it later.

>+
>+	printf("tx performance: %f Gb/s\n",
>+	       get_gbps(total_send, current_nsec() - tx_begin_ns));
>+

Did you compared the performance with iperf-vsock and uperf?

I see an order of magnitude difference but I did not have time to check 
all the parameters to make a fair comparison. It would be helpful if you 
can compare and report it.

Thanks,
Stefano

>+	close(fd);
>+	free(data);
>+}
>+
>+static const char optstring[] = "";
>+static const struct option longopts[] = {
>+	{
>+		.name = "help",
>+		.has_arg = no_argument,
>+		.val = 'H',
>+	},
>+	{
>+		.name = "sender",
>+		.has_arg = required_argument,
>+		.val = 'S',
>+	},
>+	{
>+		.name = "port",
>+		.has_arg = required_argument,
>+		.val = 'P',
>+	},
>+	{
>+		.name = "bytes",
>+		.has_arg = required_argument,
>+		.val = 'M',
>+	},
>+	{
>+		.name = "buf-size",
>+		.has_arg = required_argument,
>+		.val = 'B',
>+	},
>+	{
>+		.name = "vsk-size",
>+		.has_arg = required_argument,
>+		.val = 'V',
>+	},
>+	{
>+		.name = "rcvlowat",
>+		.has_arg = required_argument,
>+		.val = 'R',
>+	},
>+	{},
>+};
>+
>+static void usage(void)
>+{
>+	printf("Usage: ./vsock_perf [--help] [options]\n"
>+	       "\n"
>+	       "This is benchmarking utility, to test vsock performance.\n"
>+	       "It runs in two modes: sender or receiver. In sender mode, it\n"
>+	       "connects to the specified CID and starts data transmission.\n"
>+	       "\n"
>+	       "Options:\n"
>+	       "  --help			This message\n"
>+	       "  --sender   <cid>		Sender mode (receiver default)\n"
>+	       "                                <cid> of the receiver to connect to\n"
>+	       "  --port     <port>		Port (default %d)\n"
>+	       "  --bytes    <bytes>KMG		Bytes to send (default %d)\n"
>+	       "  --buf-size <bytes>KMG		Data buffer size (default %d). In sender mode\n"
>+	       "                                it is the buffer size, passed to 'write()'. In\n"
>+	       "                                receiver mode it is the buffer size passed to 'read()'.\n"
>+	       "  --vsk-size <bytes>KMG		Socket buffer size (default %d)\n"
>+	       "  --rcvlowat <bytes>KMG		SO_RCVLOWAT value (default %d)\n"
>+	       "\n", DEFAULT_PORT, DEFAULT_TO_SEND_BYTES,
>+	       DEFAULT_BUF_SIZE_BYTES, DEFAULT_VSOCK_BUF_BYTES,
>+	       DEFAULT_RCVLOWAT_BYTES);
>+	exit(EXIT_FAILURE);
>+}
>+
>+static long strtolx(const char *arg)
>+{
>+	long value;
>+	char *end;
>+
>+	value = strtol(arg, &end, 10);
>+
>+	if (end != arg + strlen(arg))
>+		usage();
>+
>+	return value;
>+}
>+
>+int main(int argc, char **argv)
>+{
>+	unsigned long to_send_bytes = DEFAULT_TO_SEND_BYTES;
>+	unsigned long rcvlowat_bytes = DEFAULT_RCVLOWAT_BYTES;
>+	int peer_cid = -1;
>+	bool sender = false;
>+
>+	while (1) {
>+		int opt = getopt_long(argc, argv, optstring, longopts, NULL);
>+
>+		if (opt == -1)
>+			break;
>+
>+		switch (opt) {
>+		case 'V': /* Peer buffer size. */
>+			vsock_buf_bytes = memparse(optarg);
>+			break;
>+		case 'R': /* SO_RCVLOWAT value. */
>+			rcvlowat_bytes = memparse(optarg);
>+			break;
>+		case 'P': /* Port to connect to. */
>+			port = strtolx(optarg);
>+			break;
>+		case 'M': /* Bytes to send. */
>+			to_send_bytes = memparse(optarg);
>+			break;
>+		case 'B': /* Size of rx/tx buffer. */
>+			buf_size_bytes = memparse(optarg);
>+			break;
>+		case 'S': /* Sender mode. CID to connect to. */
>+			peer_cid = strtolx(optarg);
>+			sender = true;
>+			break;
>+		case 'H': /* Help. */
>+			usage();
>+			break;
>+		default:
>+			usage();
>+		}
>+	}
>+
>+	if (!sender)
>+		run_receiver(rcvlowat_bytes);
>+	else
>+		run_sender(peer_cid, to_send_bytes);
>+
>+	return 0;
>+}
>-- 
>2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
