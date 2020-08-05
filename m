Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D25523CB28
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:44:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DFD99881AB;
	Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mori9Rd8f5iR; Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 75F0C8821F;
	Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50E8EC004C;
	Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68C1EC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6047E2051E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6Kq55tt1QU9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id AC25A2034F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjTvqLs5kODLJE0NPlW/uTfO7Hwyt71PbjjTwHT15mk=;
 b=MYk1X+OzC7vUN2K5Qx9vB+aZU0SgeFH5WVlDuYnAX9HvMkuFJGKRzRc9tdAmwftGzfLG2p
 EABb2vUa8bwUGw9q2cZle7Y/irLk4DLqkIcMZ9En7kuPllwFVa3PyEiMZdAh1TI1kEkPcY
 0IVyRO8PP6V94K2l/2AlHH9Wk8TrWVE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-X1W7Tw0pPViXxt6vuuJuWw-1; Wed, 05 Aug 2020 09:44:00 -0400
X-MC-Unique: X1W7Tw0pPViXxt6vuuJuWw-1
Received: by mail-wr1-f72.google.com with SMTP id d6so12034833wrv.23
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fjTvqLs5kODLJE0NPlW/uTfO7Hwyt71PbjjTwHT15mk=;
 b=VbGv59CewivdWgbA055U0Eoxogc7RIsprcDeW7fl34j1y+HmYVgJvI+EcTc7jy4RcL
 86O5G+Wypaj2OW0Qs3vfDz7/Gs804i0GjDthFVILpUhuwlEtCtoFN/lGle0srvLEb6ub
 NApqht7uJ10SwJh+v96vrQQN/z9+laGt5pNkwPCmM8dURq0NCix0GQITamqz+RLglmN4
 BwA8EOkzCTgNw474t2388WTBXBzsNJhUHbCi/0uKrX1zL2wDoRJS/1gUyJDahl+SxPDh
 ofaSKHKOMtj8S8l1O82ir08AqJm+gTobkbq019OzZXLvA4rxxL1dy/5SK4sKc2kuTwIB
 UzcA==
X-Gm-Message-State: AOAM5314K2mQQ1mmMlEY8nUPSUKgV4cZdQQfT1mZDzf6xUnmgHKzx98J
 Ix7MRwtJ+6UrjVIMpfuFm5ZGVemBt3Lqj+z3w4j9dQvQunZBzvUjG5c5wC97RyNF6kBhXhdmhLT
 t1LSRKo3Ld7KH7nE2ugO87W6XITQCBjM9b+CplVXlSg==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr3043783wrw.358.1596635036454; 
 Wed, 05 Aug 2020 06:43:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxID3Okk6UkDH7ORpBlS1Sx9zjE5MzCmMtq8kERdyW86XULNXmYx6/P0/ZTdrOJ29PfTdjexQ==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr3043772wrw.358.1596635036229; 
 Wed, 05 Aug 2020 06:43:56 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id g14sm2898470wmk.37.2020.08.05.06.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:55 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/38] virtio_net: correct tags for config space fields
Message-ID: <20200805134226.1106164-15-mst@redhat.com>
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
Cc: virtualization@lists.linux-foundation.org
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

Tag config space fields as having virtio endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/uapi/linux/virtio_net.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 19d23e5baa4e..27d996f29dd1 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -87,19 +87,19 @@ struct virtio_net_config {
 	/* The config defining mac address (if VIRTIO_NET_F_MAC) */
 	__u8 mac[ETH_ALEN];
 	/* See VIRTIO_NET_F_STATUS and VIRTIO_NET_S_* above */
-	__u16 status;
+	__virtio16 status;
 	/* Maximum number of each of transmit and receive queues;
 	 * see VIRTIO_NET_F_MQ and VIRTIO_NET_CTRL_MQ.
 	 * Legal values are between 1 and 0x8000
 	 */
-	__u16 max_virtqueue_pairs;
+	__virtio16 max_virtqueue_pairs;
 	/* Default maximum transmit unit advice */
-	__u16 mtu;
+	__virtio16 mtu;
 	/*
 	 * speed, in units of 1Mb. All values 0 to INT_MAX are legal.
 	 * Any other value stands for unknown.
 	 */
-	__u32 speed;
+	__virtio32 speed;
 	/*
 	 * 0x00 - half duplex
 	 * 0x01 - full duplex
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
