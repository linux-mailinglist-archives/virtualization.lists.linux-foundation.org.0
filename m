Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F32CB84F
	for <lists.virtualization@lfdr.de>; Wed,  2 Dec 2020 10:14:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CBDE82E202;
	Wed,  2 Dec 2020 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id If-ropHDKiVE; Wed,  2 Dec 2020 09:14:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C35C2E214;
	Wed,  2 Dec 2020 09:14:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37ABFC0052;
	Wed,  2 Dec 2020 09:14:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA816C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 09:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97E0187900
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 09:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2Bl5DxLTKJs
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 09:14:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3FAF2878FD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606900490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U9a9tAI3X6AQ7BbNAQh41bnDnft76uo4aSQuO918v3A=;
 b=dO1fB09G6dzcAinZdIze+8K+fgEi1g82cIeoKzbvCEtrAnnLsLHwn2ks9A5lXBLsUU5D7a
 oUH9lQhp0vHk1Z8UtGggfgo/a2xCVslM3+chfpZeqTWiKyLCPBmPJXpjEGvgoGlJCpD+tb
 64e4XfPLUaXWc6X3TeOkV4UsO/DqZyw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-YjNxSVUvNOOkPHLTnTVCvA-1; Wed, 02 Dec 2020 04:14:46 -0500
X-MC-Unique: YjNxSVUvNOOkPHLTnTVCvA-1
Received: by mail-wr1-f72.google.com with SMTP id x10so2566237wrs.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 02 Dec 2020 01:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U9a9tAI3X6AQ7BbNAQh41bnDnft76uo4aSQuO918v3A=;
 b=f5u8hFFqb0cQSeRUGM6qa1u1zNmAWfGLx+Cvu2G9OXtIptuHkLfbn8FhnjX5fqMtDV
 CwJt4+/oIjy8DSNS3aaw75YF/i5G2Ikd1Cm9R4JRCxXG1jiVJAg+YR3PmXvvhd0u6ING
 APnlOCi08kSLDtHFj2YyLX4ben435L4UW61fm/4LD4ulpq3E7PM8bJA2xI+KWsCKFb86
 yNWLG6SIRsBmLwm6a6U5t61uPJSYm/8H9aP/dxhddBLXJkLZPAA4+j78qyRTXRqUUHTH
 tBkdSo6bO0h/2LY2NITWAHpu8EDCbl9dPi1jo6wa7/6X1sym9TlOZl+h2HT9Le+l3L/9
 IcJQ==
X-Gm-Message-State: AOAM531JaullOJYITtNrdlV3HiWAlAnCWBMH3m4pYiZEVvbpjalBNA1y
 jDZg4mj8qKdBBdyo+AlwGHy+PBZ4RDXilb79/t8nU4JRQtQx6FrENopq7c8ARuUo1JlekoB3KoF
 2W4gDhtQ5g2pEuaZW7+v+Fj7S706vioVtEgwSaosRuw==
X-Received: by 2002:adf:e502:: with SMTP id j2mr2176105wrm.73.1606900484143;
 Wed, 02 Dec 2020 01:14:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd3N1Nm5NWQ2An7EyFTzWrqD8MOKunvrEEb+jceRXUA4xdhvoPsOzOY8Ht3HU/mYz2O+pQ+w==
X-Received: by 2002:adf:e502:: with SMTP id j2mr2176087wrm.73.1606900483978;
 Wed, 02 Dec 2020 01:14:43 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id l13sm1247289wrm.24.2020.12.02.01.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 01:14:43 -0800 (PST)
Date: Wed, 2 Dec 2020 10:14:41 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] vhost_vdpa: return -EFAULT if copy_to_user() fails
Message-ID: <20201202091441.sjds7e42j5ivdcfi@steredhat>
References: <X8c32z5EtDsMyyIL@mwanda>
MIME-Version: 1.0
In-Reply-To: <X8c32z5EtDsMyyIL@mwanda>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Dec 02, 2020 at 09:44:43AM +0300, Dan Carpenter wrote:
>The copy_to_user() function returns the number of bytes remaining to be
>copied but this should return -EFAULT to the user.
>
>Fixes: 1b48dc03e575 ("vhost: vdpa: report iova range")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
> drivers/vhost/vdpa.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>index d6a37b66770b..ef688c8c0e0e 100644
>--- a/drivers/vhost/vdpa.c
>+++ b/drivers/vhost/vdpa.c
>@@ -344,7 +344,9 @@ static long vhost_vdpa_get_iova_range(struct vhost_vdpa *v, u32 __user *argp)
> 		.last = v->range.last,
> 	};
>
>-	return copy_to_user(argp, &range, sizeof(range));
>+	if (copy_to_user(argp, &range, sizeof(range)))
>+		return -EFAULT;
>+	return 0;
> }
>
> static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
>-- 
>2.29.2
>
>_______________________________________________
>Virtualization mailing list
>Virtualization@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/virtualization
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
