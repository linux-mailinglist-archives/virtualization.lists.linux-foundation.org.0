Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EE123666
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 21:05:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77E51880F5;
	Tue, 17 Dec 2019 20:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysLi450OQ7cN; Tue, 17 Dec 2019 20:05:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CCBF8880D4;
	Tue, 17 Dec 2019 20:05:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86FB1C077D;
	Tue, 17 Dec 2019 20:05:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30BD0C077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1FAE287662
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fq1dqoN9kcO1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5DBD287669
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576613144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VowxeIyX6/TXa5Y2oDfLN6j19vXqj1qdYimwac68akM=;
 b=UfhA5y9Vx/0EjGMo9VIqC4/wxslvI6SGJbY6sC8an6aGjJAGbBv7rGaLamoalJG+PQzM+Z
 dSwBk7WRCkB942cQ7GGQ5McfOZoi0EIxz3799PeTzfVHt8MbDGi19yDKJJ4pcqbZedqoW9
 6cKXbSC5Nle9qLVJ5IdbNphFBdGhH84=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-uh_aPkkOPyGlnSea9NZRNw-1; Tue, 17 Dec 2019 15:05:41 -0500
Received: by mail-qv1-f69.google.com with SMTP id f16so7430095qvr.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 12:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VowxeIyX6/TXa5Y2oDfLN6j19vXqj1qdYimwac68akM=;
 b=e3ehXa6PeDeLKJtlMeILm+vP17sQDDLajD94N7rAu+HfhFDX9su/DC82PwTkXJoxhD
 kztt9i/VcGXKScitfgSSPfMsl+7G8c1a9qxKyXbExnbGTyBCyZSE6mEpujp+Q6E/JZSD
 9upBWwW9u1R33dPHhfa5Sse83yFH+BE57E/ZkQZ+teXLswTWwk+rcM5r/K6+z/+vAWRW
 QCoGXSsoQL/0Bn3DaZUu/Uck8bb8RignBykYrlBOefDaTqpbYGtTGabZJ27MiR3xlIRg
 bDX80XqxjB6KdWK5EBpr8NqW0+Uy42I93QIsoiXU0azMJbwJXkORW/vjRhgHhCm5f5tS
 rJLg==
X-Gm-Message-State: APjAAAWCSADVIN/Gxr+n70gbpgg9O2GROKSKrXuWl8cY9I//kW2vTkrH
 asP1A9g0VPwr4YfvnIZcbEnZFrhgXEgo/s8pe9ZuKUpbBNh3u6NZj7MQPhAHfO/Wutz6BaiP9/q
 a+3NxBtNQEMdVQYARFy9VLK27zEAPDyYerlzygiewAA==
X-Received: by 2002:a37:9ed1:: with SMTP id h200mr7218632qke.390.1576613140986; 
 Tue, 17 Dec 2019 12:05:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3fH1ifbhp6AcBP1rhtJW6dID+gAFI2vhUGms8Zy9i8Ueszv4jD2Az9pTYwDsNuxSaKl89VQ==
X-Received: by 2002:a37:9ed1:: with SMTP id h200mr7218610qke.390.1576613140779; 
 Tue, 17 Dec 2019 12:05:40 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id q73sm7387524qka.56.2019.12.17.12.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 12:05:40 -0800 (PST)
Date: Tue, 17 Dec 2019 15:05:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH 1/2] virtio-balloon: initialize all vq callbacks
Message-ID: <20191217150500-mutt-send-email-mst@kernel.org>
References: <20191217190610.248061-1-dverkamp@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191217190610.248061-1-dverkamp@chromium.org>
X-MC-Unique: uh_aPkkOPyGlnSea9NZRNw-1
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

On Tue, Dec 17, 2019 at 11:06:09AM -0800, Daniel Verkamp wrote:
> Ensure that elements of the array that correspond to unavailable
> features are set to NULL; previously, they would be left uninitialized.
> 
> Since the corresponding names array elements were explicitly set to
> NULL, the uninitialized callback pointers would not actually be
> dereferenced; however, the uninitialized callbacks elements would still
> be read in vp_find_vqs_msix() and used to calculate the number of MSI-X
> vectors required.
> 
> Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>

Actually, we already have the issue with the stats VQ, no?

So I think this one is more appropriate:
Fixes: 9564e138b1f6 ("virtio: Add memory statistics reporting to the balloon driver (V4)")


> ---
>  drivers/virtio/virtio_balloon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 93f995f6cf36..8e400ece9273 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -475,7 +475,9 @@ static int init_vqs(struct virtio_balloon *vb)
>  	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
>  	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
>  	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
> +	callbacks[VIRTIO_BALLOON_VQ_STATS] = NULL;
>  	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
> +	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
>  	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
>  
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
> -- 
> 2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
