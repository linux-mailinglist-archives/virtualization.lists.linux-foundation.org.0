Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF40764E8
	for <lists.virtualization@lfdr.de>; Fri, 26 Jul 2019 13:51:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D3351CA8;
	Fri, 26 Jul 2019 11:51:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DEF879EE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 11:51:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7C964709
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 11:51:18 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k10so52331370qtq.1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 04:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=9gHO9TyKSj0CYwPdw5b5x4szapbbJYZPZ0dkycmRYIw=;
	b=OY30H55gRySrBrt5MuSwWJ0V66PNG+bD6Z+WvmTj9j793k1pjYorwD+sFLyClcnEkO
	agKmuB04lHPb0vktUVifCk9pozVmnFbuFVRYVVxbIkNXG8I1yrdTFSOgl+M4pBJ2bmyT
	ypdEwRYA6+prM00mbO2IxWkGit+cEj2rKdVt6DeLQWRk/V8T3xZV8uU9exhOvzkRfmnU
	x6+RTA70K69xopZBSZziDVjyhVwlTaH1xrelM2MJYZswC2wrko9FcF75PRAI/sPgSxSN
	7PeKK43zYatosp48nRwgQWip8PUyZfefhvTAo5wWl60HUX/Ts6MS/rm5V2diiRt86J1m
	KWYA==
X-Gm-Message-State: APjAAAWdxgbXXXHMqH6uTm8Sr7A79BPfTLWOmXvi5Al+y7AUR1RIokXl
	CqtSjG18wI3TmLtCetz9IHXI6A==
X-Google-Smtp-Source: APXvYqymcbOMEQ4lUl13pE8Gi7ZsmsaJk9G/++ds4UPazH2mBxi16XyvfrDkgsSarz23FJllDH4Qvg==
X-Received: by 2002:ac8:520e:: with SMTP id r14mr65932257qtn.50.1564141877674; 
	Fri, 26 Jul 2019 04:51:17 -0700 (PDT)
Received: from redhat.com ([212.92.104.165]) by smtp.gmail.com with ESMTPSA id
	39sm28940576qts.41.2019.07.26.04.51.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 04:51:16 -0700 (PDT)
Date: Fri, 26 Jul 2019 07:51:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: disable metadata prefetch optimization
Message-ID: <20190726115021.7319-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

This seems to cause guest and host memory corruption.
Disable for now until we get a better handle on that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

I put this in linux-next, we'll re-enable if we can fix
the outstanding issues in a short order.

 drivers/vhost/vhost.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 819296332913..42a8c2a13ab1 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -96,7 +96,7 @@ struct vhost_uaddr {
 };
 
 #if defined(CONFIG_MMU_NOTIFIER) && ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE == 0
-#define VHOST_ARCH_CAN_ACCEL_UACCESS 1
+#define VHOST_ARCH_CAN_ACCEL_UACCESS 0
 #else
 #define VHOST_ARCH_CAN_ACCEL_UACCESS 0
 #endif
-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
