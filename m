Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 850556693D4
	for <lists.virtualization@lfdr.de>; Fri, 13 Jan 2023 11:13:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D48160FB5;
	Fri, 13 Jan 2023 10:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D48160FB5
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G/ns3D6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4tvp2t7haQP; Fri, 13 Jan 2023 10:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 29ADA60E81;
	Fri, 13 Jan 2023 10:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29ADA60E81
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B941C007B;
	Fri, 13 Jan 2023 10:13:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ACEAC002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 294BA40329
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 294BA40329
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=G/ns3D6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcM67aqEfth2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D6340122
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69D6340122
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673604831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WlHJzmQ1+H/v9mU7ZLQBlLH1lOk+ivZJgLlR3gMZhkM=;
 b=G/ns3D6Dd4JJ22/lb2bfv/S5KrSdOfLLrbf9a+qljR2Ew1gqYK27Wnni6hN8JwbzfDB9lO
 g7a8Ppi4NnfkJotSyk0oLcF0L3S9p7BNKTJdvKm0Hl1EK9s73lT9auNyktHseW3y+ZjN7S
 P6K5gOmz/NRhwLF5pLvxgCn/EMYD9kA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-SMKZD-6TMpKJoFHWIOi1WQ-1; Fri, 13 Jan 2023 05:13:50 -0500
X-MC-Unique: SMKZD-6TMpKJoFHWIOi1WQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 k7-20020ac84747000000b003a87ca26200so10088386qtp.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Jan 2023 02:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlHJzmQ1+H/v9mU7ZLQBlLH1lOk+ivZJgLlR3gMZhkM=;
 b=JuzdlwwEsiKt4l+5oJmkIVgjFCBgZ8XmeX/SJUQlzfUE8yrS2fhnxujvi/Dozwrpq+
 B8sQuwq1IOmis+1o8+hh8C+30L2gsLevg4kq/eHtlgdiaBlQ2RcxD9Jgq3Lcsmxs8uhV
 qI30KUcBUZjUgG4WKlbKGs1MzpgSNkguvXcYziimjP4Zb462tj9+A12dXsLU9mMjDhTv
 1UqeNCjO5BeUpoN36zstxZvhJgCqPodwPndZ0+F7WDjRpTYts1POBoHwi9cAIOGwqtHB
 /nDUEQOkqKQlKsk/2cd34I96Bd2T2CiWFaueI223vG3uHmHooIzl75l1reHmbYhEfZua
 llIw==
X-Gm-Message-State: AFqh2kooCyQoLI3Sgw9HMcqON7YnDAr+cdjFR3LgYmR1Vzij9xb/jJI3
 bFZVMUjxOUgQchfmZPYGurPJgWMwdp+vQhCQUKMHYSDHLYF30f/bVDtg9k1TEyuALbNgdttFxHr
 fkRvaT3D9ADiDQar9gLCRZpW8BHqZW9aR/hJZMqUDlw==
X-Received: by 2002:a05:6214:5c87:b0:530:49c2:a82d with SMTP id
 lj7-20020a0562145c8700b0053049c2a82dmr97518494qvb.47.1673604829680; 
 Fri, 13 Jan 2023 02:13:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvW8LW/MTzlkSFCBwiM31B2B/W/aTzZ6RhChRcNkBcPtF1PUsu1l8favYt1sP1xW1ztjc74lg==
X-Received: by 2002:a05:6214:5c87:b0:530:49c2:a82d with SMTP id
 lj7-20020a0562145c8700b0053049c2a82dmr97518473qvb.47.1673604829411; 
 Fri, 13 Jan 2023 02:13:49 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-244.retail.telecomitalia.it.
 [79.46.200.244]) by smtp.gmail.com with ESMTPSA id
 bi1-20020a05620a318100b006fb0e638f12sm12442370qkb.4.2023.01.13.02.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:13:49 -0800 (PST)
Date: Fri, 13 Jan 2023 11:13:45 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: sebastien.boeuf@intel.com
Subject: Re: [PATCH v6 3/4] vhost-vdpa: uAPI to resume the device
Message-ID: <20230113101345.j7s7ecn2sozkd44s@sgarzare-redhat>
References: <cover.1672742878.git.sebastien.boeuf@intel.com>
 <73b75fb87d25cff59768b4955a81fe7ffe5b4770.1672742878.git.sebastien.boeuf@intel.com>
MIME-Version: 1.0
In-Reply-To: <73b75fb87d25cff59768b4955a81fe7ffe5b4770.1672742878.git.sebastien.boeuf@intel.com>
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

On Tue, Jan 03, 2023 at 11:51:07AM +0100, sebastien.boeuf@intel.com wrote:
>From: Sebastien Boeuf <sebastien.boeuf@intel.com>
>
>This new ioctl adds support for resuming the device from userspace.
>
>This is required when trying to restore the device in a functioning
>state after it's been suspended. It is already possible to reset a
>suspended device, but that means the device must be reconfigured and
>all the IOMMU/IOTLB mappings must be recreated. This new operation
>allows the device to be resumed without going through a full reset.
>
>This is particularly useful when trying to perform offline migration of
>a virtual machine (also known as snapshot/restore) as it allows the VMM
>to resume the virtual machine back to a running state after the snapshot
>is performed.
>
>Acked-by: Jason Wang <jasowang@redhat.com>
>Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
>---
> drivers/vhost/vdpa.c       | 18 ++++++++++++++++++
> include/uapi/linux/vhost.h |  8 ++++++++
> 2 files changed, 26 insertions(+)
>
>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>index 833617d00ef6..1db7bd39fb63 100644
>--- a/drivers/vhost/vdpa.c
>+++ b/drivers/vhost/vdpa.c
>@@ -502,6 +502,21 @@ static long vhost_vdpa_suspend(struct vhost_vdpa *v)
> 	return ops->suspend(vdpa);
> }
>
>+/* After a successful return of this ioctl the device resumes processing
>+ * virtqueue descriptors. The device becomes fully operational the same way it
>+ * was before it was suspended.
>+ */
>+static long vhost_vdpa_resume(struct vhost_vdpa *v)
>+{
>+	struct vdpa_device *vdpa = v->vdpa;
>+	const struct vdpa_config_ops *ops = vdpa->config;
>+
>+	if (!ops->resume)
>+		return -EOPNOTSUPP;
>+
>+	return ops->resume(vdpa);
>+}
>+
> static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
> 				   void __user *argp)
> {
>@@ -687,6 +702,9 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
> 	case VHOST_VDPA_SUSPEND:
> 		r = vhost_vdpa_suspend(v);
> 		break;
>+	case VHOST_VDPA_RESUME:
>+		r = vhost_vdpa_resume(v);
>+		break;
> 	default:
> 		r = vhost_dev_ioctl(&v->vdev, cmd, argp);
> 		if (r == -ENOIOCTLCMD)
>diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
>index f9f115a7c75b..92e1b700b51c 100644
>--- a/include/uapi/linux/vhost.h
>+++ b/include/uapi/linux/vhost.h
>@@ -180,4 +180,12 @@
>  */
> #define VHOST_VDPA_SUSPEND		_IO(VHOST_VIRTIO, 0x7D)
>
>+/* Resume a device so it can resume processing virtqueue requests
>+ *
>+ * After the return of this ioctl the device will have restored all the
>+ * necessary states and it is fully operational to continue processing the
>+ * virtqueue descriptors.

IIUC this is a no-op if the device wasn't suspended.
If you have to resend, maybe add this info also here in the user 
documentation.

Anyway, the patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>+ */
>+#define VHOST_VDPA_RESUME		_IO(VHOST_VIRTIO, 0x7E)
>+
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
