Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A20276693CD
	for <lists.virtualization@lfdr.de>; Fri, 13 Jan 2023 11:11:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F195A4174F;
	Fri, 13 Jan 2023 10:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F195A4174F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJkxFkjB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dxeza1jv3TLN; Fri, 13 Jan 2023 10:11:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 903D3418BE;
	Fri, 13 Jan 2023 10:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903D3418BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF0DDC007B;
	Fri, 13 Jan 2023 10:11:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BFA5C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8EF54189F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8EF54189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2DXoZVp7_6F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:11:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03B94174F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C03B94174F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673604710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S39Zw03yvzjBBH5aDpSObn8T87QjmStZQxn222GBMhw=;
 b=QJkxFkjBxMsPL53ctYN1jZVBF+o39dCaFz87SbCBN8hm9ETOfCbWT9tY4xeI8UR6oTYTNP
 ZpZXCbIThmHenXT0EWNQZf3iWQtCt9rJcTPZG5+E466FreIEVwjNFUzv1fNjU3mvpMXoKe
 tbRiCSLDIKT5sonawT0q4u7P0Nn4fyA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-US44zFFcNJqvbfIiRn9PEA-1; Fri, 13 Jan 2023 05:11:49 -0500
X-MC-Unique: US44zFFcNJqvbfIiRn9PEA-1
Received: by mail-qv1-f69.google.com with SMTP id
 pm24-20020ad446d8000000b0053233e46a00so6582701qvb.23
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 02:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S39Zw03yvzjBBH5aDpSObn8T87QjmStZQxn222GBMhw=;
 b=Q/ls7uR2g21Umw5CF+1bmuzqk+O1LSwlhbbBxXoUNgBqyr8zTYSSC3IdRG7pKcx009
 +FWBYQi4tvB67r4PpRxKt1zjZaFyJNHa1kfMFIPx8LL/8n7E6rRKdzq/7WW48t7FW6bv
 JtU5mq5YLQsUUsbA/iu4oKVnomHRfw2P9Z61Xv8joSVH9LqW8+3BdlZsIdPAxXVzUmJ3
 HLlbaEfLEFVgZn63vvyL3gls0Qc8ZrFLT6j5KLSlcD6Y2rgUQVkZoB0cOr51jMVgFSnk
 G3hBEoAzavxKit29TR4h1e5EmF7WvVz/qA5XOZMKsCGops6WDP+G5EkUTmWSK2qyPPUd
 jgWA==
X-Gm-Message-State: AFqh2kqg1iiRRZ1tr3jgXyOBICVsCZ5w+5CxDiGVo/A1BV6Ek1C1Sb0O
 CMBNewv3bMVqKddk6MFcPejbj+yh8UYV1EWwjIYqf3QtXFCLKvl3c4EkLLACjIODi8nP5aX9h9W
 Xdk9zAp0hfcHOd/wPEBsvmor1uX6gxHhWCQ8UKWVjFQ==
X-Received: by 2002:ad4:4249:0:b0:534:885f:f274 with SMTP id
 l9-20020ad44249000000b00534885ff274mr1614780qvq.40.1673604709220; 
 Fri, 13 Jan 2023 02:11:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGdzUjqzPGXTMJcXuUWT/fHuKd0p3YOc9smghZW9uBWvNKHGCowxFZEyIpOn10KyCEVrDWQg==
X-Received: by 2002:ad4:4249:0:b0:534:885f:f274 with SMTP id
 l9-20020ad44249000000b00534885ff274mr1614759qvq.40.1673604708895; 
 Fri, 13 Jan 2023 02:11:48 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-244.retail.telecomitalia.it.
 [79.46.200.244]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a454f00b006ce76811a07sm12622741qkp.75.2023.01.13.02.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:11:48 -0800 (PST)
Date: Fri, 13 Jan 2023 11:11:44 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: sebastien.boeuf@intel.com
Subject: Re: [PATCH v6 2/4] vhost-vdpa: Introduce RESUME backend feature bit
Message-ID: <20230113101144.xibw6z55g4cmvjvh@sgarzare-redhat>
References: <cover.1672742878.git.sebastien.boeuf@intel.com>
 <b18db236ba3d990cdb41278eb4703be9201d9514.1672742878.git.sebastien.boeuf@intel.com>
MIME-Version: 1.0
In-Reply-To: <b18db236ba3d990cdb41278eb4703be9201d9514.1672742878.git.sebastien.boeuf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: eperezma@redhat.com, mst@redhat.com, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Jan 03, 2023 at 11:51:06AM +0100, sebastien.boeuf@intel.com wrote:
>From: Sebastien Boeuf <sebastien.boeuf@intel.com>
>
>Userspace knows if the device can be resumed or not by checking this
>feature bit.
>
>It's only exposed if the vdpa driver backend implements the resume()
>operation callback. Userspace trying to negotiate this feature when it
>hasn't been exposed will result in an error.
>
>Acked-by: Jason Wang <jasowang@redhat.com>
>Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
>---
> drivers/vhost/vdpa.c             | 16 +++++++++++++++-
> include/uapi/linux/vhost_types.h |  2 ++
> 2 files changed, 17 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>index 166044642fd5..833617d00ef6 100644
>--- a/drivers/vhost/vdpa.c
>+++ b/drivers/vhost/vdpa.c
>@@ -355,6 +355,14 @@ static bool vhost_vdpa_can_suspend(const struct vhost_vdpa *v)
> 	return ops->suspend;
> }
>
>+static bool vhost_vdpa_can_resume(const struct vhost_vdpa *v)
>+{
>+	struct vdpa_device *vdpa = v->vdpa;
>+	const struct vdpa_config_ops *ops = vdpa->config;
>+
>+	return ops->resume;
>+}
>+
> static long vhost_vdpa_get_features(struct vhost_vdpa *v, u64 __user *featurep)
> {
> 	struct vdpa_device *vdpa = v->vdpa;
>@@ -602,11 +610,15 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
> 		if (copy_from_user(&features, featurep, sizeof(features)))
> 			return -EFAULT;
> 		if (features & ~(VHOST_VDPA_BACKEND_FEATURES |
>-				 BIT_ULL(VHOST_BACKEND_F_SUSPEND)))
>+				 BIT_ULL(VHOST_BACKEND_F_SUSPEND) |
>+				 BIT_ULL(VHOST_BACKEND_F_RESUME)))
> 			return -EOPNOTSUPP;
> 		if ((features & BIT_ULL(VHOST_BACKEND_F_SUSPEND)) &&
> 		     !vhost_vdpa_can_suspend(v))
> 			return -EOPNOTSUPP;
>+		if ((features & BIT_ULL(VHOST_BACKEND_F_RESUME)) &&
>+		     !vhost_vdpa_can_resume(v))
>+			return -EOPNOTSUPP;

Not for this patch, but I'd like to refactor this code a bit to fill a 
`backend_features` field in vhost_vdpa during the vhost_vdpa_probe(), so 
we don't need to change this code or the VHOST_GET_BACKEND_FEATURES for 
every new backend feature.

I'll send a patch.

This LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


> 		vhost_set_backend_features(&v->vdev, features);
> 		return 0;
> 	}
>@@ -658,6 +670,8 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
> 		features = VHOST_VDPA_BACKEND_FEATURES;
> 		if (vhost_vdpa_can_suspend(v))
> 			features |= BIT_ULL(VHOST_BACKEND_F_SUSPEND);
>+		if (vhost_vdpa_can_resume(v))
>+			features |= BIT_ULL(VHOST_BACKEND_F_RESUME);
> 		if (copy_to_user(featurep, &features, sizeof(features)))
> 			r = -EFAULT;
> 		break;
>diff --git a/include/uapi/linux/vhost_types.h b/include/uapi/linux/vhost_types.h
>index 53601ce2c20a..c5690a8992d8 100644
>--- a/include/uapi/linux/vhost_types.h
>+++ b/include/uapi/linux/vhost_types.h
>@@ -163,5 +163,7 @@ struct vhost_vdpa_iova_range {
> #define VHOST_BACKEND_F_IOTLB_ASID  0x3
> /* Device can be suspended */
> #define VHOST_BACKEND_F_SUSPEND  0x4
>+/* Device can be resumed */
>+#define VHOST_BACKEND_F_RESUME  0x5
>
> #endif
>-- 
>2.37.2
>
>---------------------------------------------------------------------
>Intel Corporation SAS (French simplified joint stock company)
>Registered headquarters: "Les Montalets"- 2, rue de Paris,
>92196 Meudon Cedex, France
>Registration Number:  302 456 199 R.C.S. NANTERRE
>Capital: 5 208 026.16 Euros
>
>This e-mail and any attachments may contain confidential material for
>the sole use of the intended recipient(s). Any review or distribution
>by others is strictly prohibited. If you are not the intended
>recipient, please contact the sender and delete all copies.
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
