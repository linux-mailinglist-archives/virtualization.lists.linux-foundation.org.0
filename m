Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6A23CB18
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:43:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 05EC184741;
	Wed,  5 Aug 2020 13:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3bK6LBxPS7n; Wed,  5 Aug 2020 13:43:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D8E384481;
	Wed,  5 Aug 2020 13:43:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 626E5C004C;
	Wed,  5 Aug 2020 13:43:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F72DC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9BE35203F5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3eT0J20JoS1C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 491172034F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q673oTQd3PT4fLRkZYrRjwhnbIb/xH6G5eflz2tzEBg=;
 b=UpRB/g+3mS/wnLMC3JuxEMoWHMX9wnjMwEq5bVRvqbW5MGRnkbJ+ezBcG6/js8YQ04duRi
 +mVbP6Ga5OXKF7eve8WfpzroiUAz2z91PHVFOFEExkhBq7kVjeiwQDmSFVO7YTgIPpMU7Q
 uHcE97pXwtVerWwnUBG4rGCN7DfYSAU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-ek48cGMSMCWHpw7lgjGoUQ-1; Wed, 05 Aug 2020 09:43:26 -0400
X-MC-Unique: ek48cGMSMCWHpw7lgjGoUQ-1
Received: by mail-wm1-f70.google.com with SMTP id t26so2741506wmn.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q673oTQd3PT4fLRkZYrRjwhnbIb/xH6G5eflz2tzEBg=;
 b=HvtCHNaBuw4z6YnOfCscGkZVtMT7r2aba1ZVZmHmP9gxduyZjPi/Upz3rNs3JXHHtz
 I+dUv9dqSQcgDFmph/SXhvhp9LLZjyUWOHnIq7Tdn6NRoHby8UZoyeL2KUm6kFlriFgi
 qvDZMq6k940RgOGbXgoA3qzkzGfsdLjvQbdGmQNyPQePQ5yCiZPcl9xrgV/hpuQzFh9f
 CIB3fEnW9k86tDyzBjhaXvT3ywQvboUkCfHiMG/XmdGbu7bbxL43E0WRIpE/gMmLfDSK
 DV+8bezSCMgrRFYach6vb8zbFxwSh3QKTvA63JBcX1ELHKRzAI/lxWWg+ppWgiIC5Qo9
 I9VA==
X-Gm-Message-State: AOAM530VjY/rAqLYQ4UVO0Ba3LWTmEw26SbwiWKEOBopXiRG1VW011Xn
 SvkZUknVxfLeJNWzInlPNBP/1oO7jxW1LDrcxNUX5PPWsg3hyF7o5rmw47Xq+b19VmTc4xB+gUq
 373vw145Ln5Pw0Zq9efg615yUw0xrS2YNE85uBwsg2A==
X-Received: by 2002:a1c:9909:: with SMTP id b9mr3361254wme.98.1596635005258;
 Wed, 05 Aug 2020 06:43:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykRKvY0muXBXF5mNi2kHQlY2jpa3SIjJW2hwVXBvs4z8lql0vr9k1JIRomDMqVCpsxqDQEXQ==
X-Received: by 2002:a1c:9909:: with SMTP id b9mr3361235wme.98.1596635005049;
 Wed, 05 Aug 2020 06:43:25 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id b8sm2838695wrv.4.2020.08.05.06.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:24 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/38] virtio: allow __virtioXX, __leXX in config space
Message-ID: <20200805134226.1106164-4-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Cornelia Huck <cohuck@redhat.com>,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Currently all config space fields are of the type __uXX.
This confuses people and some drivers (notably vdpa)
access them using CPU endian-ness - which only
works well for legacy or LE platforms.

Update virtio_cread/virtio_cwrite macros to allow __virtioXX
and __leXX field types. Follow-up patches will convert
config space to use these types.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 include/linux/virtio_config.h | 50 +++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 3b4eae5ac5e3..64da491936f7 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -6,6 +6,7 @@
 #include <linux/bug.h>
 #include <linux/virtio.h>
 #include <linux/virtio_byteorder.h>
+#include <linux/compiler_types.h>
 #include <uapi/linux/virtio_config.h>
 
 struct irq_affinity;
@@ -287,12 +288,57 @@ static inline __virtio64 cpu_to_virtio64(struct virtio_device *vdev, u64 val)
 	return __cpu_to_virtio64(virtio_is_little_endian(vdev), val);
 }
 
+/*
+ * Only the checker differentiates between __virtioXX and __uXX types. But we
+ * try to share as much code as we can with the regular GCC build.
+ */
+#if !defined(CONFIG_CC_IS_GCC) && !defined(__CHECKER__)
+
+/* Not a checker - we can keep things simple */
+#define __virtio_native_typeof(x) typeof(x)
+
+#else
+
+/*
+ * We build this out of a couple of helper macros in a vain attempt to
+ * help you keep your lunch down while reading it.
+ */
+#define __virtio_pick_value(x, type, then, otherwise)			\
+	__builtin_choose_expr(__same_type(x, type), then, otherwise)
+
+#define __virtio_pick_type(x, type, then, otherwise)			\
+	__virtio_pick_value(x, type, (then)0, otherwise)
+
+#define __virtio_pick_endian(x, x16, x32, x64, otherwise)			\
+	__virtio_pick_type(x, x16, __u16,					\
+		__virtio_pick_type(x, x32, __u32,				\
+			__virtio_pick_type(x, x64, __u64,			\
+				otherwise)))
+
+#define __virtio_native_typeof(x) typeof(					\
+	__virtio_pick_type(x, __u8, __u8,					\
+		__virtio_pick_endian(x, __virtio16, __virtio32, __virtio64,	\
+			__virtio_pick_endian(x, __le16, __le32, __le64,		\
+				__virtio_pick_endian(x, __u16, __u32, __u64,	\
+					/* No other type allowed */		\
+					(void)0)))))
+
+#endif
+
+#define __virtio_native_type(structname, member) \
+	__virtio_native_typeof(((structname*)0)->member)
+
+#define __virtio_typecheck(structname, member, val) \
+		/* Must match the member's type, and be integer */ \
+		typecheck(__virtio_native_type(structname, member), (val))
+
+
 /* Config space accessors. */
 #define virtio_cread(vdev, structname, member, ptr)			\
 	do {								\
 		might_sleep();						\
 		/* Must match the member's type, and be integer */	\
-		if (!typecheck(typeof((((structname*)0)->member)), *(ptr))) \
+		if (!__virtio_typecheck(structname, member, *(ptr)))	\
 			(*ptr) = 1;					\
 									\
 		switch (sizeof(*ptr)) {					\
@@ -322,7 +368,7 @@ static inline __virtio64 cpu_to_virtio64(struct virtio_device *vdev, u64 val)
 	do {								\
 		might_sleep();						\
 		/* Must match the member's type, and be integer */	\
-		if (!typecheck(typeof((((structname*)0)->member)), *(ptr))) \
+		if (!__virtio_typecheck(structname, member, *(ptr)))	\
 			BUG_ON((*ptr) == 1);				\
 									\
 		switch (sizeof(*ptr)) {					\
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
