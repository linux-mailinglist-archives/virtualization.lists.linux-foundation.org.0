Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2553A625C22
	for <lists.virtualization@lfdr.de>; Fri, 11 Nov 2022 15:01:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E30660FAB;
	Fri, 11 Nov 2022 14:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E30660FAB
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBf8enAJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXPWejTfmxBe; Fri, 11 Nov 2022 14:00:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1376960FAC;
	Fri, 11 Nov 2022 14:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1376960FAC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42BF0C0077;
	Fri, 11 Nov 2022 14:00:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B771C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Nov 2022 14:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28CAC60FAC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Nov 2022 14:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CAC60FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyzY1MEVcYnE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Nov 2022 14:00:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CE260FAB
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28CE260FAB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Nov 2022 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668175254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pblMlJlKTIR8aJeFOPL5URVyWNBrrDqkWQ8RWbtRpDI=;
 b=hBf8enAJMCaKpGwMrYiFpRWLdQ7hgrOkxqGFKdojAMaV3iBkx7mShbAgpCEJWB0NZrwko9
 0h0xCrOeV2QQ6+u4PqZdC5yplSqDpumL2cmbKxmVQf+/DqM94M/plL8ogdatDJ16wIL9rF
 sZxtAo5sEiznaiRNhEpEPqKzjiZXNAI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-fbBX4EztPPK8PevORnTvfA-1; Fri, 11 Nov 2022 09:00:52 -0500
X-MC-Unique: fbBX4EztPPK8PevORnTvfA-1
Received: by mail-qt1-f199.google.com with SMTP id
 g3-20020ac84b63000000b003a529c62a92so3684100qts.23
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Nov 2022 06:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pblMlJlKTIR8aJeFOPL5URVyWNBrrDqkWQ8RWbtRpDI=;
 b=Io/uwah2BvgW0P55IOOJA5l8BnuLRLuSePVFr1w6iEWERIzj5kAH4oHSMY7cghjBq0
 zkNmA9tJ8IRLhBhp3gWPVgZjI2bKKdDfSYu49lA+ImwbCWhVSXewu85pc9vo5M4AFUGs
 WSTugI6nmmUJEubaO67duqEY2m4XgNybMZBlC/IIiES6hTZuBYpT1A4ptRYEO+cSUjV/
 rbNv2hZzppt6hFByJfyhZDfApwSpJzrtau2094GnHbfxty60nc6xRb85i6YpqJnQn72u
 0L9XBU/j9FT96iVTz5xe7E9G34gFbIyJRAld02lkqbRGatsQMQMIaJbvdnn+U73w3ou3
 hMUQ==
X-Gm-Message-State: ANoB5pkkIeAgzKLLmLUcNo24g6dphb2XgV00dXGUACoZatCrLuehy2CR
 HlUcP2khSUjQew26HTYoGl08UhrFUwD6Y5blbwaPK6cbRDHq3Kz1FfOJD1aAqOUJ6rCXH9w6Bd+
 YJ9x6c7/OTcfi6SS1HO0iYOgEcHhr4BAxYbOJXqXH/g==
X-Received: by 2002:a05:6214:4585:b0:4bc:9d7f:d963 with SMTP id
 op5-20020a056214458500b004bc9d7fd963mr1855169qvb.83.1668175251447; 
 Fri, 11 Nov 2022 06:00:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5VYy7bzsdKQg8e1ZZTpNjm7LiX0ZvLnQN/bOtw1CJKLdMCGMeAEZ1pQQG1Mlh0aVEgGkhR3g==
X-Received: by 2002:a05:6214:4585:b0:4bc:9d7f:d963 with SMTP id
 op5-20020a056214458500b004bc9d7fd963mr1855138qvb.83.1668175251158; 
 Fri, 11 Nov 2022 06:00:51 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 dm30-20020a05620a1d5e00b006fb3ac7ee59sm1179967qkb.43.2022.11.11.06.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:00:50 -0800 (PST)
Date: Fri, 11 Nov 2022 15:00:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Subject: Re: [RFC PATCH v3 08/11] test/vsock: rework message bound test
Message-ID: <20221111140040.dpxif3ze446tedqw@sgarzare-redhat>
References: <f60d7e94-795d-06fd-0321-6972533700c5@sberdevices.ru>
 <e35479dc-8b1d-2a6f-872c-31d14326b121@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <e35479dc-8b1d-2a6f-872c-31d14326b121@sberdevices.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Krasnov Arseniy <oxffffaa@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, kernel <kernel@sberdevices.ru>,
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

On Sun, Nov 06, 2022 at 07:48:56PM +0000, Arseniy Krasnov wrote:
>This updates message bound test making it more complex. Instead of
>sending 1 bytes messages with one MSG_EOR bit, it sends messages of
>random length(one half of messages are smaller than page size, second
>half are bigger) with random number of MSG_EOR bits set. Receiver
>also don't know total number of messages.
>
>Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>---
> tools/testing/vsock/control.c    |  34 +++++++++
> tools/testing/vsock/control.h    |   2 +
> tools/testing/vsock/util.c       |  13 ++++
> tools/testing/vsock/util.h       |   1 +
> tools/testing/vsock/vsock_test.c | 115 +++++++++++++++++++++++++++----
> 5 files changed, 152 insertions(+), 13 deletions(-)
>
>diff --git a/tools/testing/vsock/control.c b/tools/testing/vsock/control.c
>index 4874872fc5a3..bed1649bdf3d 100644
>--- a/tools/testing/vsock/control.c
>+++ b/tools/testing/vsock/control.c
>@@ -141,6 +141,40 @@ void control_writeln(const char *str)
> 	timeout_end();
> }
>
>+void control_writeulong(unsigned long value)
>+{
>+	char str[32];
>+
>+	if (snprintf(str, sizeof(str), "%lu", value) >= sizeof(str)) {
>+		perror("snprintf");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_writeln(str);
>+}
>+
>+unsigned long control_readulong(bool *ok)
>+{
>+	unsigned long value;
>+	char *str;
>+
>+	if (ok)
>+		*ok = false;
>+
>+	str = control_readln();
>+
>+	if (str == NULL)
>+		return 0;
>+
>+	value = strtoul(str, NULL, 10);
>+	free(str);
>+
>+	if (ok)
>+		*ok = true;
>+
>+	return value;
>+}
>+
> /* Return the next line from the control socket (without the trailing newline).
>  *
>  * The program terminates if a timeout occurs.
>diff --git a/tools/testing/vsock/control.h b/tools/testing/vsock/control.h
>index 51814b4f9ac1..cdd922dfea68 100644
>--- a/tools/testing/vsock/control.h
>+++ b/tools/testing/vsock/control.h
>@@ -9,7 +9,9 @@ void control_init(const char *control_host, const char *control_port,
> void control_cleanup(void);
> void control_writeln(const char *str);
> char *control_readln(void);
>+unsigned long control_readulong(bool *ok);
> void control_expectln(const char *str);
> bool control_cmpln(char *line, const char *str, bool fail);
>+void control_writeulong(unsigned long value);
>
> #endif /* CONTROL_H */
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index 2acbb7703c6a..351903836774 100644
>--- a/tools/testing/vsock/util.c
>+++ b/tools/testing/vsock/util.c
>@@ -395,3 +395,16 @@ void skip_test(struct test_case *test_cases, size_t test_cases_len,
>
> 	test_cases[test_id].skip = true;
> }
>+
>+unsigned long djb2(const void *data, size_t len)

hash_djb2 maybe it's more understandable

>+{
>+	unsigned long hash = 5381;
>+	int i = 0;
>+
>+	while (i < len) {
>+		hash = ((hash << 5) + hash) + ((unsigned char *)data)[i];
>+		i++;
>+	}
>+
>+	return hash;
>+}
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index a3375ad2fb7f..988cc69a4642 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -49,4 +49,5 @@ void run_tests(const struct test_case *test_cases,
> void list_tests(const struct test_case *test_cases);
> void skip_test(struct test_case *test_cases, size_t test_cases_len,
> 	       const char *test_id_str);
>+unsigned long djb2(const void *data, size_t len);
> #endif /* UTIL_H */
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index bb6d691cb30d..107c11165887 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -284,10 +284,14 @@ static void test_stream_msg_peek_server(const struct test_opts *opts)
> 	close(fd);
> }
>
>-#define MESSAGES_CNT 7
>-#define MSG_EOR_IDX (MESSAGES_CNT / 2)
>+#define SOCK_BUF_SIZE (2 * 1024 * 1024)
>+#define MAX_MSG_SIZE (32 * 1024)
>+
> static void test_seqpacket_msg_bounds_client(const struct test_opts *opts)
> {
>+	unsigned long curr_hash;
>+	int page_size;
>+	int msg_count;
> 	int fd;
>
> 	fd = vsock_seqpacket_connect(opts->peer_cid, 1234);
>@@ -296,18 +300,69 @@ static void test_seqpacket_msg_bounds_client(const struct test_opts *opts)
> 		exit(EXIT_FAILURE);
> 	}
>
>-	/* Send several messages, one with MSG_EOR flag */
>-	for (int i = 0; i < MESSAGES_CNT; i++)
>-		send_byte(fd, 1, (i == MSG_EOR_IDX) ? MSG_EOR : 0);
>+	/* Wait, until receiver sets buffer size. */
>+	control_expectln("SRVREADY");
>+
>+	curr_hash = 0;
>+	page_size = getpagesize();
>+	msg_count = SOCK_BUF_SIZE / MAX_MSG_SIZE;
>+
>+	for (int i = 0; i < msg_count; i++) {
>+		ssize_t send_size;
>+		size_t buf_size;
>+		int flags;
>+		void *buf;
>+
>+		/* Use "small" buffers and "big" buffers. */
>+		if (i & 1)
>+			buf_size = page_size +
>+					(rand() % (MAX_MSG_SIZE - page_size));
>+		else
>+			buf_size = 1 + (rand() % page_size);
>+
>+		buf = malloc(buf_size);
>+
>+		if (!buf) {
>+			perror("malloc");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		/* Set at least one MSG_EOR + some random. */
>+		if (i == (msg_count / 2) || (rand() & 1)) {
>+			flags = MSG_EOR;
>+			curr_hash++;
>+		} else {
>+			flags = 0;
>+		}
>+
>+		send_size = send(fd, buf, buf_size, flags);
>+
>+		if (send_size < 0) {
>+			perror("send");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		if (send_size != buf_size) {
>+			fprintf(stderr, "Invalid send size\n");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		curr_hash += send_size;
>+		curr_hash = djb2(&curr_hash, sizeof(curr_hash));
>+	}
>
> 	control_writeln("SENDDONE");
>+	control_writeulong(curr_hash);
> 	close(fd);
> }
>
> static void test_seqpacket_msg_bounds_server(const struct test_opts *opts)
> {
>+	unsigned long sock_buf_size;
>+	unsigned long remote_hash;
>+	unsigned long curr_hash;
> 	int fd;
>-	char buf[16];
>+	char buf[MAX_MSG_SIZE];
> 	struct msghdr msg = {0};
> 	struct iovec iov = {0};
>
>@@ -317,25 +372,58 @@ static void test_seqpacket_msg_bounds_server(const struct test_opts *opts)
> 		exit(EXIT_FAILURE);
> 	}
>
>+	sock_buf_size = SOCK_BUF_SIZE;
>+
>+	if (setsockopt(fd, AF_VSOCK, SO_VM_SOCKETS_BUFFER_MAX_SIZE,
>+		       &sock_buf_size, sizeof(sock_buf_size))) {
>+		perror("getsockopt");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (setsockopt(fd, AF_VSOCK, SO_VM_SOCKETS_BUFFER_SIZE,
>+		       &sock_buf_size, sizeof(sock_buf_size))) {
>+		perror("getsockopt");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	/* Ready to receive data. */
>+	control_writeln("SRVREADY");
>+	/* Wait, until peer sends whole data. */
> 	control_expectln("SENDDONE");
> 	iov.iov_base = buf;
> 	iov.iov_len = sizeof(buf);
> 	msg.msg_iov = &iov;
> 	msg.msg_iovlen = 1;
>
>-	for (int i = 0; i < MESSAGES_CNT; i++) {
>-		if (recvmsg(fd, &msg, 0) != 1) {
>-			perror("message bound violated");
>-			exit(EXIT_FAILURE);
>-		}
>+	curr_hash = 0;
>
>-		if ((i == MSG_EOR_IDX) ^ !!(msg.msg_flags & MSG_EOR)) {
>-			perror("MSG_EOR");
>+	while (1) {
>+		ssize_t recv_size;
>+
>+		recv_size = recvmsg(fd, &msg, 0);
>+
>+		if (!recv_size)
>+			break;
>+
>+		if (recv_size < 0) {
>+			perror("recvmsg");
> 			exit(EXIT_FAILURE);
> 		}
>+
>+		if (msg.msg_flags & MSG_EOR)
>+			curr_hash++;
>+
>+		curr_hash += recv_size;
>+		curr_hash = djb2(&curr_hash, sizeof(curr_hash));
> 	}
>
> 	close(fd);
>+	remote_hash = control_readulong(NULL);
>+
>+	if (curr_hash != remote_hash) {
>+		fprintf(stderr, "Message bounds broken\n");
>+		exit(EXIT_FAILURE);
>+	}
> }
>
> #define MESSAGE_TRUNC_SZ 32
>@@ -837,6 +925,7 @@ int main(int argc, char **argv)
> 		.peer_cid = VMADDR_CID_ANY,
> 	};
>
>+	srand(time(NULL));
> 	init_signals();
>
> 	for (;;) {
>-- 
>2.35.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
