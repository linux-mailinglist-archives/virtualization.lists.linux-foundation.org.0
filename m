Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96E196D19
	for <lists.virtualization@lfdr.de>; Sun, 29 Mar 2020 13:49:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D138E882B5;
	Sun, 29 Mar 2020 11:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D65LFOZDd-Z7; Sun, 29 Mar 2020 11:49:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A2DB8829F;
	Sun, 29 Mar 2020 11:49:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FBF3C1D8A;
	Sun, 29 Mar 2020 11:49:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1A95C07FF
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 11:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBD7886407
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 11:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODKvVoh4_ZZY
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 11:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 31CD6863E0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585482570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wf7Pb5RDJ+vODtRQAqPa8zSxfUH14dv7jEx+TV09fQ=;
 b=DC+MEnJsb8fDUaDGrUyecLMB7jZDkoOGff1/PVbQmLbJ25y/ADNddpR6uZ6dkkCht33D9A
 0YX3tvm/Kxb+emHxHrfwy0WGFrMr4OEpGKu5hRMFMu2bYcZrnPsGniRAhCwi+EwOxOdjTg
 WsI+UeY+c8GYLMeOaAsLLLcYwJKAA1Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-TRxbVbvQM0y0wiQNq-bdNw-1; Sun, 29 Mar 2020 07:49:28 -0400
X-MC-Unique: TRxbVbvQM0y0wiQNq-bdNw-1
Received: by mail-wr1-f70.google.com with SMTP id y1so8359351wrn.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 04:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z3uSqDxAG/8s/s7cz44Y2/i4LCDpCHA9j5Si4puA7U0=;
 b=IBfIIOOX/9EVc07RKzOXQ641lrD+qOGhoLEUB7/gheH2AAKhzgUPi3hg/Gy6bVq0L3
 /KjgKwI/V8b4LblnCgbo8/C1HvVyWTuZltT5cuBDRU//eVWHETav0epAsSwqH0zLNN3G
 a7GEGrRMfxNiFrcO69d2eYBdwvYeZusCYWRr8R563WKZGXITz5QTRKgq0iPl848E3gZm
 0RGFZJ8EBTnZo8qeFFxXKnNd3GQXZWMzoFNMDI4XWJGnA9OEzSlmNJMFUgx+w8urgxZd
 vefsqhnYjozRPhUX4OazVp1DadtcdxrM9Pjlg1fQIjRViroVZdHIO0gtgm7WXne6pHlF
 kmZg==
X-Gm-Message-State: ANhLgQ2zotY9vcZEIoZLTTcdFqNj6ni0PC4gY2QDm7krZRvGz0XIatgx
 DP6are+OoYHWHPFx369o86G1TVVdgo31Cc+62W01qsUsTaIGZvo8dBXGR3grw7QK21jHaR44FTD
 4Ne6j4yalnQzycxeavLQGdbi1/9tnedaMT0rPpFPrkg==
X-Received: by 2002:a1c:3241:: with SMTP id y62mr8524813wmy.66.1585482567003; 
 Sun, 29 Mar 2020 04:49:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv7BukqLWASNd56mdBXcWIrZDO3DRdR8zJ4m6ol8Bj23sHTGubRNiILOzZ0ywfXFDGVJH4UAA==
X-Received: by 2002:a1c:3241:: with SMTP id y62mr8524804wmy.66.1585482566822; 
 Sun, 29 Mar 2020 04:49:26 -0700 (PDT)
Received: from redhat.com (bzq-79-183-139-129.red.bezeqint.net.
 [79.183.139.129])
 by smtp.gmail.com with ESMTPSA id 19sm3668516wmi.32.2020.03.29.04.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 04:49:26 -0700 (PDT)
Date: Sun, 29 Mar 2020 07:49:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH 0/6] vhost: Reset batched descriptors on SET_VRING_BASE
 call
Message-ID: <20200329074023-mutt-send-email-mst@kernel.org>
References: <20200329113359.30960-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200329113359.30960-1-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sun, Mar 29, 2020 at 01:33:53PM +0200, Eugenio P=C3=A9rez wrote:
> Vhost did not reset properly the batched descriptors on SET_VRING_BASE ev=
ent. Because of that, is possible to return an invalid descriptor to the gu=
est.
> This series ammend this, and creates a test to assert correct behavior. T=
o do that, they need to expose a new function in virtio_ring, virtqueue_res=
et_free_head. Not sure if this can be avoided.

Question: why not reset the batch when private_data changes?
At the moment both net and scsi poke at private data directly,
if they do this through a wrapper we can use that to
1. check that vq mutex is taken properly
2. reset batching

This seems like a slightly better API

> =

> Also, change from https://lkml.org/lkml/2020/3/27/108 is not included, th=
at avoids to update a variable in a loop where it can be updated once.
> =

> This is meant to be applied on top of eccb852f1fe6bede630e2e4f1a121a81e34=
354ab in git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git, and some co=
mmits should be squashed with that series.

Thanks a lot! I'll apply this for now so Christian can start testing,
but I'd like the comment above addressed before I push this to Linus.

> Eugenio P=C3=A9rez (6):
>   tools/virtio: Add --batch option
>   tools/virtio: Add --batch=3Drandom option
>   tools/virtio: Add --reset=3Drandom
>   tools/virtio: Make --reset reset ring idx
>   vhost: Delete virtqueue batch_descs member
>   fixup! vhost: batching fetches
> =

>  drivers/vhost/test.c         |  57 ++++++++++++++++
>  drivers/vhost/test.h         |   1 +
>  drivers/vhost/vhost.c        |  12 +++-
>  drivers/vhost/vhost.h        |   1 -
>  drivers/virtio/virtio_ring.c |  18 +++++
>  include/linux/virtio.h       |   2 +
>  tools/virtio/linux/virtio.h  |   2 +
>  tools/virtio/virtio_test.c   | 123 +++++++++++++++++++++++++++++++----
>  8 files changed, 201 insertions(+), 15 deletions(-)
> =

> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
