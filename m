Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98FB2A83
	for <lists.virtualization@lfdr.de>; Sat, 14 Sep 2019 10:45:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 92170AD7;
	Sat, 14 Sep 2019 08:45:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 24409AC7
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 08:45:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BE5B67D2
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 08:44:59 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m3so16521544pgv.13
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=NTdUg0w3/tuA6uUITPahZY7hZDt+05gchQsrnaO5ujA=;
	b=Gx9sM3oJHRwI1npjk8ZNjbJE1nacoafTkX1Q2uOksVNKkzn07oS+kClzPTSC/BeY2O
	F88h7g+gJjMXvKgWwLo5yZe7ED3ITcsdPCssNtNw5b1Hm64tmb1ncKLckO6NPxtlYPVP
	21LPE9eZKvN/pFZzauBw50CGxxOIWsuvilS1WYGTGYAcWzPouiv5A+3hXEwoc82T8naQ
	WyXrPk/qwZ49Kxp1ZaswdaQX/ZgMW5+Q94UNdcFLpyV1/I/TDTXyLkZ63+I1tddBi1qw
	evAa/Pj8+gwLQqWj8AEExLGZNtwWKVXEEcacy95LSBBOfCKzV4IY0uM38htzrXjYOfIH
	ZVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=NTdUg0w3/tuA6uUITPahZY7hZDt+05gchQsrnaO5ujA=;
	b=bvi7GIQCJ68scaKqdAfqPZAKzh7czbtz+CX6cFxvExw6NHlNBqU3o0bNJOQ+RPXu5u
	Waysazx0JHQxyG0dT3F7wU+Z9G00y+MS20alGSiNDLfuJvS8Qk05Vs0Ze/bAUFZ7N5ZI
	ClGg5Hbf/+iAD43I3Y8Rc4RSkJdz+Yy0qgDooz0nRPIe6R0chJ/PfhYuwdiZFqIBxQLY
	ENN4rVAziK1dnFFSH9yHgaOgOCASCOwrcoqwq40N5xcjDj4at6L6iyhvznRuRZrDAG3R
	4ImYSr4y3OSBXmzu+nZh8q6HsKWB+LHe0RI3QLAcXAVXn5lm5NaNinGUyOujNyRfsITx
	yc6g==
X-Gm-Message-State: APjAAAUVxQckbiGeNkN1MxYP8f2zlc9/uwluhx41j1DfLEGQ5ca+EWS4
	QpDQKn13u+zzXw+aVUCKTb4=
X-Google-Smtp-Source: APXvYqzHm8+A4QkqnIHJ0hQ4zT0L6uyARCgQdkDxIEAsYtshGzW9bBX2V69ODUHsrX1sHvF3cNPxLQ==
X-Received: by 2002:a65:57ca:: with SMTP id q10mr38486073pgr.52.1568450699321; 
	Sat, 14 Sep 2019 01:44:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id h66sm5110734pjb.0.2019.09.14.01.44.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Sep 2019 01:44:58 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] vhost: Fix compile time error
Date: Sat, 14 Sep 2019 01:44:57 -0700
Message-Id: <1568450697-16775-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Building vhost on 32-bit targets results in the following error.

drivers/vhost/vhost.c: In function 'translate_desc':
include/linux/compiler.h:549:38: error:
	call to '__compiletime_assert_1879' declared with attribute error:
	BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)

Fixes: a89db445fbd7 ("vhost: block speculation of translated descriptors")
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/vhost/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index acabf20b069e..102a0c877007 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2074,7 +2074,7 @@ static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
 		_iov->iov_base = (void __user *)
 			((unsigned long)node->userspace_addr +
 			 array_index_nospec((unsigned long)(addr - node->start),
-					    node->size));
+					    (unsigned long)node->size));
 		s += size;
 		addr += size;
 		++ret;
-- 
2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
