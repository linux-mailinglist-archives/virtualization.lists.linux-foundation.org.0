Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FFDA62C4
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 09:38:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3B2E0CA6;
	Tue,  3 Sep 2019 07:38:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 492A8C9A
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A324709
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:38:22 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5D07C04B940
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:38:21 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id o133so18192974qke.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 00:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=a2jRYEYJXw6y2ArAic1WZqLdnynYivPxAhcNn14RG7c=;
	b=TK7Kajnm6n9GV2Pzg8Bhvvp2XYaGbbfe60prpGJLdcm7DdI/auvBw3Zw3Xx3hmTFBk
	sBo57mO8iFqI0w58iqBHzkUkIYNT26rwQ+Mozspv64jkoxaOEk5y8sojuTrFNrXqMs8c
	wwuBNlJAGWU4zo7+uT48JLekA3hg+Rp2Qu2rQm2QAxI3iTkXYo1DQOH0F7Q3dXVPdSQy
	mQcr6DBIStHGxHcPxWToVUzpI2O1X2OcR9BeEUoNmreVWJFw1YYKGfKusBCb/cZzrEIp
	J6C9NdS/gp1StsM+ZAMQjyr4/zHpNp+F3LwIrNnpBKrAjCxmjYWWlBkm75TSZEVK2Ovo
	imfg==
X-Gm-Message-State: APjAAAVlP3arcORMBJOXDq8IE64MpnOYMND2m0pMFDYOInkKKyk9GzKc
	xQSTdQjuw8sItAW2d+YMJk9uZ5wP7lCvXkjcXmIPLHmcem6s3V3TTjI8gPUbf2vqIKTwpwSYPI3
	SBBeVQTOBhjB9XyDPqnkNmr+ZQS4Q73fRnDuQTUr3BQ==
X-Received: by 2002:a37:916:: with SMTP id 22mr14382504qkj.45.1567496301057;
	Tue, 03 Sep 2019 00:38:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEnVPgjH8NbtZ+KbyL7PJmWdEblMSRWxEsCgtDKuaFkqs5CZdV4JoHPHabqe6W7wY2j8VAvw==
X-Received: by 2002:a37:916:: with SMTP id 22mr14382497qkj.45.1567496300910;
	Tue, 03 Sep 2019 00:38:20 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id 1sm8725515qko.73.2019.09.03.00.38.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 00:38:19 -0700 (PDT)
Date: Tue, 3 Sep 2019 03:38:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH net-next] vsock/virtio: a better comment on credit update
Message-ID: <20190903073748.25214-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stefano Garzarella <sgarzare@redhat.com>
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

The comment we have is just repeating what the code does.
Include the *reason* for the condition instead.

Cc: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vmw_vsock/virtio_transport_common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 94cc0fa3e848..5bb70c692b1e 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -307,8 +307,13 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
 
 	spin_unlock_bh(&vvs->rx_lock);
 
-	/* We send a credit update only when the space available seen
-	 * by the transmitter is less than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE
+	/* To reduce the number of credit update messages,
+	 * don't update credits as long as lots of space is available.
+	 * Note: the limit chosen here is arbitrary. Setting the limit
+	 * too high causes extra messages. Too low causes transmitter
+	 * stalls. As stalls are in theory more expensive than extra
+	 * messages, we set the limit to a high value. TODO: experiment
+	 * with different values.
 	 */
 	if (free_space < VIRTIO_VSOCK_MAX_PKT_BUF_SIZE) {
 		virtio_transport_send_credit_update(vsk,
-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
