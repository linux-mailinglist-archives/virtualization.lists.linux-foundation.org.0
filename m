Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC8D5614
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 13:55:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6D3DA238A;
	Sun, 13 Oct 2019 11:54:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 664CA2367
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2B1915D3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:28 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B862FC049E36
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:27 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id z21so14811450qtq.21
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 04:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=LyPdJiu+Pv3Ms2s+9K7y5cFNFk6/oEkuyO+dRyVq8dg=;
	b=Hif3yEqSOPrp0Jfdf/c3581mNB3sBe5qTYqvjhk6mjMhnbC8AcjGJunDyfM3JSwzuF
	T+uLphQybhrRbcBAQ8rWBZhZSYAJf/GSLmaVpVylSPsWlcVBxKLJVDcvc6UR11YbInzO
	4ttrv3XlVkQIBgZ9KmjBoaW1+h6cX5n2dmHJTC6fmj9XglQASBh3ZqkOK0i0BF+LMsld
	17sdRXvVbQz7R1415oVbdQMMEHyaE/J3pyrWlnYR5pNvyItZQsiZIwOoultVqxlC+7H1
	sQP7XCTfIckoIzt73WKWCnjj7oy5+nb1seN96NFhfCOKdPADycTySHc6SQr49cdENWA+
	xfuw==
X-Gm-Message-State: APjAAAXvjGkmMl3NFh3q8Awss5jKF8YtzDyFYIJO7Bb9q4NHf3TN4g4Y
	uYSUPZMigwBiZ07PWAo9Mm2gT3NvQ0cad6jTkkGhlQHcRvKTX+x2kvTQxvSqQlMH3/h1XyEH4JU
	vnojl7nD7jxyadlzkX4VRKCb6dkikN78sJFNgKRtFww==
X-Received: by 2002:a0c:c792:: with SMTP id k18mr25297614qvj.154.1570966946778;
	Sun, 13 Oct 2019 04:42:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhx3XLFozvF0Fexkmjc2uJBOUXPVXIPjvAKX3RiiVhxNpPC56P8T4wN2MQG4g59b9OLo3Gdg==
X-Received: by 2002:a0c:c792:: with SMTP id k18mr25297597qvj.154.1570966946584;
	Sun, 13 Oct 2019 04:42:26 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	z5sm7213125qtb.49.2019.10.13.04.42.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 04:42:25 -0700 (PDT)
Date: Sun, 13 Oct 2019 07:42:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 5/5] vhost: last descriptor must have NEXT clear
Message-ID: <20191013113940.2863-6-mst@redhat.com>
References: <20191013113940.2863-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191013113940.2863-1-mst@redhat.com>
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

fetch_buf already guarantees we exit on a descriptor without a NEXT
flag.  Add a BUG_ON statement to make sure we don't overflow the buffer
in case of a bug.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index d46c28149f6f..09f594bb069a 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2656,6 +2656,8 @@ int vhost_get_vq_desc_batch(struct vhost_virtqueue *vq,
 			break;
 	}
 
+	BUG_ON(i >= vq->ndescs);
+
 	vq->first_desc = i + 1;
 
 	return ret;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
