Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BBD7AED61
	for <lists.virtualization@lfdr.de>; Tue, 26 Sep 2023 14:57:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0813C614BD;
	Tue, 26 Sep 2023 12:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0813C614BD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4IgWsLn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rrlmre0eC666; Tue, 26 Sep 2023 12:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 21AF5614E1;
	Tue, 26 Sep 2023 12:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21AF5614E1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D9B7C008C;
	Tue, 26 Sep 2023 12:57:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF9BC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDE0B614BD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE0B614BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_9OA6QqZNPg
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:57:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50223614E0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50223614E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695733026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bkrfd5uNYi1l8I8UjtC3dqhal18TSsmdQf1YM3qxm/0=;
 b=A4IgWsLnriYcVMo5qmTLC+v7fNKfqmGjMH9OeRJOiRc5tMhfyJhwCyqZphmx4/zo6eyUII
 xtUPiuR/XgD8xcrdyHgj13AO0m8NiIJssv8y0zR/0aSESS9L9rwmcl3+NpOAaHWhmYVbUX
 mhi9fCws7qita8724NWwF5D/jC1tBM8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-97CKgyD4Pvu7as0Cn_q1Lw-1; Tue, 26 Sep 2023 08:57:04 -0400
X-MC-Unique: 97CKgyD4Pvu7as0Cn_q1Lw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9adc78b386cso701917966b.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 05:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695733023; x=1696337823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkrfd5uNYi1l8I8UjtC3dqhal18TSsmdQf1YM3qxm/0=;
 b=YcilZ/e5c7WBEbR5ieOlpIRsH8zBbZaJ/1A2V7B8Q8SHq23J3cN51UkvV9HhHh0E/q
 uhvoDfC2+Mv60mQo4NIRADHzp5CctmCsYzTefXpvxUspUKh+iX3fIs0Y0xNSPTtn062r
 NeDmm/aDmmASAa+rSk9V61+Wb2AsPUrH767F91hv0evb9at0mJNfsjYmtfFNr8+P2DAd
 1UjcUnBBauFQ7Fvcbo4MhClg9oDvzrd5Vu/URthtjooUlJ07F8KMSK8ydd6lAABFj3SF
 z2NKKSTNi7fM2pgZEphCnG8c9sNilx3aKOZHVhdHpTQU/xpG+EkHC9eZFrwSAqWQKvcC
 Tv9w==
X-Gm-Message-State: AOJu0Yw0T19D/B1jiC6xbfpYyUQ8VeDxUI42fCj3qRgAs127qjttrAjM
 L5b89Dq5zxqcPwBthP8WyZxU7T6vMwO+oSKpBP2igolc0r5x0CEgqnKH3rS9rWBv5JX0HsSHyYz
 oWCCscU0glF5qE+XbN0gd6nbjWB4VQiS3tUkRWjyQxQ==
X-Received: by 2002:a17:906:738d:b0:99e:f3b:2f78 with SMTP id
 f13-20020a170906738d00b0099e0f3b2f78mr8432056ejl.67.1695733023416; 
 Tue, 26 Sep 2023 05:57:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH5/kv3UK0lmTqM1W/u88/1/swZha+PsCWp77fIGhvQZh1TZ/z82LxdxAyZKrRFcNanL6RoA==
X-Received: by 2002:a17:906:738d:b0:99e:f3b:2f78 with SMTP id
 f13-20020a170906738d00b0099e0f3b2f78mr8432037ejl.67.1695733023066; 
 Tue, 26 Sep 2023 05:57:03 -0700 (PDT)
Received: from sgarzare-redhat ([46.6.146.182])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a1709061cd000b00991e2b5a27dsm7737684ejh.37.2023.09.26.05.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 05:57:02 -0700 (PDT)
Date: Tue, 26 Sep 2023 14:56:58 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH net-next v1 10/12] test/vsock: MSG_ZEROCOPY flag tests
Message-ID: <qmjwxf242foundkffm2xs7m52v4pyq2wskkhqntm4rgid2sqxx@3ct6wjlndlyl>
References: <20230922052428.4005676-1-avkrasnov@salutedevices.com>
 <20230922052428.4005676-11-avkrasnov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20230922052428.4005676-11-avkrasnov@salutedevices.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bobby Eshleman <bobby.eshleman@bytedance.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Eric Dumazet <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, kernel@sberdevices.ru,
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

On Fri, Sep 22, 2023 at 08:24:26AM +0300, Arseniy Krasnov wrote:
>This adds three tests for MSG_ZEROCOPY feature:
>1) SOCK_STREAM tx with different buffers.
>2) SOCK_SEQPACKET tx with different buffers.
>3) SOCK_STREAM test to read empty error queue of the socket.
>
>Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
>---
> tools/testing/vsock/Makefile              |   2 +-
> tools/testing/vsock/util.c                | 222 +++++++++++++++
> tools/testing/vsock/util.h                |  19 ++
> tools/testing/vsock/vsock_test.c          |  16 ++
> tools/testing/vsock/vsock_test_zerocopy.c | 314 ++++++++++++++++++++++
> tools/testing/vsock/vsock_test_zerocopy.h |  15 ++
> 6 files changed, 587 insertions(+), 1 deletion(-)
> create mode 100644 tools/testing/vsock/vsock_test_zerocopy.c
> create mode 100644 tools/testing/vsock/vsock_test_zerocopy.h
>
>diff --git a/tools/testing/vsock/Makefile b/tools/testing/vsock/Makefile
>index 21a98ba565ab..1a26f60a596c 100644
>--- a/tools/testing/vsock/Makefile
>+++ b/tools/testing/vsock/Makefile
>@@ -1,7 +1,7 @@
> # SPDX-License-Identifier: GPL-2.0-only
> all: test vsock_perf
> test: vsock_test vsock_diag_test
>-vsock_test: vsock_test.o timeout.o control.o util.o
>+vsock_test: vsock_test.o vsock_test_zerocopy.o timeout.o control.o util.o
> vsock_diag_test: vsock_diag_test.o timeout.o control.o util.o
> vsock_perf: vsock_perf.o
>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index 6779d5008b27..d531dbbfa8ff 100644
>--- a/tools/testing/vsock/util.c
>+++ b/tools/testing/vsock/util.c
>@@ -11,15 +11,27 @@
> #include <stdio.h>
> #include <stdint.h>
> #include <stdlib.h>
>+#include <string.h>
> #include <signal.h>
> #include <unistd.h>
> #include <assert.h>
> #include <sys/epoll.h>
>+#include <sys/mman.h>
>+#include <linux/errqueue.h>
>+#include <poll.h>
>
> #include "timeout.h"
> #include "control.h"
> #include "util.h"
>
>+#ifndef SOL_VSOCK
>+#define SOL_VSOCK	287
>+#endif
>+
>+#ifndef VSOCK_RECVERR
>+#define VSOCK_RECVERR	1
>+#endif

Maybe better to re-define them in util.h where we include vm_socktes.h

>+
> /* Install signal handlers */
> void init_signals(void)
> {
>@@ -444,3 +456,213 @@ unsigned long hash_djb2(const void *data, size_t len)
>
> 	return hash;
> }
>+
>+void enable_so_zerocopy(int fd)
>+{
>+	int val = 1;
>+
>+	if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &val, sizeof(val))) {
>+		perror("setsockopt");
>+		exit(EXIT_FAILURE);
>+	}
>+}
>+
>+static void *mmap_no_fail(size_t bytes)
>+{
>+	void *res;
>+
>+	res = mmap(NULL, bytes, PROT_READ | PROT_WRITE,
>+		   MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
>+	if (res == MAP_FAILED) {
>+		perror("mmap");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	return res;
>+}
>+
>+size_t iovec_bytes(const struct iovec *iov, size_t iovnum)
>+{
>+	size_t bytes;
>+	int i;
>+
>+	for (bytes = 0, i = 0; i < iovnum; i++)
>+		bytes += iov[i].iov_len;
>+
>+	return bytes;
>+}
>+
>+static void iovec_random_init(struct iovec *iov,
>+			      const struct vsock_test_data *test_data)
>+{
>+	int i;
>+
>+	for (i = 0; i < test_data->vecs_cnt; i++) {
>+		int j;
>+
>+		if (test_data->vecs[i].iov_base == MAP_FAILED)
>+			continue;
>+
>+		for (j = 0; j < iov[i].iov_len; j++)
>+			((uint8_t *)iov[i].iov_base)[j] = rand() & 0xff;
>+	}
>+}
>+
>+unsigned long iovec_hash_djb2(struct iovec *iov, size_t iovnum)
>+{
>+	unsigned long hash;
>+	size_t iov_bytes;
>+	size_t offs;
>+	void *tmp;
>+	int i;
>+
>+	iov_bytes = iovec_bytes(iov, iovnum);
>+
>+	tmp = malloc(iov_bytes);
>+	if (!tmp) {
>+		perror("malloc");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	for (offs = 0, i = 0; i < iovnum; i++) {
>+		memcpy(tmp + offs, iov[i].iov_base, iov[i].iov_len);
>+		offs += iov[i].iov_len;
>+	}
>+
>+	hash = hash_djb2(tmp, iov_bytes);
>+	free(tmp);
>+
>+	return hash;
>+}
>+
>+struct iovec *iovec_from_test_data(const struct vsock_test_data *test_data)
>+{
>+	const struct iovec *test_iovec;
>+	struct iovec *iovec;
>+	int i;
>+
>+	iovec = malloc(sizeof(*iovec) * test_data->vecs_cnt);
>+	if (!iovec) {
>+		perror("malloc");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	test_iovec = test_data->vecs;
>+
>+	for (i = 0; i < test_data->vecs_cnt; i++) {
>+		iovec[i].iov_len = test_iovec[i].iov_len;
>+		iovec[i].iov_base = mmap_no_fail(test_iovec[i].iov_len);
>+
>+		if (test_iovec[i].iov_base != MAP_FAILED &&
>+		    test_iovec[i].iov_base)
>+			iovec[i].iov_base += (uintptr_t)test_iovec[i].iov_base;
>+	}
>+
>+	/* Unmap "invalid" elements. */
>+	for (i = 0; i < test_data->vecs_cnt; i++) {
>+		if (test_iovec[i].iov_base == MAP_FAILED) {
>+			if (munmap(iovec[i].iov_base, iovec[i].iov_len)) {
>+				perror("munmap");
>+				exit(EXIT_FAILURE);
>+			}
>+		}
>+	}
>+
>+	iovec_random_init(iovec, test_data);
>+
>+	return iovec;
>+}
>+
>+void free_iovec_test_data(const struct vsock_test_data *test_data,
>+			  struct iovec *iovec)
>+{
>+	int i;
>+
>+	for (i = 0; i < test_data->vecs_cnt; i++) {
>+		if (test_data->vecs[i].iov_base != MAP_FAILED) {
>+			if (test_data->vecs[i].iov_base)
>+				iovec[i].iov_base -= (uintptr_t)test_data->vecs[i].iov_base;
>+
>+			if (munmap(iovec[i].iov_base, iovec[i].iov_len)) {
>+				perror("munmap");
>+				exit(EXIT_FAILURE);
>+			}
>+		}
>+	}
>+
>+	free(iovec);
>+}
>+
>+#define POLL_TIMEOUT_MS		100
>+void vsock_recv_completion(int fd, bool zerocopied, bool completion)
>+{
>+	struct sock_extended_err *serr;
>+	struct msghdr msg = { 0 };
>+	struct pollfd fds = { 0 };
>+	char cmsg_data[128];
>+	struct cmsghdr *cm;
>+	ssize_t res;
>+
>+	fds.fd = fd;
>+	fds.events = 0;
>+
>+	if (poll(&fds, 1, POLL_TIMEOUT_MS) < 0) {
>+		perror("poll");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (!(fds.revents & POLLERR)) {
>+		if (completion) {
>+			fprintf(stderr, "POLLERR expected\n");
>+			exit(EXIT_FAILURE);
>+		} else {
>+			return;
>+		}
>+	}
>+
>+	msg.msg_control = cmsg_data;
>+	msg.msg_controllen = sizeof(cmsg_data);
>+
>+	res = recvmsg(fd, &msg, MSG_ERRQUEUE);
>+	if (res) {
>+		fprintf(stderr, "failed to read error queue: %zi\n", res);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	cm = CMSG_FIRSTHDR(&msg);
>+	if (!cm) {
>+		fprintf(stderr, "cmsg: no cmsg\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (cm->cmsg_level != SOL_VSOCK) {
>+		fprintf(stderr, "cmsg: unexpected 'cmsg_level'\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (cm->cmsg_type != VSOCK_RECVERR) {
>+		fprintf(stderr, "cmsg: unexpected 'cmsg_type'\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	serr = (void *)CMSG_DATA(cm);
>+	if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
>+		fprintf(stderr, "serr: wrong origin: %u\n", serr->ee_origin);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (serr->ee_errno) {
>+		fprintf(stderr, "serr: wrong error code: %u\n", serr->ee_errno);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (zerocopied && (serr->ee_code & SO_EE_CODE_ZEROCOPY_COPIED)) {
>+		fprintf(stderr, "serr: was copy instead of zerocopy\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (!zerocopied && !(serr->ee_code & SO_EE_CODE_ZEROCOPY_COPIED)) {
>+		fprintf(stderr, "serr: was zerocopy instead of copy\n");
>+		exit(EXIT_FAILURE);
>+	}
>+}
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index e5407677ce05..8656a5ae63aa 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -2,6 +2,7 @@
> #ifndef UTIL_H
> #define UTIL_H
>
>+#include <stdbool.h>
> #include <sys/socket.h>
> #include <linux/vm_sockets.h>
>
>@@ -18,6 +19,17 @@ struct test_opts {
> 	unsigned int peer_cid;
> };
>
>+#define VSOCK_TEST_DATA_MAX_IOV 4
>+
>+struct vsock_test_data {
>+	bool stream_only;	/* Only for SOCK_STREAM. */
>+	bool zerocopied;	/* Data must be zerocopied. */
>+	bool so_zerocopy;	/* Enable zerocopy mode. */
>+	int sendmsg_errno;	/* 'errno' after 'sendmsg()'. */
>+	int vecs_cnt;		/* Number of elements in 'vecs'. */
>+	struct iovec vecs[VSOCK_TEST_DATA_MAX_IOV];
>+};
>+
> /* A test case definition.  Test functions must print failures to stderr and
>  * terminate with exit(EXIT_FAILURE).
>  */
>@@ -53,4 +65,11 @@ void list_tests(const struct test_case *test_cases);
> void skip_test(struct test_case *test_cases, size_t test_cases_len,
> 	       const char *test_id_str);
> unsigned long hash_djb2(const void *data, size_t len);
>+void enable_so_zerocopy(int fd);
>+size_t iovec_bytes(const struct iovec *iov, size_t iovnum);
>+unsigned long iovec_hash_djb2(struct iovec *iov, size_t iovnum);
>+struct iovec *iovec_from_test_data(const struct vsock_test_data *test_data);
>+void free_iovec_test_data(const struct vsock_test_data *test_data,
>+			  struct iovec *iovec);
>+void vsock_recv_completion(int fd, bool zerocopied, bool completion);
> #endif /* UTIL_H */
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index da4cb819a183..c1f7bc9abd22 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -21,6 +21,7 @@
> #include <poll.h>
> #include <signal.h>
>
>+#include "vsock_test_zerocopy.h"
> #include "timeout.h"
> #include "control.h"
> #include "util.h"
>@@ -1269,6 +1270,21 @@ static struct test_case test_cases[] = {
> 		.run_client = test_stream_shutrd_client,
> 		.run_server = test_stream_shutrd_server,
> 	},
>+	{
>+		.name = "SOCK_STREAM MSG_ZEROCOPY",
>+		.run_client = test_stream_msgzcopy_client,
>+		.run_server = test_stream_msgzcopy_server,
>+	},
>+	{
>+		.name = "SOCK_SEQPACKET MSG_ZEROCOPY",
>+		.run_client = test_seqpacket_msgzcopy_client,
>+		.run_server = test_seqpacket_msgzcopy_server,
>+	},
>+	{
>+		.name = "SOCK_STREAM MSG_ZEROCOPY empty MSG_ERRQUEUE",
>+		.run_client = test_stream_msgzcopy_empty_errq_client,
>+		.run_server = test_stream_msgzcopy_empty_errq_server,
>+	},
> 	{},
> };
>
>diff --git a/tools/testing/vsock/vsock_test_zerocopy.c b/tools/testing/vsock/vsock_test_zerocopy.c
>new file mode 100644
>index 000000000000..6968555d3611
>--- /dev/null
>+++ b/tools/testing/vsock/vsock_test_zerocopy.c
>@@ -0,0 +1,314 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/* MSG_ZEROCOPY feature tests for vsock
>+ *
>+ * Copyright (C) 2023 SaluteDevices.
>+ *
>+ * Author: Arseniy Krasnov <avkrasnov@salutedevices.com>
>+ */
>+
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+#include <sys/mman.h>
>+#include <unistd.h>
>+#include <poll.h>
>+#include <linux/errqueue.h>
>+#include <linux/kernel.h>
>+#include <errno.h>
>+
>+#include "control.h"
>+#include "vsock_test_zerocopy.h"
>+
>+#define PAGE_SIZE		4096
>+
>+static struct vsock_test_data test_data_array[] = {
>+	/* Last element has non-page aligned size. */
>+	{
>+		.zerocopied = true,
>+		.so_zerocopy = true,
>+		.sendmsg_errno = 0,
>+		.vecs_cnt = 3,
>+		{
>+			{ NULL, PAGE_SIZE },
>+			{ NULL, PAGE_SIZE },
>+			{ NULL, 200 }
>+		}
>+	},
>+	/* All elements have page aligned base and size. */
>+	{
>+		.zerocopied = true,
>+		.so_zerocopy = true,
>+		.sendmsg_errno = 0,
>+		.vecs_cnt = 3,
>+		{
>+			{ NULL, PAGE_SIZE },
>+			{ NULL, PAGE_SIZE * 2 },
>+			{ NULL, PAGE_SIZE * 3 }
>+		}
>+	},
>+	/* All elements have page aligned base and size. But
>+	 * data length is bigger than 64Kb.
>+	 */
>+	{
>+		.zerocopied = true,
>+		.so_zerocopy = true,
>+		.sendmsg_errno = 0,
>+		.vecs_cnt = 3,
>+		{
>+			{ NULL, PAGE_SIZE * 16 },
>+			{ NULL, PAGE_SIZE * 16 },
>+			{ NULL, PAGE_SIZE * 16 }
>+		}
>+	},
>+	/* Middle element has both non-page aligned base and size. */
>+	{
>+		.zerocopied = true,
>+		.so_zerocopy = true,
>+		.sendmsg_errno = 0,
>+		.vecs_cnt = 3,
>+		{
>+			{ NULL, PAGE_SIZE },
>+			{ (void *)1, 100 },
>+			{ NULL, PAGE_SIZE }
>+		}
>+	},
>+	/* Middle element is unmapped. */
>+	{
>+		.zerocopied = false,
>+		.so_zerocopy = true,
>+		.sendmsg_errno = ENOMEM,
>+		.vecs_cnt = 3,
>+		{
>+			{ NULL, PAGE_SIZE },
>+			{ MAP_FAILED, PAGE_SIZE },
>+			{ NULL, PAGE_SIZE }
>+		}
>+	},
>+	/* Valid data, but SO_ZEROCOPY is off. This
>+	 * will trigger fallback to copy.
>+	 */
>+	{
>+		.zerocopied = false,
>+		.so_zerocopy = false,
>+		.sendmsg_errno = 0,
>+		.vecs_cnt = 1,
>+		{
>+			{ NULL, PAGE_SIZE }
>+		}
>+	},
>+	/* Valid data, but message is bigger than peer's
>+	 * buffer, so this will trigger fallback to copy.
>+	 * This test is for SOCK_STREAM only, because
>+	 * for SOCK_SEQPACKET, 'sendmsg()' returns EMSGSIZE.
>+	 */
>+	{
>+		.stream_only = true,
>+		.zerocopied = false,
>+		.so_zerocopy = true,
>+		.sendmsg_errno = 0,
>+		.vecs_cnt = 1,
>+		{
>+			{ NULL, 100 * PAGE_SIZE }
>+		}
>+	},
>+};
>+
>+static void test_client(const struct test_opts *opts,
>+			const struct vsock_test_data *test_data,
>+			bool sock_seqpacket)
>+{
>+	struct msghdr msg = { 0 };
>+	ssize_t sendmsg_res;
>+	struct iovec *iovec;
>+	int fd;
>+
>+	if (sock_seqpacket)
>+		fd = vsock_seqpacket_connect(opts->peer_cid, 1234);
>+	else
>+		fd = vsock_stream_connect(opts->peer_cid, 1234);
>+
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (test_data->so_zerocopy)
>+		enable_so_zerocopy(fd);
>+
>+	iovec = iovec_from_test_data(test_data);
>+
>+	msg.msg_iov = iovec;
>+	msg.msg_iovlen = test_data->vecs_cnt;
>+
>+	errno = 0;
>+
>+	sendmsg_res = sendmsg(fd, &msg, MSG_ZEROCOPY);
>+	if (errno != test_data->sendmsg_errno) {
>+		fprintf(stderr, "expected 'errno' == %i, got %i\n",
>+			test_data->sendmsg_errno, errno);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (!errno) {
>+		if (sendmsg_res != iovec_bytes(iovec, test_data->vecs_cnt)) {
>+			fprintf(stderr, "expected 'sendmsg()' == %li, got %li\n",
>+				iovec_bytes(iovec, test_data->vecs_cnt),
>+				sendmsg_res);
>+			exit(EXIT_FAILURE);
>+		}
>+	}
>+
>+	/* Receive completion only in case of successful 'sendmsg()'. */
>+	vsock_recv_completion(fd, test_data->zerocopied,
>+			      test_data->so_zerocopy && !test_data->sendmsg_errno);
>+
>+	if (!test_data->sendmsg_errno)
>+		control_writeulong(iovec_hash_djb2(iovec, test_data->vecs_cnt));
>+	else
>+		control_writeulong(0);
>+
>+	control_writeln("DONE");
>+	free_iovec_test_data(test_data, iovec);
>+	close(fd);
>+}
>+
>+void test_stream_msgzcopy_client(const struct test_opts *opts)
>+{
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(test_data_array); i++)
>+		test_client(opts, &test_data_array[i], false);
>+}
>+
>+void test_seqpacket_msgzcopy_client(const struct test_opts *opts)
>+{
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(test_data_array); i++) {
>+		if (test_data_array[i].stream_only)
>+			continue;
>+
>+		test_client(opts, &test_data_array[i], true);
>+	}
>+}
>+
>+static void test_server(const struct test_opts *opts,
>+			const struct vsock_test_data *test_data,
>+			bool sock_seqpacket)
>+{
>+	unsigned long remote_hash;
>+	unsigned long local_hash;
>+	ssize_t total_bytes_rec;
>+	unsigned char *data;
>+	size_t data_len;
>+	int fd;
>+
>+	if (sock_seqpacket)
>+		fd = vsock_seqpacket_accept(VMADDR_CID_ANY, 1234, NULL);
>+	else
>+		fd = vsock_stream_accept(VMADDR_CID_ANY, 1234, NULL);
>+
>+	if (fd < 0) {
>+		perror("accept");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	data_len = iovec_bytes(test_data->vecs, test_data->vecs_cnt);
>+
>+	data = malloc(data_len);
>+	if (!data) {
>+		perror("malloc");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	total_bytes_rec = 0;
>+
>+	while (total_bytes_rec != data_len) {
>+		ssize_t bytes_rec;
>+
>+		bytes_rec = read(fd, data + total_bytes_rec,
>+				 data_len - total_bytes_rec);
>+		if (bytes_rec <= 0)
>+			break;
>+
>+		total_bytes_rec += bytes_rec;
>+	}
>+
>+	if (test_data->sendmsg_errno == 0)
>+		local_hash = hash_djb2(data, data_len);
>+	else
>+		local_hash = 0;
>+
>+	free(data);
>+
>+	/* Waiting for some result. */
>+	remote_hash = control_readulong();
>+	if (remote_hash != local_hash) {
>+		fprintf(stderr, "hash mismatch\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_expectln("DONE");
>+	close(fd);
>+}
>+
>+void test_stream_msgzcopy_server(const struct test_opts *opts)
>+{
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(test_data_array); i++)
>+		test_server(opts, &test_data_array[i], false);
>+}
>+
>+void test_seqpacket_msgzcopy_server(const struct test_opts *opts)
>+{
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(test_data_array); i++) {
>+		if (test_data_array[i].stream_only)
>+			continue;
>+
>+		test_server(opts, &test_data_array[i], true);
>+	}
>+}
>+
>+void test_stream_msgzcopy_empty_errq_client(const struct test_opts *opts)
>+{
>+	struct msghdr msg = { 0 };
>+	char cmsg_data[128];
>+	ssize_t res;
>+	int fd;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, 1234);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	msg.msg_control = cmsg_data;
>+	msg.msg_controllen = sizeof(cmsg_data);
>+
>+	res = recvmsg(fd, &msg, MSG_ERRQUEUE);
>+	if (res != -1) {
>+		fprintf(stderr, "expected 'recvmsg(2)' failure, got %zi\n",
>+			res);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_writeln("DONE");
>+	close(fd);
>+}
>+
>+void test_stream_msgzcopy_empty_errq_server(const struct test_opts *opts)
>+{
>+	int fd;
>+
>+	fd = vsock_stream_accept(VMADDR_CID_ANY, 1234, NULL);
>+	if (fd < 0) {
>+		perror("accept");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_expectln("DONE");
>+	close(fd);
>+}
>diff --git a/tools/testing/vsock/vsock_test_zerocopy.h b/tools/testing/vsock/vsock_test_zerocopy.h
>new file mode 100644
>index 000000000000..3ef2579e024d
>--- /dev/null
>+++ b/tools/testing/vsock/vsock_test_zerocopy.h
>@@ -0,0 +1,15 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+#ifndef VSOCK_TEST_ZEROCOPY_H
>+#define VSOCK_TEST_ZEROCOPY_H
>+#include "util.h"
>+
>+void test_stream_msgzcopy_client(const struct test_opts *opts);
>+void test_stream_msgzcopy_server(const struct test_opts *opts);
>+
>+void test_seqpacket_msgzcopy_client(const struct test_opts *opts);
>+void test_seqpacket_msgzcopy_server(const struct test_opts *opts);
>+
>+void test_stream_msgzcopy_empty_errq_client(const struct test_opts *opts);
>+void test_stream_msgzcopy_empty_errq_server(const struct test_opts *opts);
>+
>+#endif /* VSOCK_TEST_ZEROCOPY_H */
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
