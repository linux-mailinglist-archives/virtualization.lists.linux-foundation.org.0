Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A898199F7D
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 21:53:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3879E8891A;
	Tue, 31 Mar 2020 19:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvV6ZUNnNrs1; Tue, 31 Mar 2020 19:53:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8EB65888E5;
	Tue, 31 Mar 2020 19:53:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 720F8C07FF;
	Tue, 31 Mar 2020 19:53:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7395BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 65D8E87EAC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5giarkyJh1cq
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:53:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B378087EA7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585684385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+0L18ghMBeJFqgkk8fraiAJt9W7Fj8n4olMso+0R4s=;
 b=U8sJC9LcIH/cyG49HuvLHSEsLhWc/nwsbMcbOJIeOLCOo53DRSWrRyCpk6JxGinkhzFFGI
 y7zL6rCKP6sPCIDpxl5kmyYzcSTI4M9rW46zDcI0zmb1grf8rPNW+W75zoESxsGRsQxz7t
 qDVdPtxo2rSgAX7+zIxdV32CBlcCZo4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-dksAp6bePc-m8H3AIlSMWw-1; Tue, 31 Mar 2020 15:51:14 -0400
X-MC-Unique: dksAp6bePc-m8H3AIlSMWw-1
Received: by mail-wm1-f69.google.com with SMTP id z24so548550wml.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 12:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b2UFMAgHLjerJ9NMZry/HpffFH2cpApwyp5N9quNxNg=;
 b=VBGiTIE98PJq2x3rHoYYHWr7FkeInrC7BPTgXwHK2d8Uhcw1maaicU6WZvR+r2aKNJ
 QCDAxDpXjlm4lHmRIsNhjxH3fvUxfpraLXhd/ZNkc/q7TOV2yGUU8rgjWwTejw+hXIyX
 l5mfvp5yFCI5E3m+hkJ3kgrke19EFpZCeOfq5wrjdZn5kQ46I1x8WsLVmHqBdvZQjPYb
 isypUH8bgcMNH9fwkVrR/3MkCv77Wy/x/1ZZO/oS2g/nizZHmtKwF8jziEeFQvocypTF
 F8t07YTiTh8uhaunsGKyhm8mjW/Zxn3ilwZxsUhXbYxreVLlyY5L5NoLX44mXUb/CPZ9
 pCpA==
X-Gm-Message-State: ANhLgQ2qXoiaszuGU17b757AwOwtfAgO9h3bu+0pp6BWOtUlFK7Woj80
 J1qWVSyrq41HeZ0FUb5y1EdwshikxVtdxOTcROFP082B/oevQSjKXfVVYjpizNMq087htGBlCI9
 UDz45GqoKVQr38EDl5F86HfMXr3fu8BObAIKh1jKbyQ==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr21178497wri.88.1585684273179; 
 Tue, 31 Mar 2020 12:51:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsBF9cECw6xLYUjwBS31gILdZtjJFvdt8FOUuQyT0OA1wSrJbotTajrFFZAFpWOR4/ADVtrdQ==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr21178477wri.88.1585684272926; 
 Tue, 31 Mar 2020 12:51:12 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id y15sm1290983wrh.50.2020.03.31.12.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:51:12 -0700 (PDT)
Date: Tue, 31 Mar 2020 15:51:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v3 0/8] vhost: Reset batched descriptors on
 SET_VRING_BASE call
Message-ID: <20200331155049-mutt-send-email-mst@kernel.org>
References: <20200331192804.6019-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200331192804.6019-1-eperezma@redhat.com>
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

On Tue, Mar 31, 2020 at 09:27:56PM +0200, Eugenio P=C3=A9rez wrote:
> Vhost did not reset properly the batched descriptors on SET_VRING_BASE
> event. Because of that, is possible to return an invalid descriptor to
> the guest.
> =

> This series ammend this, resetting them every time backend changes, and
> creates a test to assert correct behavior. To do that, they need to
> expose a new function in virtio_ring, virtqueue_reset_free_head, only
> on test code.
> =

> Another useful thing would be to check if mutex is properly get in
> vq private_data accessors. Not sure if mutex debug code allow that,
> similar to C++ unique lock::owns_lock. Not acquiring in the function
> because caller code holds the mutex in order to perform more actions.

I pushed vhost branch with patch 1, pls send patches on top of that!

> v3:
> * Rename accesors functions.
> * Make scsi and test use the accesors too.
> =

> v2:
> * Squashed commits.
> * Create vq private_data accesors (mst).
> =

> This is meant to be applied on top of
> c4f1c41a6094582903c75c0dcfacb453c959d457 in
> git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git.
> =

> Eugenio P=C3=A9rez (5):
>   vhost: Create accessors for virtqueues private_data
>   tools/virtio: Add --batch option
>   tools/virtio: Add --batch=3Drandom option
>   tools/virtio: Add --reset=3Drandom
>   tools/virtio: Make --reset reset ring idx
> =

> Michael S. Tsirkin (3):
>   vhost: option to fetch descriptors through an independent struct
>   vhost: use batched version by default
>   vhost: batching fetches
> =

>  drivers/vhost/net.c          |  28 ++--
>  drivers/vhost/scsi.c         |  14 +-
>  drivers/vhost/test.c         |  69 ++++++++-
>  drivers/vhost/test.h         |   1 +
>  drivers/vhost/vhost.c        | 271 +++++++++++++++++++++++------------
>  drivers/vhost/vhost.h        |  44 +++++-
>  drivers/vhost/vsock.c        |  14 +-
>  drivers/virtio/virtio_ring.c |  29 ++++
>  tools/virtio/linux/virtio.h  |   2 +
>  tools/virtio/virtio_test.c   | 123 ++++++++++++++--
>  10 files changed, 456 insertions(+), 139 deletions(-)
> =

> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
