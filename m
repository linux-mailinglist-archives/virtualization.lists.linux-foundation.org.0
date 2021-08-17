Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 128873EE6D7
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 08:46:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3D880CB3;
	Tue, 17 Aug 2021 06:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4hG-3Ekx0Rn; Tue, 17 Aug 2021 06:46:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9BE3F80CCF;
	Tue, 17 Aug 2021 06:46:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19A81C0022;
	Tue, 17 Aug 2021 06:46:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 947C0C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 06:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B17D607D2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 06:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8FhrrRtDspz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 06:46:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F348607CB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 06:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629182764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lXzAWi/HXh25vel2OolK4VZSzbIL75BQ1OCpFeAQ1hU=;
 b=a6zasJlmcSOHKMT988NrP0xM3x6atMvj7g7dt4s5Pgc/O1mSIR+9Ve5LWtcfsF+8UF7HQh
 jwyMRKPYx+yZlgoNDq/vA8sXy3EofAl2umXTRqumloWuVhbw9/N69uzOd+osFlq+ZHXANg
 H/P6uqd0EMQeorRwbugc0i8T7o+laMA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-RldEljFTN_qP-KwMwk5Hbg-1; Tue, 17 Aug 2021 02:46:00 -0400
X-MC-Unique: RldEljFTN_qP-KwMwk5Hbg-1
Received: by mail-ed1-f71.google.com with SMTP id
 o17-20020aa7d3d1000000b003beaf992d17so7283492edr.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 23:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lXzAWi/HXh25vel2OolK4VZSzbIL75BQ1OCpFeAQ1hU=;
 b=MBiGyUnC009g5qL+8Wq68SNDFMkmWy4369m9BeaAxCXKRZq4IHd0LOtkCg7gzuxbl4
 SscHeT+5qvCvfNPvxkbziQL2SfVOfEfXqhwZs93vdVhvPIDs2ib3bJNGxhf2c+aU30Zf
 C2UQgas94aq7smRSTfdouXuf6d1x3X3+AlZghFyShdw15Um7u4L/X1v196iDlfrpMSJX
 I91Gt5EC4aw/TpXYL/2YjBbddMFdbs0cM19YHqYaokgdx6tT665I1h75JAhW9MJh1xN1
 A3RmdMMTRzGsvq3n9hyWd3V3JcBWmmlZVW7m5IiQ+I3Lp6SrsxmDIPaDujjNGrOoFXsZ
 6XLw==
X-Gm-Message-State: AOAM533PC03Gka7jp83KqfEOEZKR51HYrvQV/D8r6UiLWrgW1Bqk1ZFU
 1Zxg2M1OFYL6AdFI0MxjwK3CVHbE492ENlPbh+2Eyctq0rwp8W36lrCyRN9v5A6/GT6ZuEBQxNd
 15MHoG/Mv3oLWvhsiOJeoHh9lNO5Kso8kYc7VWtelGQ==
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr2370514ede.44.1629182759263; 
 Mon, 16 Aug 2021 23:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH2wWiYROA/dfLu4hqPoGlGhFo7q8W4+f9VoW35hDbwGSiGiLOK+rAIUjANWYFYXWhk+AKuA==
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr2370494ede.44.1629182759049; 
 Mon, 16 Aug 2021 23:45:59 -0700 (PDT)
Received: from redhat.com ([2.55.150.133])
 by smtp.gmail.com with ESMTPSA id qh2sm337553ejb.75.2021.08.16.23.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:45:58 -0700 (PDT)
Date: Tue, 17 Aug 2021 02:45:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net] virtio-net: use NETIF_F_GRO_HW instead of NETIF_F_LRO
Message-ID: <20210817023118-mutt-send-email-mst@kernel.org>
References: <20210817020338.6400-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210817020338.6400-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: willemb@google.com, netdev@vger.kernel.org, ivan@prestigetransportation.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kuba@kernel.org, davem@davemloft.net
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

Patch is good. Suggest some tweaks to the commit log.

On Tue, Aug 17, 2021 at 10:03:38AM +0800, Jason Wang wrote:
> Commit a02e8964eaf92 ("virtio-net: ethtool configurable LRO") tries to
> advertise LRO on behalf of the guest offloading features and allow the

tries to advertise -> advertises

that part actually works.

allow -> allows

on behalf of features is really weird. maybe "maps"?

> administrator to enable and disable those features via ethtool.
> 
> This may lead several issues:

may lead->lead to

> 
> - For the device that doesn't support control guest offloads, the
>   "LRO" can't be disabled so we will get a warn in the

warn -> warning

>   dev_disable_lro()

.. when turning off LRO or when enabling forwarding bridging etc.

> - For the device that have the control guest offloads, the guest

have the -> supports

>   offloads were disabled in the case of bridge etc

etc -> forwarding etc

> which may slow down

were -> are

may slow -> slows

>   the traffic.
> 
> Fixing this by using NETIF_F_GRO_HW instead. Though the spec does not
> guaranteed to be re-segmented as original explicitly now, we can add

guaranteed -> guarantee

> that to the spec

I would add:

Further, we never advertised LRO historically before a02e8964eaf92
("virtio-net: ethtool configurable LRO") and so bridged/forwarded
configs effectively relied on virtio receive offloads being GRO.




> and then we can catch the bad configuration and
> setup.

Don't know what does this part mean. How would we catch it?
With a new flag? Let's say so.

> 
> Fixes: a02e8964eaf92 ("virtio-net: ethtool configurable LRO")
> Signed-off-by: Jason Wang <jasowang@redhat.com>



Proposed rewritten commit log:

===
[PATCH net] virtio-net: use NETIF_F_GRO_HW instead of NETIF_F_LRO

Commit a02e8964eaf92 ("virtio-net: ethtool configurable LRO")
maps LRO to virtio guest offloading features and allows the
administrator to enable and disable those features via ethtool.
 
This leads to several issues:


- For a device that doesn't support control guest offloads, the "LRO"
  can't be disabled triggering WARN in dev_disable_lro() when turning
  off LRO or when enabling forwarding bridging etc.

- For a device that supports control guest offloads, the guest
  offloads are disabled in cases of bridging, forwarding etc
  slowing down the traffic.
 
Fix this by using NETIF_F_GRO_HW instead. Though the spec does not
guarantee packets to be re-segmented as the original ones,
we can add that to the spec, possibly with a flag for devices to
differentiate between GRO and LRO.

Further, we never advertised LRO historically before a02e8964eaf92
("virtio-net: ethtool configurable LRO") and so bridged/forwarded
configs effectively always relied on virtio receive offloads behaving
like GRO - thus even if this breaks any configs it is at least not
a regression.

Fixes: a02e8964eaf92 ("virtio-net: ethtool configurable LRO")
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reported-by: Ivan <ivan@prestigetransportation.com>
Tested-by: Ivan <ivan@prestigetransportation.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>

===


> ---
>  drivers/net/virtio_net.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 0416a7e00914..10c382b08bce 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -63,7 +63,7 @@ static const unsigned long guest_offloads[] = {
>  	VIRTIO_NET_F_GUEST_CSUM
>  };
>  
> -#define GUEST_OFFLOAD_LRO_MASK ((1ULL << VIRTIO_NET_F_GUEST_TSO4) | \
> +#define GUEST_OFFLOAD_GRO_HW_MASK ((1ULL << VIRTIO_NET_F_GUEST_TSO4) | \
>  				(1ULL << VIRTIO_NET_F_GUEST_TSO6) | \
>  				(1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
>  				(1ULL << VIRTIO_NET_F_GUEST_UFO))
> @@ -2481,7 +2481,7 @@ static int virtnet_xdp_set(struct net_device *dev, struct bpf_prog *prog,
>  	        virtio_has_feature(vi->vdev, VIRTIO_NET_F_GUEST_ECN) ||
>  		virtio_has_feature(vi->vdev, VIRTIO_NET_F_GUEST_UFO) ||
>  		virtio_has_feature(vi->vdev, VIRTIO_NET_F_GUEST_CSUM))) {
> -		NL_SET_ERR_MSG_MOD(extack, "Can't set XDP while host is implementing LRO/CSUM, disable LRO/CSUM first");
> +		NL_SET_ERR_MSG_MOD(extack, "Can't set XDP while host is implementing GRO_HW/CSUM, disable GRO_HW/CSUM first");
>  		return -EOPNOTSUPP;
>  	}
>  
> @@ -2612,15 +2612,15 @@ static int virtnet_set_features(struct net_device *dev,
>  	u64 offloads;
>  	int err;
>  
> -	if ((dev->features ^ features) & NETIF_F_LRO) {
> +	if ((dev->features ^ features) & NETIF_F_GRO_HW) {
>  		if (vi->xdp_enabled)
>  			return -EBUSY;
>  
> -		if (features & NETIF_F_LRO)
> +		if (features & NETIF_F_GRO_HW)
>  			offloads = vi->guest_offloads_capable;
>  		else
>  			offloads = vi->guest_offloads_capable &
> -				   ~GUEST_OFFLOAD_LRO_MASK;
> +				   ~GUEST_OFFLOAD_GRO_HW_MASK;
>  
>  		err = virtnet_set_guest_offloads(vi, offloads);
>  		if (err)
> @@ -3100,9 +3100,9 @@ static int virtnet_probe(struct virtio_device *vdev)
>  		dev->features |= NETIF_F_RXCSUM;
>  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
>  	    virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
> -		dev->features |= NETIF_F_LRO;
> +		dev->features |= NETIF_F_GRO_HW;
>  	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> -		dev->hw_features |= NETIF_F_LRO;
> +		dev->hw_features |= NETIF_F_GRO_HW;
>  
>  	dev->vlan_features = dev->features;
>  
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
