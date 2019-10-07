Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B4CEBE7
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 20:30:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F51EFAA;
	Mon,  7 Oct 2019 18:30:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B661FAA
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 18:30:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C71DD735
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 18:30:30 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1005A811DE
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 18:30:30 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id m6so16132073qtk.23
	for <virtualization@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 11:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=Veqvl+qM0CfutM3PPjJjEy4hKVrp4NP3ezEQkZHIQPg=;
	b=swMhJ/IgHNY9BxNwBbBtEL3jMbZRjPOpdrt8vftJ7Igqa31L/1jkYeiRiuh4LlGZ/y
	46xgscguNsHAcXuQwR3jI3a3JAbF3R+b+/19yh0Ty+GmBuvfhFyD5i61ENegOUIzgWtb
	OQuY+XwURxzpSnqTWBicqg8Ypj8OxO5mYIQfO1LiJ6POcto/7GPlT0LOZDRN1131uFZr
	HfYfAVeQa+nrg3NEsvYiBo3lHCqfzpV/LEk5s20Up97KfHh6egvUp+lmUUzM7YUw7Qho
	BWreMC7DbBUAtL+XzH8dnY9NRrR9efZ1s6MqO+T2is//H9G/Y5uFC+pU5CreTYGKQQox
	pF6A==
X-Gm-Message-State: APjAAAUGgyTWYc0AMUtdQIcbQ42qno3ubPoy1drvWcJk36mfy0idN5Pj
	K7oaB+1VAOq0Okk9+bYB4v6j5zfu0XcktmcIkWRF4/0rGumI1/PB7VZ1CkPKpBHtINAbfqb9oat
	1ESOEQ2cWmny6zxfvgKBHzh48R/sU4AGWJIy7p9MXLA==
X-Received: by 2002:a37:8f86:: with SMTP id
	r128mr14609057qkd.392.1570473029368; 
	Mon, 07 Oct 2019 11:30:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5hMQXVRiXUEyBzpDI1RwgrB4b7tr07l8zU3XqKSSML03JT2g+x+mug176n0y6vIeLAWA/TQ==
X-Received: by 2002:a37:8f86:: with SMTP id
	r128mr14609014qkd.392.1570473029025; 
	Mon, 07 Oct 2019 11:30:29 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	s50sm9515361qth.92.2019.10.07.11.30.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 11:30:28 -0700 (PDT)
Date: Mon, 7 Oct 2019 14:30:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vhost/test: stop device before reset
Message-ID: <20191007183019.12522-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

When device stop was moved out of reset, test device wasn't updated to
stop before reset, this resulted in a use after free.  Fix by invoking
stop appropriately.

Fixes: b211616d7125 ("vhost: move -net specific code out")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 04edd8db62fc..e3a8e9db22cd 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -170,6 +170,7 @@ static int vhost_test_release(struct inode *inode, struct file *f)
 
 	vhost_test_stop(n, &private);
 	vhost_test_flush(n);
+	vhost_dev_stop(&n->dev);
 	vhost_dev_cleanup(&n->dev);
 	/* We do an extra flush before freeing memory,
 	 * since jobs can re-queue themselves. */
@@ -246,6 +247,7 @@ static long vhost_test_reset_owner(struct vhost_test *n)
 	}
 	vhost_test_stop(n, &priv);
 	vhost_test_flush(n);
+	vhost_dev_stop(&n->dev);
 	vhost_dev_reset_owner(&n->dev, umem);
 done:
 	mutex_unlock(&n->dev.mutex);
-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
