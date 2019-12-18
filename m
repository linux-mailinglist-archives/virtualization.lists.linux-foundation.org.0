Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1B123ED1
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 06:19:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6869086AD0;
	Wed, 18 Dec 2019 05:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cb8jDZ3szFCi; Wed, 18 Dec 2019 05:19:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7693686A72;
	Wed, 18 Dec 2019 05:19:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CF9CC077D;
	Wed, 18 Dec 2019 05:19:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB854C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CEFDE86C53
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tj+cbZBsSar8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:19:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DE27186CC7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576646359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tqO9mqHuFDIe8Lt98SyZtP7oPlIs6Sds2jHKIw5qd3A=;
 b=TUZZpnngGXPpsyd/DLV/62QQzjm005ebDe+XA1whb7WQ3qTfc5jMRZGqtbzJQRpeVkjwDA
 682CDeoGjHkzLE9n1OIJQysoOrdyTiNrwxjoIExXZIjQnhp/1yx/1ze94zNWniyzZsVBTY
 PP0ohF7RXdChzq4M5JZz3SrDI7NzExQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-rtqLy5nmPkGg1LM7Wxl4-A-1; Wed, 18 Dec 2019 00:19:18 -0500
Received: by mail-qk1-f200.google.com with SMTP id k10so628219qki.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 21:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tqO9mqHuFDIe8Lt98SyZtP7oPlIs6Sds2jHKIw5qd3A=;
 b=pnuOD/lUcFyJqVxDOlGOexJIPLkh/LaDIHq/WurtMdv+2Oj6qZMhrWWZ6YWTQnznDW
 zqZbOcBZwkoZfSOZcvLZ4lDZKh9p/4IRo5+xvpi4zcqKRyISajwpDW93ycR8lVVa0TsJ
 yJFZhL1LGd42L5qCIMJfTy28kF5dm1OZILmDA5S6iQn2uRLDrcMERBkKOiE9HmS7yDZd
 EqnKfbWQZkKZeuJ2AeYYSWLvls9GSwG+o+Z7XDWLRP/k1YesHEQfA7N4eC1sbiVpC83r
 RvlZLZ1yHSn9biZo5ylMunw9RO34A7e1Ir4OG3aGtW4I4cCIbwKjMu2ag8jcEcy2HFnh
 Tm1A==
X-Gm-Message-State: APjAAAVhdGkhOdWYN/JGI8PiQ6388Cs+gUpeZtMJgvspvWDPBlbac7co
 NEoYg65XrwXEQ4eogJQGe4bAGls6Vs8GWFpeUYVlAWUszL+AOdZhCQSbZ0V7AL22yH0D3iJT5H5
 kCC6myEr4KlddMYlnQVIZmGUxAXzXSVE9nhryACZW0A==
X-Received: by 2002:a05:6214:1634:: with SMTP id
 e20mr640634qvw.205.1576646357832; 
 Tue, 17 Dec 2019 21:19:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbCFTKv9Sno28T03FAjt2rlM2S3dwuzQm9HosSEzzrrk0VdXRu40ObGahORTG61kERYXRK4w==
X-Received: by 2002:a05:6214:1634:: with SMTP id
 e20mr640619qvw.205.1576646357541; 
 Tue, 17 Dec 2019 21:19:17 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id y18sm329503qki.0.2019.12.17.21.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 21:19:16 -0800 (PST)
Date: Wed, 18 Dec 2019 00:19:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH 2/2] virtio-pci: check name when counting MSI-X vectors
Message-ID: <20191218001901-mutt-send-email-mst@kernel.org>
References: <20191217190610.248061-1-dverkamp@chromium.org>
 <20191217190610.248061-2-dverkamp@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191217190610.248061-2-dverkamp@chromium.org>
X-MC-Unique: rtqLy5nmPkGg1LM7Wxl4-A-1
X-Mimecast-Spam-Score: 0
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

On Tue, Dec 17, 2019 at 11:06:10AM -0800, Daniel Verkamp wrote:
> VQs without a name specified are not valid; they are skipped in the
> later loop that assigns MSI-X vectors to queues, but the per_vq_vectors
> loop above that counts the required number of vectors previously still
> counted any queue with a non-NULL callback as needing a vector.
> 
> Add a check to the per_vq_vectors loop so that vectors with no name are
> not counted to make the two loops consistent.  This prevents
> over-counting unnecessary vectors (e.g. for features which were not
> negotiated with the device).
> 
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>

OK so I will add
Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")

here too?

> ---
>  drivers/virtio/virtio_pci_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index f2862f66c2ac..222d630c41fc 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -294,7 +294,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
>  		/* Best option: one for change interrupt, one per vq. */
>  		nvectors = 1;
>  		for (i = 0; i < nvqs; ++i)
> -			if (callbacks[i])
> +			if (names[i] && callbacks[i])
>  				++nvectors;
>  	} else {
>  		/* Second best: one for change, shared for all vqs. */
> -- 
> 2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
