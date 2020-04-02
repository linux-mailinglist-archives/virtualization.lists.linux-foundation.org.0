Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D219C291
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 15:27:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 066DF8796B;
	Thu,  2 Apr 2020 13:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSl6acaS4q4C; Thu,  2 Apr 2020 13:27:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08AB887E5E;
	Thu,  2 Apr 2020 13:27:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF65CC07FF;
	Thu,  2 Apr 2020 13:27:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1597CC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0D06D86FFD
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwjJj7cjBE1S
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:27:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C67E486FF0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585834065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBxDnVbmV10hwfHFqzu1/yc4AeVRZCJ3Pl9eO9sfNPc=;
 b=Nruwhfjqo7u4JJRfXt/y2PvumOcWlmi8/OmP03ndqQD9pXjWmpCDZMIq4lRJKbGUb4CQ2j
 ZvKFf92DjSFrydtVk4s4fkunQ6zeN+4tG4dSGPUt8/Y7zKwsDcpaCuBT1ilUtNk5M0h4Pd
 x91F+HUpV2Sbqs9h8CSvlpvXdIHOLsU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-j_f9iicAMFisZnp2mxanFw-1; Thu, 02 Apr 2020 09:27:44 -0400
X-MC-Unique: j_f9iicAMFisZnp2mxanFw-1
Received: by mail-qt1-f198.google.com with SMTP id g13so3083196qti.21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 06:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/1eX8MBJ9dVspbC5Z01wrbH0AdjiWCbWXslfX6OZ6hs=;
 b=TQmgaBoLCko7ty7WpY3icwjH9u4VOtFsvFJukmu6jGFQPIaqGcS6WaWrFypGiDXAZ+
 ZhjFH2+SLbY+EEK4eKlpPj5taOWOuE+J9OlLSvLsxhmvoUyi6sSGxxuMryiwz4hC+0MP
 KxuzKyBtSCl6Cn2AE/A+g+3CFFKxNiSb+sFTp1FsdqXBwKRrZcWdW/21bcHLAzqXiZux
 kShLuqp/+WiCFLmCkehIQCo+kR5sBA+WUe3bk65qryZRbVITPT6e4Iq72R+XSvxpMh+U
 ZIdYilxj82CyjcDdsPDOeUEOj7CMheP0Ax21A1+B53acDB/52AmZbPrCvQVqhBFjUHV9
 g4jg==
X-Gm-Message-State: AGi0PubHUzr3lmlJLXcZDTs4S2Ce0P2seNnFmwtoEwKh+Wk+Ky6e/cZp
 hatDMdBuuA6rD1WAB+yOlZREz+wOZlSm9/VTQZQSU19Dxc9PL6oakEn2nVEyTAgpi5EcL7AMNRC
 k6U+3aqNfskrH/lPDSOSN9MvY7RXjarNDqLzLSGmEhg==
X-Received: by 2002:a37:7a84:: with SMTP id v126mr3349827qkc.423.1585834063876; 
 Thu, 02 Apr 2020 06:27:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypLxHjkaUsVorVDqnHwIHws97AjgXm5AAgFlj0iL+yJ0ouEjkj3oZQka7/SWWzBEH9hp1R5KqA==
X-Received: by 2002:a37:7a84:: with SMTP id v126mr3349804qkc.423.1585834063566; 
 Thu, 02 Apr 2020 06:27:43 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id 31sm3619643qta.56.2020.04.02.06.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:27:42 -0700 (PDT)
Date: Thu, 2 Apr 2020 09:27:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v4 7/7] tools/virtio: Make --reset reset ring idx
Message-ID: <20200402092529-mutt-send-email-mst@kernel.org>
References: <20200401183118.8334-1-eperezma@redhat.com>
 <20200401183118.8334-8-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200401183118.8334-8-eperezma@redhat.com>
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

On Wed, Apr 01, 2020 at 08:31:18PM +0200, Eugenio P=C3=A9rez wrote:
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

I'm still a bit puzzled by this one - could you
explain what the rationale here is?

> ---
>  drivers/virtio/virtio_ring.c | 29 +++++++++++++++++++++++++++++
>  tools/virtio/linux/virtio.h  |  2 ++
>  tools/virtio/virtio_test.c   | 28 +++++++++++++++++++++++++++-
>  3 files changed, 58 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 58b96baa8d48..f9153a381f72 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1810,6 +1810,35 @@ int virtqueue_add_inbuf_ctx(struct virtqueue *vq,
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_add_inbuf_ctx);
>  =

> +#ifndef __KERNEL__
> +
> +/**
> + * virtqueue_reset_free_head - Reset to 0 the members of split ring.
> + * @vq: Virtqueue to reset.
> + *
> + * At this moment, is only meant for debug the ring index change, do not=
 use
> + * in production.
> + */
> +void virtqueue_reset_free_head(struct virtqueue *_vq)
> +{
> +	struct vring_virtqueue *vq =3D to_vvq(_vq);
> +
> +	// vq->last_used_idx =3D 0;
> +	vq->num_added =3D 0;
> +
> +	vq->split.queue_size_in_bytes =3D 0;
> +	vq->split.avail_flags_shadow =3D 0;
> +	vq->split.avail_idx_shadow =3D 0;
> +
> +	memset(vq->split.desc_state, 0, vq->split.vring.num *
> +			sizeof(struct vring_desc_state_split));
> +
> +	vq->free_head =3D 0;
> +}
> +EXPORT_SYMBOL_GPL(virtqueue_reset_free_head);
> +
> +#endif
> +
>  /**
>   * virtqueue_kick_prepare - first half of split virtqueue_kick call.
>   * @_vq: the struct virtqueue
> diff --git a/tools/virtio/linux/virtio.h b/tools/virtio/linux/virtio.h
> index b751350d4ce8..5d33eab6b814 100644
> --- a/tools/virtio/linux/virtio.h
> +++ b/tools/virtio/linux/virtio.h
> @@ -65,4 +65,6 @@ struct virtqueue *vring_new_virtqueue(unsigned int inde=
x,
>  				      const char *name);
>  void vring_del_virtqueue(struct virtqueue *vq);
>  =

> +void virtqueue_reset_free_head(struct virtqueue *vq);
> +
>  #endif
> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 93d81cd64ba0..bf21ece30594 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -49,6 +49,7 @@ struct vdev_info {
>  =

>  static const struct vhost_vring_file no_backend =3D { .fd =3D -1 },
>  				     backend =3D { .fd =3D 1 };
> +static const struct vhost_vring_state null_state =3D {};
>  =

>  bool vq_notify(struct virtqueue *vq)
>  {
> @@ -218,10 +219,33 @@ static void run_test(struct vdev_info *dev, struct =
vq_info *vq,
>  			}
>  =

>  			if (reset) {
> +				struct vhost_vring_state s =3D { .index =3D 0 };
> +				int i;
> +				vq->vring.avail->idx =3D 0;
> +				vq->vq->num_free =3D vq->vring.num;
> +
> +				// Put everything in free lists.
> +				for (i =3D 0; i < vq->vring.num-1; i++)
> +					vq->vring.desc[i].next =3D
> +						cpu_to_virtio16(&dev->vdev,
> +								i + 1);
> +				vq->vring.desc[vq->vring.num-1].next =3D 0;


Poking at vq descriptors like this seems fragile.
I think this calls for a better API that handles everything
internally.


> +				virtqueue_reset_free_head(vq->vq);
> +
> +				r =3D ioctl(dev->control, VHOST_GET_VRING_BASE,
> +					  &s);
> +				assert(!r);
> +
> +				s.num =3D 0;
> +				r =3D ioctl(dev->control, VHOST_SET_VRING_BASE,
> +					  &null_state);
> +				assert(!r);
> +
>  				r =3D ioctl(dev->control, VHOST_TEST_SET_BACKEND,
>  					  &backend);
>  				assert(!r);
>  =

> +				started =3D completed;
>                                  while (completed > next_reset)
>  					next_reset +=3D completed;
>  			}
> @@ -243,7 +267,9 @@ static void run_test(struct vdev_info *dev, struct vq=
_info *vq,
>  	test =3D 0;
>  	r =3D ioctl(dev->control, VHOST_TEST_RUN, &test);
>  	assert(r >=3D 0);
> -	fprintf(stderr, "spurious wakeups: 0x%llx\n", spurious);
> +	fprintf(stderr,
> +		"spurious wakeups: 0x%llx started=3D0x%lx completed=3D0x%lx\n",
> +		spurious, started, completed);
>  }
>  =

>  const char optstring[] =3D "h";
> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
