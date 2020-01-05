Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E0130847
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 14:25:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08B918568D;
	Sun,  5 Jan 2020 13:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCi89Bqa6iZz; Sun,  5 Jan 2020 13:25:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65F0B8587C;
	Sun,  5 Jan 2020 13:25:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F8FEC0881;
	Sun,  5 Jan 2020 13:25:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1BCCC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8ADC720435
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coNS3B1L2thD
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:25:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 86B6020353
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578230724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IUzornvqkmVq3TU6TUpDqp8GmeEXj2T7/4D1zEB7uv4=;
 b=RrhBAS+SCdS5vFQPTo7RCMKDdBr8IF+TfuqRyUX64hd2GhUKHyEXSQBpqmgz3PCb2905CT
 6HpqNHFUCIY+VsRDeVA7ISXlOijgjStQJNgk9V0qFE5stPLtSmjv7njy0YBiiSSeO1lYns
 zXqQVokz1yseRQQh3mkC8tCGqNHE6L0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-17xHptcaNq6Hj7STp9qX2Q-1; Sun, 05 Jan 2020 08:25:22 -0500
Received: by mail-qk1-f199.google.com with SMTP id 24so16365774qka.16
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jan 2020 05:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IUzornvqkmVq3TU6TUpDqp8GmeEXj2T7/4D1zEB7uv4=;
 b=G72t9+y7Z2UqEVwT0mLwVxN7biLFTzs7jysFE/c3LRAI8lNgqdL9DfvXIE+xh/R9No
 TaqNlQoFiSC7Ivi4yO1bJQekAvwdMehBKJ6Verp4FTww6e8qoABWljjbf4dsb5/UV4lj
 BgFIlkcY/mVZ4vHGwy3sXlwITnY7/H4SSVfrcUsfvpdU+w8cdXiXewLDkidrwHxkwthN
 5tKJewFOcO9U04XTrULrmzJiJF6lZol/OkG0BDvkqwY9ni4c43qaILg4eOZBCaQkQ+Mx
 fuJfC6QtwpqbDJyhaOzBeNlq+1HdWoL1lxU3fR/cctlcUDWxX7rmSAA3cWX2Pa50lNFC
 Xhqw==
X-Gm-Message-State: APjAAAXwkGUAlcNTNlvU3lul5bxkFem/D1e30vcZfCU2P0EwPOSxexR0
 YhEfSNw1xvtUAzjV3pVfslBnUZbijahwp8vd1Mp/75hT5yieCpHMrRaybnqLKnEU7dtzO4SBeui
 4mo/Fk6G4zlLjzHW5rLbQjPsXIItycpWWRiN5fo7Ftw==
X-Received: by 2002:aed:3eee:: with SMTP id o43mr72578155qtf.33.1578230721718; 
 Sun, 05 Jan 2020 05:25:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7Lmxx2CQn5FOma0XrsHfKFcPO4ESb1prSTfS3DioXdE7Wrzk7bagWu6gnry8JVIqyRY75VA==
X-Received: by 2002:aed:3eee:: with SMTP id o43mr72578138qtf.33.1578230721437; 
 Sun, 05 Jan 2020 05:25:21 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id o9sm19304486qko.16.2020.01.05.05.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 05:25:20 -0800 (PST)
Date: Sun, 5 Jan 2020 08:25:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH v2 1/2] virtio-balloon: initialize all vq callbacks
Message-ID: <20200105082433-mutt-send-email-mst@kernel.org>
References: <20200103184044.73568-1-dverkamp@chromium.org>
 <286AC319A985734F985F78AFA26841F73E39205A@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <286AC319A985734F985F78AFA26841F73E39205A@shsmsx102.ccr.corp.intel.com>
X-MC-Unique: 17xHptcaNq6Hj7STp9qX2Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Cornelia Huck <cohuck@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

On Sun, Jan 05, 2020 at 12:24:11PM +0000, Wang, Wei W wrote:
> On Saturday, January 4, 2020 2:41 AM, Daniel Verkamp wrote:
> > Subject: [PATCH v2 1/2] virtio-balloon: initialize all vq callbacks
> > 
> > Ensure that elements of the callbacks array that correspond to unavailable
> > features are set to NULL; previously, they would be left uninitialized.
> > 
> > Since the corresponding names array elements were explicitly set to NULL,
> > the uninitialized callback pointers would not actually be dereferenced;
> > however, the uninitialized callbacks elements would still be read in 
> > vp_find_vqs_msix() and used to calculate the number of MSI-X vectors
> > required.
> 
> The above description doesn't seem true after your second patch gets applied.
>  
> > Cc: stable@vger.kernel.org
> > Fixes: 86a559787e6f ("virtio-balloon:
> > VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> > ---
> > 
> > v1:
> > https://lists.linuxfoundation.org/pipermail/virtualization/2019-December/04
> > 4829.html
> > 
> > Changes from v1:
> > - Clarified "array" in commit message to "callbacks array"
> > 
> >  drivers/virtio/virtio_balloon.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > index 93f995f6cf36..8e400ece9273 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -475,7 +475,9 @@ static int init_vqs(struct virtio_balloon *vb)
> >  	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
> >  	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
> >  	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
> > +	callbacks[VIRTIO_BALLOON_VQ_STATS] = NULL;
> >  	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
> > +	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
> 
> Could you remove other redundant NULL initialization well?
> https://lists.linuxfoundation.org/pipermail/virtualization/2019-December/044837.html
> 
> Best,
> Wei

I queued as is, can be tweaked by a patch on top.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
