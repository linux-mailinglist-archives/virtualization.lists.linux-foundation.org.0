Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB911F535E
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 13:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBBAA8791E;
	Wed, 10 Jun 2020 11:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u76ILnX-hkpS; Wed, 10 Jun 2020 11:36:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 573FA8739D;
	Wed, 10 Jun 2020 11:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41FCAC088C;
	Wed, 10 Jun 2020 11:36:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 163F7C088C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 02A9F25C1C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PGGr9ka6cR1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 124CF253D4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591788964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QQIo3L2MWWvjb6mzSKSfjdSEv1rN96HPXR5N45kiTKk=;
 b=AEMqal8DFZiU3yL6IzPoiea7QFSiL7ueOYkC2NZJsIl3gTEGIynOhlVek9XoJOgCFvR70K
 aNGk6lad0egoqocnGCQcznOLgVZr2FZenJzJdhgECrFLt1wpKwMt+9IYRJKdq59Fqv+nsX
 jLgy8WmfOPzZUvh3i8lsPXXfLotUzcY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-FCuRUsIPPbyrMwHF5ue9mA-1; Wed, 10 Jun 2020 07:36:03 -0400
X-MC-Unique: FCuRUsIPPbyrMwHF5ue9mA-1
Received: by mail-wm1-f69.google.com with SMTP id 11so333687wmj.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QQIo3L2MWWvjb6mzSKSfjdSEv1rN96HPXR5N45kiTKk=;
 b=quGIFgRdeg5A4ns3uKjRuCLWLJigZUMrlhVfo9LeidsyXplYIbSdfBi1336GZnk6M3
 4AikeD70/jP3Mu3uwc1kVlxQBicRWLuwM3sAmHcN3wCua3Xt6Ms2nozuZfWUX3BGQjCP
 m02Fy/IPRLIW9B6DHmQ+SJ+oyyCZLrTcJY7rwtfUtp7T94iTxZBF870uS9+2KSsgmC54
 MN0ps2RaCvG+XGy80VOVNTWIN789ATFbLdk6Bl9f/oiKN08yB9/4VyjoxOkg/LAHO5E5
 Ulajc6oc0K04G7ndHxmmPRJ663XWUjSLyk3qvQLjv1hLgHKEftUGroA9gWgARp/YhOEJ
 3sSA==
X-Gm-Message-State: AOAM530ssuaQ//1ukM2QNO86FLeG0rck7mxt7BImK3g/zM4moU4tbpbR
 2C1nBBuykyM9bOTLUhSTjngemYU6T85tvRYQzAx+w90lWGsmGbwr/gsBfBsEWfSTZkWR9r+ab+4
 m8gzIIoyrZqWZeKXwMD5zTr/4HXD9Nzs0wTkI6JSZsw==
X-Received: by 2002:adf:a157:: with SMTP id r23mr3378912wrr.92.1591788962286; 
 Wed, 10 Jun 2020 04:36:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAHBbn1Hm38GkVQUdC9QO7S3prwhr5Px+sKP6OuFbtKtCWmiw5G13O+k9LGPpnGaeJbpRtfQ==
X-Received: by 2002:adf:a157:: with SMTP id r23mr3378893wrr.92.1591788962077; 
 Wed, 10 Jun 2020 04:36:02 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id c206sm7360362wmf.36.2020.06.10.04.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:36:01 -0700 (PDT)
Date: Wed, 10 Jun 2020 07:35:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 02/14] fixup! vhost: option to fetch descriptors
 through an independent struct
Message-ID: <20200610113515.1497099-3-mst@redhat.com>
References: <20200610113515.1497099-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610113515.1497099-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
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

---
 drivers/vhost/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 180b7b58c76b..11433d709651 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2614,7 +2614,7 @@ int vhost_get_vq_desc_batch(struct vhost_virtqueue *vq,
 err_fetch:
 	vq->ndescs = 0;
 
-	return ret;
+	return ret ? ret : vq->num;
 }
 EXPORT_SYMBOL_GPL(vhost_get_vq_desc_batch);
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
