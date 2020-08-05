Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6B23CB1F
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:43:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B1C488137;
	Wed,  5 Aug 2020 13:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKbM+dyvso9g; Wed,  5 Aug 2020 13:43:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D615F8815E;
	Wed,  5 Aug 2020 13:43:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEA0FC004C;
	Wed,  5 Aug 2020 13:43:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 504FEC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4BC33214FD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayyxEt6iVqoM
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 73E0420401
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uSDwrcCetgi4o90pPq2a185JxUqvTMJB/oDG7IEBOg=;
 b=WyqqnXVw+gIBCw1GWOA9/2igWJW8Pt0e1BwpbsV04Lxto4Yw0oAuQsRTRyECX4fsVE0ftP
 VlqEiEiJjs1oW/pC+Zg2iRWPs0qtek8dYx9zU3sRLcGEOA9IKLV2fUHtZY0Itu1LqhmLF3
 0IvG2nnLkqZeN8cbSM0ouign02oVvS8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-1dsIzwjsNACnY2iSbZuFDA-1; Wed, 05 Aug 2020 09:43:43 -0400
X-MC-Unique: 1dsIzwjsNACnY2iSbZuFDA-1
Received: by mail-wm1-f72.google.com with SMTP id c184so1972949wme.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4uSDwrcCetgi4o90pPq2a185JxUqvTMJB/oDG7IEBOg=;
 b=okUz2g3bJBKXCM8ywHIGdSkUx2pPLR2RKos6sAstrevPBKhX2I0Qjq1ppfVHn3iZmY
 NWUjLFQysizeM2MM98tYE/r2Ere1o/3+zWP8eaePYP1muo0PE2NHDotW46zln2AXr07b
 asuQEnaSvTKopV3snBYrU6JvC4oKgqhMcyKgQPCd9kRAN2v5AGTPytaopBZsVsaiqHyL
 ALJZubYHVYQIySQFVz6tf6xg6c1JqNkPMwwdnYiJptPD9amk4hEBY2ndJ1fetHwg7AN2
 sXy5PyRCaIvLGTIOLppMN1tQB+ehraPu36VCGQj00Uq4ff79uK04KYjNG6owqQjluFk5
 FZ3A==
X-Gm-Message-State: AOAM532PhnPVVawSOc+cjFDTyZRq7CMdnLTDAW9X+hOi7MhfxbfHvGHb
 neBRJfbl2Aa8KLEqP7RH94ivaT1n5I37kBDviEJhR870IyTyZzDdhNskW5qqwMLPj7w38+npy4S
 qMQ4jxfqKtkDzTvdkAlowkikeJF9Aksk4cOyyiimRfg==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr2990181wrn.2.1596635022297;
 Wed, 05 Aug 2020 06:43:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcyZAwzw/sc3TIrW5clO3yeQkU/17FbRDELsyAj0Cdv9z6ug93Lv7U5iCEnIGFjwxAFgiVMg==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr2990172wrn.2.1596635022086;
 Wed, 05 Aug 2020 06:43:42 -0700 (PDT)
Received: from redhat.com (bzq-79-178-123-8.red.bezeqint.net. [79.178.123.8])
 by smtp.gmail.com with ESMTPSA id
 y203sm2957420wmc.29.2020.08.05.06.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:41 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/38] virtio_fs: correct tags for config space fields
Message-ID: <20200805134226.1106164-10-mst@redhat.com>
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, Cornelia Huck <cohuck@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 Vivek Goyal <vgoyal@redhat.com>
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

Since fs is a modern-only device,
tag config space fields as having little endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Vivek Goyal <vgoyal@redhat.com>
Acked-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 include/uapi/linux/virtio_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/virtio_fs.h b/include/uapi/linux/virtio_fs.h
index b02eb2ac3d99..3056b6e9f8ce 100644
--- a/include/uapi/linux/virtio_fs.h
+++ b/include/uapi/linux/virtio_fs.h
@@ -13,7 +13,7 @@ struct virtio_fs_config {
 	__u8 tag[36];
 
 	/* Number of request queues */
-	__u32 num_request_queues;
+	__le32 num_request_queues;
 } __attribute__((packed));
 
 #endif /* _UAPI_LINUX_VIRTIO_FS_H */
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
