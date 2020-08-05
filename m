Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B407223CB2F
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:44:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6AE5686885;
	Wed,  5 Aug 2020 13:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AgGWOvb93xLP; Wed,  5 Aug 2020 13:44:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0224B86888;
	Wed,  5 Aug 2020 13:44:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA28FC004C;
	Wed,  5 Aug 2020 13:44:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BDFDC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EFC1A86885
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgC_4NTiMF_b
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6657B8687B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kSRe7wmYN+c40TNuZd0aK8LNMOsV+g9hMYDNFujk/tc=;
 b=R+z5kh0sI7v4qkQUSQsyCcKIUtPdhNPsy/bGuck9HwTUm2NLEQ3O92ovw/askKdWq+gdOn
 tIuwXqdTn+TyQuRhCMKKSy4gw8/PI8UuxIE3TYa5r9aGcH4WjQ8+VkbrelGndNilvm84HS
 nb41lT48Pp/7dnBKtPmLYeKG/nr2XPk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-IbQYvPk6M7qiL0oOGtqWxg-1; Wed, 05 Aug 2020 09:44:22 -0400
X-MC-Unique: IbQYvPk6M7qiL0oOGtqWxg-1
Received: by mail-wr1-f70.google.com with SMTP id f7so13583162wrs.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kSRe7wmYN+c40TNuZd0aK8LNMOsV+g9hMYDNFujk/tc=;
 b=dJ8oTid19SBz3D3TmCnQQofbl5zhfDG0EBigLfsfc7xubUyVzGopnGp7wcOOKCoFon
 SMUie6JT2ncQVKeEnYy8TkE/NWbFGUVf4sClLV3DCZ0EvVsZtIGqLSQMWQ6N4BvaBV37
 I6FGfrvUoz6Mg5wkRnmZP+hxn/iHjzn/8pzlEfmzeYfFsLwAywto9NkEJJInuRUm64M/
 R93MgJtbiDv/dSPB2djP3+cKjsrT1T9Ua5F8UG6nzZaoTPMwwpZVHpgobIANDxchnWfz
 Itp2jBQf8e1Rf2lEBqEZEyFn+rM02HgHbuDO4kOvMZpRT5lWLrV+HDVwrPNs+y6Kt0jX
 OR/g==
X-Gm-Message-State: AOAM531PSMJLymhCWO1h9bTujbnu1pjtXbRUZDEhSfQOGLnpCsQdLVhd
 hVzh62XN9Yyg91P14qw54gAm/zsJuXguvIHP7NDXcfch85sL1YOJhN2t8sX+0tXru7UF6KLbo7a
 J33aVK+KKY9KbmuEiJwEA91y3DLioM//JT0dtOr69hA==
X-Received: by 2002:a1c:38c5:: with SMTP id f188mr3184178wma.7.1596635060868; 
 Wed, 05 Aug 2020 06:44:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtu4fGrz2OcjqJ60Gx1dujnfxQ+ydCwiHL+CZ6x4QY+RWP5ctttNcCg2cu41yMIpSX3GIA4Q==
X-Received: by 2002:a1c:38c5:: with SMTP id f188mr3184169wma.7.1596635060701; 
 Wed, 05 Aug 2020 06:44:20 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id f131sm2902892wme.40.2020.08.05.06.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:44:20 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:44:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/38] virtio_config: cread/write cleanup
Message-ID: <20200805134226.1106164-24-mst@redhat.com>
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

Use vars of the correct type instead of casting.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_config.h | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index c68f58f3bf34..5c3b02245ecd 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -444,53 +444,60 @@ static inline void virtio_cwrite8(struct virtio_device *vdev,
 static inline u16 virtio_cread16(struct virtio_device *vdev,
 				 unsigned int offset)
 {
-	u16 ret;
+	__virtio16 ret;
 
 	might_sleep();
 	vdev->config->get(vdev, offset, &ret, sizeof(ret));
-	return virtio16_to_cpu(vdev, (__force __virtio16)ret);
+	return virtio16_to_cpu(vdev, ret);
 }
 
 static inline void virtio_cwrite16(struct virtio_device *vdev,
 				   unsigned int offset, u16 val)
 {
+	__virtio16 v;
+
 	might_sleep();
-	val = (__force u16)cpu_to_virtio16(vdev, val);
-	vdev->config->set(vdev, offset, &val, sizeof(val));
+	v = cpu_to_virtio16(vdev, val);
+	vdev->config->set(vdev, offset, &v, sizeof(v));
 }
 
 static inline u32 virtio_cread32(struct virtio_device *vdev,
 				 unsigned int offset)
 {
-	u32 ret;
+	__virtio32 ret;
 
 	might_sleep();
 	vdev->config->get(vdev, offset, &ret, sizeof(ret));
-	return virtio32_to_cpu(vdev, (__force __virtio32)ret);
+	return virtio32_to_cpu(vdev, ret);
 }
 
 static inline void virtio_cwrite32(struct virtio_device *vdev,
 				   unsigned int offset, u32 val)
 {
+	__virtio32 v;
+
 	might_sleep();
-	val = (__force u32)cpu_to_virtio32(vdev, val);
-	vdev->config->set(vdev, offset, &val, sizeof(val));
+	v = cpu_to_virtio32(vdev, val);
+	vdev->config->set(vdev, offset, &v, sizeof(v));
 }
 
 static inline u64 virtio_cread64(struct virtio_device *vdev,
 				 unsigned int offset)
 {
-	u64 ret;
+	__virtio64 ret;
+
 	__virtio_cread_many(vdev, offset, &ret, 1, sizeof(ret));
-	return virtio64_to_cpu(vdev, (__force __virtio64)ret);
+	return virtio64_to_cpu(vdev, ret);
 }
 
 static inline void virtio_cwrite64(struct virtio_device *vdev,
 				   unsigned int offset, u64 val)
 {
+	__virtio64 v;
+
 	might_sleep();
-	val = (__force u64)cpu_to_virtio64(vdev, val);
-	vdev->config->set(vdev, offset, &val, sizeof(val));
+	v = cpu_to_virtio64(vdev, val);
+	vdev->config->set(vdev, offset, &v, sizeof(v));
 }
 
 /* Conditional config space accessors. */
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
