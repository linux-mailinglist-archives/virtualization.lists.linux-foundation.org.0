Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8F199DDE
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 20:14:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3FB586D27;
	Tue, 31 Mar 2020 18:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-7mbgGx4I6w; Tue, 31 Mar 2020 18:14:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E5F6C86D03;
	Tue, 31 Mar 2020 18:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D756FC07FF;
	Tue, 31 Mar 2020 18:14:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD3A5C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B7C9B87DB2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeYXo6-U2PKn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:14:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D8B086E1F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585678470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rf2RizQJz6T6mNzsw3FptOxPb3yxzPqv/PcwJUTzUkg=;
 b=U+2U+hyAYWxXRNFJQk200903RXgOz3kU02uOjvfOnCI5uRTMW1IVAEaAYAfZR/ZyTnZkIi
 MDNQ2dJws61voJ8tQoNA+9OuJUuF7jC7b7XN3Ps/8ecvL8RbUOgcjUiqmKmg0bqeAbJtTj
 /OiE05HCmK4rDyOwbVtA03MK8bHyr8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-UkOFfDHQMCmUK9aE5cMDog-1; Tue, 31 Mar 2020 14:14:28 -0400
X-MC-Unique: UkOFfDHQMCmUK9aE5cMDog-1
Received: by mail-wm1-f70.google.com with SMTP id f8so1402148wmh.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 11:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TSvrVqyL1Jx5FubyVmhg6f6i8aYPPkfIz/TD3nTqZyI=;
 b=Z/qpKRM+B3uVXz/+UzIIgHWCDfrTO3VVPrsk199StgT/IME8hiFUN8CDwOASHz3HV9
 ZLfxsXAWOvRYRw10htVGLBEqXCBbghFFBE1DgOx/SOa0H1KaPs3vg1UkEuVfA5rhV0wY
 4RCc6R6yrylpkoxlVlbz2GqVzbWNi8hnbQFogoGAPQUvCSP2ugdGEgFRDggl+pswPC8g
 LY6Pz7bwPdMMagD3JuIBOjAHBU188lcbDhViaD48X75M0d+4Iqm5Ty91DgK129FcVBC6
 9m9NYIwBJz9o4eogRklMRziIx2dlTs63q9RZaxm1BWfdNMlZLl4HXSUtaMN/4wnX4vZO
 KKeA==
X-Gm-Message-State: AGi0PuYNuDK4bZMJN7fQVQAKiSsBqtqZnXsvmukpmWR8jzfYTfDc7GS9
 5UIPu/vUwXOJ591gWW+2oojRpDkLllbDwjxLL6YDaSTo2cHD7Nm5G0HSc8HO4dNa0il0urM7qvm
 2mpJ+pPBceA8swpvwVtUS+KxKnZhXviZL1yHBpaTs9g==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr133898wmc.84.1585678467304;
 Tue, 31 Mar 2020 11:14:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypLVDQvmChaAxrN9xcoLakoPVPQCDmsEJBfNQTVUIzH6Z20zW9Y/lw5ZL804EkY8DW/XHdDNZg==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr133880wmc.84.1585678467042;
 Tue, 31 Mar 2020 11:14:27 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h81sm5180039wme.42.2020.03.31.11.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 11:14:26 -0700 (PDT)
Date: Tue, 31 Mar 2020 14:14:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v2 1/8] vhost: Create accessors for virtqueues private_data
Message-ID: <20200331141244-mutt-send-email-mst@kernel.org>
References: <20200331180006.25829-1-eperezma@redhat.com>
 <20200331180006.25829-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200331180006.25829-2-eperezma@redhat.com>
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

On Tue, Mar 31, 2020 at 07:59:59PM +0200, Eugenio P=C3=A9rez wrote:
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  drivers/vhost/net.c   | 28 +++++++++++++++-------------
>  drivers/vhost/vhost.h | 28 ++++++++++++++++++++++++++++
>  drivers/vhost/vsock.c | 14 +++++++-------
>  3 files changed, 50 insertions(+), 20 deletions(-)
> =

> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index e158159671fa..6c5e7a6f712c 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -424,7 +424,7 @@ static void vhost_net_disable_vq(struct vhost_net *n,
>  	struct vhost_net_virtqueue *nvq =3D
>  		container_of(vq, struct vhost_net_virtqueue, vq);
>  	struct vhost_poll *poll =3D n->poll + (nvq - n->vqs);
> -	if (!vq->private_data)
> +	if (!vhost_vq_get_backend_opaque(vq))
>  		return;
>  	vhost_poll_stop(poll);
>  }
> @@ -437,7 +437,7 @@ static int vhost_net_enable_vq(struct vhost_net *n,
>  	struct vhost_poll *poll =3D n->poll + (nvq - n->vqs);
>  	struct socket *sock;
>  =

> -	sock =3D vq->private_data;
> +	sock =3D vhost_vq_get_backend_opaque(vq);
>  	if (!sock)
>  		return 0;
>  =

> @@ -524,7 +524,7 @@ static void vhost_net_busy_poll(struct vhost_net *net,
>  		return;
>  =

>  	vhost_disable_notify(&net->dev, vq);
> -	sock =3D rvq->private_data;
> +	sock =3D vhost_vq_get_backend_opaque(rvq);
>  =

>  	busyloop_timeout =3D poll_rx ? rvq->busyloop_timeout:
>  				     tvq->busyloop_timeout;
> @@ -570,8 +570,10 @@ static int vhost_net_tx_get_vq_desc(struct vhost_net=
 *net,
>  =

>  	if (r =3D=3D tvq->num && tvq->busyloop_timeout) {
>  		/* Flush batched packets first */
> -		if (!vhost_sock_zcopy(tvq->private_data))
> -			vhost_tx_batch(net, tnvq, tvq->private_data, msghdr);
> +		if (!vhost_sock_zcopy(vhost_vq_get_backend_opaque(tvq)))
> +			vhost_tx_batch(net, tnvq,
> +				       vhost_vq_get_backend_opaque(tvq),
> +				       msghdr);
>  =

>  		vhost_net_busy_poll(net, rvq, tvq, busyloop_intr, false);
>  =

> @@ -685,7 +687,7 @@ static int vhost_net_build_xdp(struct vhost_net_virtq=
ueue *nvq,
>  	struct vhost_virtqueue *vq =3D &nvq->vq;
>  	struct vhost_net *net =3D container_of(vq->dev, struct vhost_net,
>  					     dev);
> -	struct socket *sock =3D vq->private_data;
> +	struct socket *sock =3D vhost_vq_get_backend_opaque(vq);
>  	struct page_frag *alloc_frag =3D &net->page_frag;
>  	struct virtio_net_hdr *gso;
>  	struct xdp_buff *xdp =3D &nvq->xdp[nvq->batched_xdp];
> @@ -952,7 +954,7 @@ static void handle_tx(struct vhost_net *net)
>  	struct socket *sock;
>  =

>  	mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_TX);
> -	sock =3D vq->private_data;
> +	sock =3D vhost_vq_get_backend_opaque(vq);
>  	if (!sock)
>  		goto out;
>  =

> @@ -1121,7 +1123,7 @@ static void handle_rx(struct vhost_net *net)
>  	int recv_pkts =3D 0;
>  =

>  	mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_RX);
> -	sock =3D vq->private_data;
> +	sock =3D vhost_vq_get_backend_opaque(vq);
>  	if (!sock)
>  		goto out;
>  =

> @@ -1344,9 +1346,9 @@ static struct socket *vhost_net_stop_vq(struct vhos=
t_net *n,
>  		container_of(vq, struct vhost_net_virtqueue, vq);
>  =

>  	mutex_lock(&vq->mutex);
> -	sock =3D vq->private_data;
> +	sock =3D vhost_vq_get_backend_opaque(vq);
>  	vhost_net_disable_vq(n, vq);
> -	vq->private_data =3D NULL;
> +	vhost_vq_set_backend_opaque(vq, NULL);
>  	vhost_net_buf_unproduce(nvq);
>  	nvq->rx_ring =3D NULL;
>  	mutex_unlock(&vq->mutex);
> @@ -1528,7 +1530,7 @@ static long vhost_net_set_backend(struct vhost_net =
*n, unsigned index, int fd)
>  	}
>  =

>  	/* start polling new socket */
> -	oldsock =3D vq->private_data;
> +	oldsock =3D vhost_vq_get_backend_opaque(vq);
>  	if (sock !=3D oldsock) {
>  		ubufs =3D vhost_net_ubuf_alloc(vq,
>  					     sock && vhost_sock_zcopy(sock));
> @@ -1538,7 +1540,7 @@ static long vhost_net_set_backend(struct vhost_net =
*n, unsigned index, int fd)
>  		}
>  =

>  		vhost_net_disable_vq(n, vq);
> -		vq->private_data =3D sock;
> +		vhost_vq_set_backend_opaque(vq, sock);
>  		vhost_net_buf_unproduce(nvq);
>  		r =3D vhost_vq_init_access(vq);
>  		if (r)
> @@ -1575,7 +1577,7 @@ static long vhost_net_set_backend(struct vhost_net =
*n, unsigned index, int fd)
>  	return 0;
>  =

>  err_used:
> -	vq->private_data =3D oldsock;
> +	vhost_vq_set_backend_opaque(vq, oldsock);
>  	vhost_net_enable_vq(n, vq);
>  	if (ubufs)
>  		vhost_net_ubuf_put_wait_and_free(ubufs);
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index a123fd70847e..0808188f7e8f 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -244,6 +244,34 @@ enum {
>  			 (1ULL << VIRTIO_F_VERSION_1)
>  };
>  =

> +/**
> + * vhost_vq_set_backend_opaque - Set backend opaque.
> + *
> + * @vq            Virtqueue.
> + * @private_data  The private data.
> + *
> + * Context: Need to call with vq->mutex acquired.
> + */
> +static inline void vhost_vq_set_backend_opaque(struct vhost_virtqueue *v=
q,
> +					       void *private_data)
> +{
> +	vq->private_data =3D private_data;
> +}
> +
> +/**
> + * vhost_vq_get_backend_opaque - Get backend opaque.
> + *
> + * @vq            Virtqueue.
> + * @private_data  The private data.
> + *
> + * Context: Need to call with vq->mutex acquired.
> + * Return: Opaque previously set with vhost_vq_set_backend_opaque.
> + */
> +static inline void *vhost_vq_get_backend_opaque(struct vhost_virtqueue *=
vq)
> +{
> +	return vq->private_data;
> +}
> +
>  static inline bool vhost_has_feature(struct vhost_virtqueue *vq, int bit)
>  {
>  	return vq->acked_features & (1ULL << bit);


I think I prefer vhost_vq_get_backend and vhost_vq_set_backend.

"opaque" just means that it's void * that is clear from the signature
anyway.


> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index c2d7d57e98cf..6e20dbe14acd 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -91,7 +91,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  =

>  	mutex_lock(&vq->mutex);
>  =

> -	if (!vq->private_data)
> +	if (!vhost_vq_get_backend_opaque(vq))
>  		goto out;
>  =

>  	/* Avoid further vmexits, we're already processing the virtqueue */
> @@ -440,7 +440,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_w=
ork *work)
>  =

>  	mutex_lock(&vq->mutex);
>  =

> -	if (!vq->private_data)
> +	if (!vhost_vq_get_backend_opaque(vq))
>  		goto out;
>  =

>  	vhost_disable_notify(&vsock->dev, vq);
> @@ -533,8 +533,8 @@ static int vhost_vsock_start(struct vhost_vsock *vsoc=
k)
>  			goto err_vq;
>  		}
>  =

> -		if (!vq->private_data) {
> -			vq->private_data =3D vsock;
> +		if (!vhost_vq_get_backend_opaque(vq)) {
> +			vhost_vq_set_backend_opaque(vq, vsock);
>  			ret =3D vhost_vq_init_access(vq);
>  			if (ret)
>  				goto err_vq;
> @@ -547,14 +547,14 @@ static int vhost_vsock_start(struct vhost_vsock *vs=
ock)
>  	return 0;
>  =

>  err_vq:
> -	vq->private_data =3D NULL;
> +	vhost_vq_set_backend_opaque(vq, NULL);
>  	mutex_unlock(&vq->mutex);
>  =

>  	for (i =3D 0; i < ARRAY_SIZE(vsock->vqs); i++) {
>  		vq =3D &vsock->vqs[i];
>  =

>  		mutex_lock(&vq->mutex);
> -		vq->private_data =3D NULL;
> +		vhost_vq_set_backend_opaque(vq, NULL);
>  		mutex_unlock(&vq->mutex);
>  	}
>  err:
> @@ -577,7 +577,7 @@ static int vhost_vsock_stop(struct vhost_vsock *vsock)
>  		struct vhost_virtqueue *vq =3D &vsock->vqs[i];
>  =

>  		mutex_lock(&vq->mutex);
> -		vq->private_data =3D NULL;
> +		vhost_vq_set_backend_opaque(vq, NULL);
>  		mutex_unlock(&vq->mutex);
>  	}
>  =

> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
