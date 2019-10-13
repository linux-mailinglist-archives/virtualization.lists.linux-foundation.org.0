Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4D6D556F
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 11:12:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B5C3122F7;
	Sun, 13 Oct 2019 09:12:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15F8B2293
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 09:03:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E7EB514D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1570957412;
	bh=/JJFbFxFpJrgt1MfB1+HlUCk144HJzeGsZ82FMM6IMw=;
	h=X-UI-Sender-Class:From:Subject:To:Cc:Date;
	b=QvbD271PhVgYqWNLqHU0fg6xi+XVo+jTS/b+UHmTQn+3xBLOShASoEVhKgg8CQCMZ
	JrA0end3XYxHStzGBd+xSCWSf4LeggpnnnWKDX50dFhCFkL9pq4FfexwdisEY6tS5s
	ylE5yKrta/vQnqwZ3tb0PcdVCA0Ky/CgXsmg5a0c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0MWuiC-1iXnFP3geq-00W1Yx;
	Sun, 13 Oct 2019 11:03:31 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] tools/virtio: Fix build
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
Message-ID: <4b686914-075b-a0a9-c97b-9def82ee0336@web.de>
Date: Sun, 13 Oct 2019 11:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:ZUTxknunf3G6Pgr3vAD78vi2eR7WdAXKm8qBbLV5J2t/U4o/4EZ
	TZ6oSJMqVZN1Rm1Xnf4Vwx/O9ojkaI8y5NJmLT1fwtdJtkwS9txiGev7dCd8/2y4ECRTtwQ
	z04XbSrZje/K+9Z0z31XxJub0b6k32mvx6LiSpteJ4IWLEianalNbu8aN5qmPaLh4PvrzZa
	ig6WmprlS1YhpLl3QcjHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7nlS2ZaQecY=:08CSwSG22S349Q6b6tO8u6
	rdaiZ7Q4U9RWlP1P4AdTDwfQVBpkZISmu3BOb+eUDH/TaKaNewNeXTsbuaBJ33t555KTe2Yd5
	veocItfCWbO3siPsFa3C6QBbeuGz7sbaR+IsogHABwlrRswYGlYWHiJTvskJOfkY6Q8BPaNnA
	KfIvgw08/iTnVHXCnBX5wF7+Q6mxb2eJPObAdKLvGyCmizrwYirjJc3SItHJEjehGAOgz8zo2
	OR4sA4gVcW8gWYDy0M/yM/h+3RmgPws0gGF+dq6QkTKrMx/CLWdGXTv2tRLsvBTzCvar1TLtS
	ZgY8Fa03EG1hJXWKZarAiYnPdxMsfzmo/aYVBlukvhwneADSi1pNXsWf4LpMedeMcRx9a+fSi
	f3e/tVcTXwmH5SBvKihON99ZTP9w5E+4wPdz1jqdNkkWFC8bXsLIt14VjcEZS0MiMifqeeDOm
	0m0lS3gMJd7zXfUjAZ1Tl9bloTvv7YaqJdHyA3Qh+8CxnEeinioCxcv9ZhlYHkKvOWnL9ubq7
	wrKXpfFP+p+HJfx4jsSu52Sz9S3sxa9w6ZeB3GBIbcdHuxSJncSsJDHED6MwptZKJTsgNQ//N
	NNBTIXO55iyvd18IYqkiw3Q0skVvqfiFAUCqI9VLnSamjBx+iwIrlopxUNrf8gs4QJmiK5fv4
	yQjre/RtXOqszthoWG84RdhyQm0zQfRbP+t0UqsJv7Aa6bWya9rEMhaySSrqp2UiEHq6g+2fY
	ioWkZZkQv7KcAzaRy42E3MZRMt59ucL4z3PGzqGtNSvdw6aaY6PBwaByo3I00ALQDFTISx+9i
	sFvRksKk5B5XCt3KjcRoSjLlyviJkkiEYZypOXq4OUnOEXwHgu1uvB4b7racTk5PMxVwIb5hq
	TQbicqdvS+5zw0EYw+UGjZUIZjmJX+4zhcAdapmdrfwS9YFbrXG+RBK1aJjl8F1bGqcjl5QfS
	30qtKq3InUyZlAyZdEL/WFN7geUmORPuIuUkEOSr73Sv8p4z1ZEoucHWc2fNQFPILPNxgTCJ+
	3xV3vpYeyqMj3fWuT9S8vgJp/69JbuM1WZ5LW/sN5Yhvvf7GYVRBSgFq++PYxzswIdtCqCWZq
	jt1PDcHmB1g1eLcHD0/Vv5cyqCVUwbkK7pSJVj4/rki3JRi7Ru7U6LHb5zmntyT9Eg7X9nJ/3
	lWNk1Saag3CPODdOf7dMKyuW/UhbNvTuVe49WL8hjEPxPAlDFedtGsme2kNVtkX7sFuA24Txx
	Vzb04B4990YG4zitAZnvFLJFl6NtY7M99aZiC5xYWa8VoDGwLdZsMqNvXA+k=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: Jan Kiszka <jan.kiszka@siemens.com>

Various changes in the recent kernel versions broke the build due to
missing function and header stubs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/virtio/crypto/hash.h       | 0
 tools/virtio/linux/dma-mapping.h | 2 ++
 tools/virtio/linux/kernel.h      | 2 ++
 3 files changed, 4 insertions(+)
 create mode 100644 tools/virtio/crypto/hash.h

diff --git a/tools/virtio/crypto/hash.h b/tools/virtio/crypto/hash.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/virtio/linux/dma-mapping.h b/tools/virtio/linux/dma-mapping.h
index f91aeb5fe571..db96cb4bf877 100644
--- a/tools/virtio/linux/dma-mapping.h
+++ b/tools/virtio/linux/dma-mapping.h
@@ -29,4 +29,6 @@ enum dma_data_direction {
 #define dma_unmap_single(...) do { } while (0)
 #define dma_unmap_page(...) do { } while (0)

+#define dma_max_mapping_size(d)	0
+
 #endif
diff --git a/tools/virtio/linux/kernel.h b/tools/virtio/linux/kernel.h
index 6683b4a70b05..ccf321173210 100644
--- a/tools/virtio/linux/kernel.h
+++ b/tools/virtio/linux/kernel.h
@@ -141,4 +141,6 @@ static inline void free_page(unsigned long addr)
 #define list_for_each_entry(a, b, c) while (0)
 /* end of stubs */

+#define xen_domain() 0
+
 #endif /* KERNEL_H */
--
2.16.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
