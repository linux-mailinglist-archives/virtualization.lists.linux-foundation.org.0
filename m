Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A6643B2C5
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 14:58:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20AFC80B24;
	Tue, 26 Oct 2021 12:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8Ypcg2YseuC; Tue, 26 Oct 2021 12:58:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D4C3D80B04;
	Tue, 26 Oct 2021 12:58:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66921C0021;
	Tue, 26 Oct 2021 12:58:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60309C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 12:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EC2A606B4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 12:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBzy9hEgORro
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 12:58:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 057C0605BE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635253102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=maMbZCJsn+diqU2YE69Ld2sR/D62pJwAzmWzXKCNJbY=;
 b=WvOqkm6/DN0eccnjNo9LRx84xv80wTc8nLZcEtUDG7zJRJTZ0zod1F6IneCl8TwIKGOVK/
 JgIkDb/yMFYwi/YGqxP5a4L7yb/MR3d/gqdVQEs3JDKSu9VdUpewYAhVXZ1rTRc65rhMLk
 G/1Xxreo85trINgGjc4PzYPf8+ThTd0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-VARQhdiaMz2GThSUVcJYvA-1; Tue, 26 Oct 2021 08:58:21 -0400
X-MC-Unique: VARQhdiaMz2GThSUVcJYvA-1
Received: by mail-ed1-f72.google.com with SMTP id
 o22-20020a056402439600b003dd4f228451so6474942edc.16
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 05:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=maMbZCJsn+diqU2YE69Ld2sR/D62pJwAzmWzXKCNJbY=;
 b=ITrbwY2UzZGoDCRvf+IwVZfhrxUYIl3b/9qMddv9zvZ+aKl1V8DgynYiRWxdc4A+DM
 I20DtICLVsf7sv1zjG6KJ7c6JybQgQwuALsV/IKaO/2mxT7UGgQjp37RbhzMa6CbmgZD
 VWZ1D7VzYZkc1cFM1Ot7Xz7B9cpuStzcL7UGT6YF2yCaAjqSRvEtsUWauHM6AbYw1DCW
 M0BpPyK51qjJHWp3xysT67mmH6SsGu4Sv7zi2F12T3wgWpE2jNSK9AqUBFcnGnPH+k1V
 agXSX+zwdzpbANWW6NbUjh2BHL5Pfxy1RqPz37ZFdf00VWHOYsR9lkSEMsmltPGPnltI
 FZ/Q==
X-Gm-Message-State: AOAM530breETkxdRFQAyP7orSv5VCP6p1EONlssrlHSnD+owJmmNXNEc
 +F/d2hTIc10L9NPVgenkY2VqFxnJjrsnSvd7iVmGycfuSRJKiuak4+hX3yj6w/zh/tPyZ1EDjj0
 zmiXTvvsqV+cQcxShoPv4uGO1IpVhbXuGLqzjMP4nJA==
X-Received: by 2002:a17:907:8a26:: with SMTP id
 sc38mr10405931ejc.38.1635253100397; 
 Tue, 26 Oct 2021 05:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5zN5/EWBjagXvyyRjf1CHCSNLwc6hccVbIy85/ePeN3h6lRh3QNfqhAa/6Iv9ScYyMItdBQ==
X-Received: by 2002:a17:907:8a26:: with SMTP id
 sc38mr10405903ejc.38.1635253100167; 
 Tue, 26 Oct 2021 05:58:20 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id b19sm9014112ejc.107.2021.10.26.05.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 05:58:19 -0700 (PDT)
Date: Tue, 26 Oct 2021 14:58:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH linux-next v6 1/8] vdpa: Introduce and use vdpa device
 get, set config helpers
Message-ID: <20211026125817.cr7vld2623hth2wd@steredhat>
References: <20211026040243.79005-1-parav@nvidia.com>
 <20211026040243.79005-2-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211026040243.79005-2-parav@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: elic@nvidia.com, mst@redhat.com, virtualization@lists.linux-foundation.org
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

On Tue, Oct 26, 2021 at 07:02:36AM +0300, Parav Pandit via Virtualization wrote:
>Subsequent patches enable get and set configuration either
>via management device or via vdpa device' config ops.
>
>This requires synchronization between multiple callers to get and set
>config callbacks. Features setting also influence the layout of the
>configuration fields endianness.
>
>To avoid exposing synchronization primitives to callers, introduce
>helper for setting the configuration and use it.
>
>Signed-off-by: Parav Pandit <parav@nvidia.com>
>Reviewed-by: Eli Cohen <elic@nvidia.com>
>Acked-by: Jason Wang <jasowang@redhat.com>
>---
>changelog:
>v4->v5:
> - use vdpa_set_config() API in virtio_vdpa driver
>---
> drivers/vdpa/vdpa.c          | 36 ++++++++++++++++++++++++++++++++++++
> drivers/vhost/vdpa.c         |  3 +--
> drivers/virtio/virtio_vdpa.c |  3 +--
> include/linux/vdpa.h         | 19 ++++---------------
> 4 files changed, 42 insertions(+), 19 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
