Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48D196D66
	for <lists.virtualization@lfdr.de>; Sun, 29 Mar 2020 14:36:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F1B8875BF;
	Sun, 29 Mar 2020 12:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvCt3i2y+VWT; Sun, 29 Mar 2020 12:36:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68332875A9;
	Sun, 29 Mar 2020 12:36:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40E4EC07FF;
	Sun, 29 Mar 2020 12:36:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9EC0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ABACF20336
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Caxc3pC-pK8G
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:36:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by silver.osuosl.org (Postfix) with ESMTPS id 7DD2D20243
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585485378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjDtJRhNQTsVmF4NvU8oxfnWMMP0pizbjtN+Id7OBh8=;
 b=g0Bi5YVC0gXHD6z/urOrQ/Noy6qkzIPn3yQ7ha61KKkQaFsq67ITpwxfjq6curOKcQSBKD
 OkGaZVzsxgypyrKriUwLMu7o/x4t05wBEr2loXHP4IzIu5JBoa+NR0IPYSzHk7sYldpgo/
 mFEVpzx8qjJkyvgUNA7J8W3aNo5wLN0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-JkVwnHdBO-qBYCsSA_Oy8g-1; Sun, 29 Mar 2020 08:36:16 -0400
X-MC-Unique: JkVwnHdBO-qBYCsSA_Oy8g-1
Received: by mail-wr1-f72.google.com with SMTP id e10so8401222wru.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 05:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hwBJNIszh6TC6VU12FXZ4Vd7wn8RSesK/NNxIOU/Few=;
 b=Ke95wxgGwdgSlD8iXK89X+3MCIle+x6Rigwo59/bXLtStjQ4uLSxi7CGBWv30MYkOL
 Y7h2NKazOdtJpqwo2Qt5kgTrRI+JHkWrJes+26gsYGDzHFUNTbBesdGBXqljQJOJPQBI
 AoHSLIuSrxk4PVtjIBsVDm31bow3s+zi4d2a40629zTtU8RG9LMEcsfy3QkZ2qxzkwzO
 EF0bOGpBqGVzbizvQKMgyqUl0cQuE+nL+irX3m5V2M80ycgBDofYMm1uvVSAUdsuBKQr
 bVCp/0Et/r6+5W1Nln62ypQW68kd7REH+iZgQnixqAnDK5wHRHD8488aIfgYfl7qamY4
 I9SQ==
X-Gm-Message-State: ANhLgQ3dQcm53IR/YeC32e9CqrXg0wosihhRnj1btolBON7PC/3VaeX2
 gN7vxqvltzDSwYnY0jZEhAP0tUri6UNILQwzbVGsUcu70RNoFzbBn11gklzMfq0pMKv702qeZ0C
 mSldc/4dINwPCQzb0OmrcDqeb9SgEmyqOnUsGW6wBYQ==
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr8143936wmh.72.1585485375627; 
 Sun, 29 Mar 2020 05:36:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuI9saIsl2zcWQGqaeDKgmx/oMIL5wQ54Rlrl1U1iP0jFOdf2pPLW21ixwNKW8n8TFOnKAcZQ==
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr8143921wmh.72.1585485375355; 
 Sun, 29 Mar 2020 05:36:15 -0700 (PDT)
Received: from redhat.com (bzq-79-183-139-129.red.bezeqint.net.
 [79.183.139.129])
 by smtp.gmail.com with ESMTPSA id b187sm17230248wmc.14.2020.03.29.05.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 05:36:14 -0700 (PDT)
Date: Sun, 29 Mar 2020 08:36:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH 4/6] tools/virtio: Make --reset reset ring idx
Message-ID: <20200329083047-mutt-send-email-mst@kernel.org>
References: <20200329113359.30960-1-eperezma@redhat.com>
 <20200329113359.30960-5-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200329113359.30960-5-eperezma@redhat.com>
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

On Sun, Mar 29, 2020 at 01:33:57PM +0200, Eugenio P=C3=A9rez wrote:
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 18 ++++++++++++++++++
>  include/linux/virtio.h       |  2 ++
>  tools/virtio/linux/virtio.h  |  2 ++
>  tools/virtio/virtio_test.c   | 28 +++++++++++++++++++++++++++-
>  4 files changed, 49 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 867c7ebd3f10..aba44ac3f0d6 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1810,6 +1810,24 @@ int virtqueue_add_inbuf_ctx(struct virtqueue *vq,
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_add_inbuf_ctx);
>  =

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
>  /**
>   * virtqueue_kick_prepare - first half of split virtqueue_kick call.
>   * @_vq: the struct virtqueue

Add documentation please. When should this be called?
If it's just for testing, we can put this within some ifdef
that only triggers when building the test ...


> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index 15f906e4a748..286a0048fbeb 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -58,6 +58,8 @@ int virtqueue_add_sgs(struct virtqueue *vq,
>  		      void *data,
>  		      gfp_t gfp);
>  =

> +void virtqueue_reset_free_head(struct virtqueue *vq);
> +
>  bool virtqueue_kick(struct virtqueue *vq);
>  =

>  bool virtqueue_kick_prepare(struct virtqueue *vq);
> diff --git a/tools/virtio/linux/virtio.h b/tools/virtio/linux/virtio.h
> index b751350d4ce8..cf2e9ccf4de2 100644
> --- a/tools/virtio/linux/virtio.h
> +++ b/tools/virtio/linux/virtio.h
> @@ -43,6 +43,8 @@ int virtqueue_add_inbuf(struct virtqueue *vq,
>  			void *data,
>  			gfp_t gfp);
>  =

> +void virtqueue_reset_free_head(struct virtqueue *vq);
> +
>  bool virtqueue_kick(struct virtqueue *vq);
>  =

>  void *virtqueue_get_buf(struct virtqueue *vq, unsigned int *len);
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
> +				virtqueue_reset_free_head(vq->vq);
> +


Hmm this is poking at internal vq format ...


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
