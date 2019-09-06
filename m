Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 212FDABA47
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 16:06:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D7A8E235D;
	Fri,  6 Sep 2019 14:06:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF4E42356
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:06:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7C9D5756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:06:43 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0919CC05AA63
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:06:43 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id q62so6589952qkd.3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 07:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=XVlBYwWWxYZBuj80Wo4VR566is8MJKIph81f4lPbuDU=;
	b=gpbqY8cVSRFXim43qjDp18uJbx3CvaCFHx67PhbaZ9/vF8gXBoJs+lA/JVFXS1CEUl
	A/Ke88G6BpnPVGjU8emd3Raeu9ynQbcOb/1eEhUzjxM8AcTco3cVDpd4a7nrO3TGORK3
	xHJ4jI8A50NKt+pB/KQ/EZJRg0aqnfUBTa2UDXCs7m+IhDIX6ev01IM23oqMwB6I2JA0
	JMZ9pWMSrqcDzjxTLDaD9UmH4P3LRDYi7WxAhAtv5hPEAIO0wIsJssRvDxYIA/Lw0MmL
	NswYFxeDoRas3pyUQxeuxHV54GNmwMLzhsjy6mq9i0R530cpZ5fTA/MD2cQn4xhFTj4Z
	buUA==
X-Gm-Message-State: APjAAAXJvQgj0OQDSPEKvpDDhNB5UB3Tm65nQCC+8eGTlfuXIRYJMPma
	AEcLptCbW4WZoaqHS8YCAH42Ww21yP7iy8UBQXiRPdKmwUlV0VwnpN6ubw/LdDDDClco9VvhhKS
	YzKsyA65inTmsaVGB5zof3AFD948vFsaBKd6mwzeeAg==
X-Received: by 2002:a05:620a:1592:: with SMTP id
	d18mr8385847qkk.468.1567778802400; 
	Fri, 06 Sep 2019 07:06:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFfHmt4BAMm3zXYOXNtxtGGgrko1UO/aCARKEq+SvfmFdpDLoU/MFEaF1sYtHtlkBh4NqgIw==
X-Received: by 2002:a05:620a:1592:: with SMTP id
	d18mr8385838qkk.468.1567778802258; 
	Fri, 06 Sep 2019 07:06:42 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id l22sm2186175qtp.8.2019.09.06.07.06.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 07:06:41 -0700 (PDT)
Date: Fri, 6 Sep 2019 10:06:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matej Genci <matej.genci@nutanix.com>
Subject: Re: [PATCH] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20190906100456-mutt-send-email-mst@kernel.org>
References: <20190906124130.129870-1-matej.genci@nutanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906124130.129870-1-matej.genci@nutanix.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Sep 06, 2019 at 12:42:14PM +0000, Matej Genci wrote:
> Add macro to disable legacy functions vring_init and vring_size.
> 
> Signed-off-by: Matej Genci <matej.genci@nutanix.com>
> ---
>  include/uapi/linux/virtio_ring.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
> index 4c4e24c291a5..496db2f33830 100644
> --- a/include/uapi/linux/virtio_ring.h
> +++ b/include/uapi/linux/virtio_ring.h
> @@ -164,6 +164,8 @@ struct vring {
>  #define vring_used_event(vr) ((vr)->avail->ring[(vr)->num])
>  #define vring_avail_event(vr) (*(__virtio16 *)&(vr)->used->ring[(vr)->num])
>  
> +#ifndef VIRTIO_RING_NO_LEGACY
> +
>  static inline void vring_init(struct vring *vr, unsigned int num, void *p,
>  			      unsigned long align)
>  {
> @@ -181,6 +183,8 @@ static inline unsigned vring_size(unsigned int num, unsigned long align)
>  		+ sizeof(__virtio16) * 3 + sizeof(struct vring_used_elem) * num;
>  }
>  
> +#endif
> +
>  /* The following is used with USED_EVENT_IDX and AVAIL_EVENT_IDX */
>  /* Assuming a given event_idx value from the other side, if
>   * we have just incremented index from old to new_idx,

Thanks!
I am guessing vring_used_event/vring_avail_event should be within
this ifndef too? How about struct vring?


> -- 
> 2.22.0
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
