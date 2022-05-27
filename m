Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9B5535EA8
	for <lists.virtualization@lfdr.de>; Fri, 27 May 2022 12:50:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD44E61686;
	Fri, 27 May 2022 10:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buuY_xoJYgwn; Fri, 27 May 2022 10:50:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8B78561681;
	Fri, 27 May 2022 10:50:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0B8BC007E;
	Fri, 27 May 2022 10:50:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93B24C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 May 2022 10:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F3F7428A4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 May 2022 10:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AR3AFuDP1Laj
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 May 2022 10:50:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BD8F42895
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 May 2022 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653648607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l2Lh+gpGDkrHKWoEv+QKFc0qknv05ZH2I5oLoT3BQ3w=;
 b=ez9AvT1B4NZ/MUDoOykLozkTNl8FJXcGC15qzLS0DRTXuXdkh63SwQEPnVC0UWwRtiA3sC
 2hxEopK8rrOzSipx/hZOzvb/vrd6hHPHXKOFv7/uc0fl5/eBb83K2zzHvMBs3A0eDTi5ga
 WXKypaY0X0DhTZWNPXoeAi2l7lEuYk8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-FEQGrT-BPEiOGm6X6WkGwg-1; Fri, 27 May 2022 06:50:06 -0400
X-MC-Unique: FEQGrT-BPEiOGm6X6WkGwg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u12-20020a05600c19cc00b0038ec265155fso4619596wmq.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 May 2022 03:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l2Lh+gpGDkrHKWoEv+QKFc0qknv05ZH2I5oLoT3BQ3w=;
 b=ztMx5nDNQiJIes7KpxYe09mea9fTRBnPKtOCy1yyJ3o2lVNZrJEXeYmSpd1dkI+W6a
 RZ8nUhY+N5beff07O0AbCRFn/dkOsqRmgbseTiKPXZ2Vonfasji61BaweqjSL0LHhlEg
 dXZ3xY4ykctpfNMAIAi9z1q8bBxwJY3Ov/uf+ZnvEsjiP2LY/ssRCCBNDDZHCRDvtOaj
 zy7a/FRAin1bOX/LNZ+GU5lzxRBL7yMQ35Na49WycOBbN0du5WoMDsnEmt5FQUVf18AI
 xy9vV2V24+kz1yEOXFlatfUC/JLvUxGqyFFWovQlRdt6LQm4MYV6IS3oV5Ge3xRWhd0d
 O7hA==
X-Gm-Message-State: AOAM531O1OtQOIuhL3p4bvPBhuhVk+6mmDk3EerBhyfdPoHYqArAqlmV
 muNepMUjl40of0VHP2tGxGTfMc9ch9gg/V4RgUw2OOBPD6DZrtraLabRDF7MkrmostR2wmhk+L/
 IIYeS8iiiDbK+rgeJ1oWUu8ofE92JqVCri10tu8LuEw==
X-Received: by 2002:adf:d1e7:0:b0:20f:dd30:489b with SMTP id
 g7-20020adfd1e7000000b0020fdd30489bmr19682798wrd.94.1653648605107; 
 Fri, 27 May 2022 03:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS7mTUl4muodaOxpb3A92/00mQUnf2JML65CurJrTdcEaXMLxZDQNgec7W8o6+Bm+X58NZew==
X-Received: by 2002:adf:d1e7:0:b0:20f:dd30:489b with SMTP id
 g7-20020adfd1e7000000b0020fdd30489bmr19682778wrd.94.1653648604834; 
 Fri, 27 May 2022 03:50:04 -0700 (PDT)
Received: from redhat.com ([2.55.130.213]) by smtp.gmail.com with ESMTPSA id
 r2-20020a7bc082000000b00397402ae674sm1828344wmh.11.2022.05.27.03.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:50:04 -0700 (PDT)
Date: Fri, 27 May 2022 06:50:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V6 9/9] virtio: use WARN_ON() to warning illegal status
 value
Message-ID: <20220527064118-mutt-send-email-mst@kernel.org>
References: <20220527060120.20964-1-jasowang@redhat.com>
 <20220527060120.20964-10-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220527060120.20964-10-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Peter Oberparleiter <oberpar@linux.ibm.com>, lulu@redhat.com,
 paulmck@kernel.org, linux-s390@vger.kernel.org, peterz@infradead.org,
 maz@kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 eperezma@redhat.com, Vineeth Vijayan <vneethv@linux.ibm.com>,
 tglx@linutronix.de
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

At a minimum, I don't see why it's part of the series. Host can always
crash the guest if it wants to ...
The point of BUG_ON is device or driver is already corrupted so we
should not try to drive it.  If you still want this in pls come up with
a better commit log explaining the why.

On Fri, May 27, 2022 at 02:01:20PM +0800, Jason Wang wrote:
> We used to use BUG_ON() in virtio_device_ready() to detect illegal

not really, BUG_ON just crashes the kernel.  we detect by checking
status.

> status value, this seems sub-optimal since the value is under the
> control of the device. Switch to use WARN_ON() instead.

some people use crash on warn so ...

> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Vineeth Vijayan <vneethv@linux.ibm.com>
> Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Jason Wang <jasowang@redhat.com>

> ---
>  include/linux/virtio_config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index d4edfd7d91bb..9a36051ceb76 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -255,7 +255,7 @@ void virtio_device_ready(struct virtio_device *dev)
>  {
>  	unsigned status = dev->config->get_status(dev);
>  
> -	BUG_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> +	WARN_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
>  

we lose debuggability as guest will try to continue.
if we are doing this let us print a helpful message and dump a lot of
state right here.

>  	/*
>  	 * The virtio_synchronize_cbs() makes sure vring_interrupt()
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
