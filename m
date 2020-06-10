Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2661F5749
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 17:08:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 911DC88C43;
	Wed, 10 Jun 2020 15:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qck3qpgOJD4j; Wed, 10 Jun 2020 15:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ACAE788C2F;
	Wed, 10 Jun 2020 15:08:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9350AC016F;
	Wed, 10 Jun 2020 15:08:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F757C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7951420134
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkGrMWF1Lmwq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:08:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 7BA0F1FDFB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591801689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sa0uKZEhAzaCXOa4Z/MezuuTmYbdWUpJoaPJ5vnFK3s=;
 b=VGxhKJxwiwDvfYH8O/pjlSPnsTCept3jZMyjPNRqNU+Kfh2FbQZbao+fhCBhQWubTCja5w
 roXqUy2ZIU/6KTDdzOmpy4Fe/zgfeqaYiC/eFx74HTIrUYETi4JQMrN1JrbSnUHllXqvEy
 riVxKVZEm3PdHBM8Pfq+sCgEK3vOrFI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-Hb8JaKxjNrm34tSn-mo20g-1; Wed, 10 Jun 2020 11:08:07 -0400
X-MC-Unique: Hb8JaKxjNrm34tSn-mo20g-1
Received: by mail-wr1-f69.google.com with SMTP id l18so1226204wrm.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 08:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZvS3pY4wDKLBE9EMwiJvGN8pCoUxnpSAds/EiWZ00f4=;
 b=LZkC1UaVkHikewA1+wbeQM/tIXZGvmXVJfuQlHzskBrpY4smv0123cpxKRaXNJLWZ0
 oTv6dDFLXEvEEQ8hX8iKNbRBmJnWrmrLu7trWTLyez4iNXF3jvsvZ/ycO95BF130AXUu
 QJkywRKiuIppA0dGSX0L9w7MNkMqaLvrp41fK79GWx+RHj/nt3obM4TdLVYiHe+T/2Ex
 ugtR1l8c1NBvuzzBKunu+PvhPzGXABG1hxu6/jm5Of8b+S6GH67zTThNU//wgfbfcLPr
 aOenbaYWrU80YHrwU7eDr2EXUWcJ3IaGRQ8/gBC3HsdoOTK0quWKP8SBigCNDt4Yho/V
 w1mg==
X-Gm-Message-State: AOAM533Ft0pL1zRmlmvf/2fjzT379yWhPackkzSUkXLjI8VJdCo8w74F
 sBkQhV+kpaFwzFxDlN94eryaFScOOxPnUZ2QVPyjPi7W0PWdtEfQBilvS58tJ3MJv0U2psuQ4yk
 zNA5X8/IhgvaRm8ydVhdcXywVBT5mAsDMbs/qApPrag==
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr4211606wrw.272.1591801686260; 
 Wed, 10 Jun 2020 08:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSwDALN5Pur0obQjyi2Uc0HobQX48dqJRmEevxPLOFxJwcAkmH8xWT1y5vRmc5DFWcLholqg==
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr4211584wrw.272.1591801685999; 
 Wed, 10 Jun 2020 08:08:05 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id j4sm42126wma.7.2020.06.10.08.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 08:08:05 -0700 (PDT)
Date: Wed, 10 Jun 2020 11:08:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH RFC v7 03/14] vhost: use batched get_vq_desc version
Message-ID: <20200610105829-mutt-send-email-mst@kernel.org>
References: <20200610113515.1497099-1-mst@redhat.com>
 <20200610113515.1497099-4-mst@redhat.com>
 <035e82bcf4ade0017641c5b457d0c628c5915732.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <035e82bcf4ade0017641c5b457d0c628c5915732.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Wed, Jun 10, 2020 at 04:29:29PM +0200, Eugenio P=C3=A9rez wrote:
> On Wed, 2020-06-10 at 07:36 -0400, Michael S. Tsirkin wrote:
> > As testing shows no performance change, switch to that now.
> > =

> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Link: https://lore.kernel.org/r/20200401183118.8334-3-eperezma@redhat.c=
om
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/vhost/test.c  |   2 +-
> >  drivers/vhost/vhost.c | 318 ++++++++----------------------------------
> >  drivers/vhost/vhost.h |   7 +-
> >  3 files changed, 65 insertions(+), 262 deletions(-)
> > =

> > diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
> > index 0466921f4772..7d69778aaa26 100644
> > --- a/drivers/vhost/test.c
> > +++ b/drivers/vhost/test.c
> > @@ -119,7 +119,7 @@ static int vhost_test_open(struct inode *inode, str=
uct file *f)
> >  	dev =3D &n->dev;
> >  	vqs[VHOST_TEST_VQ] =3D &n->vqs[VHOST_TEST_VQ];
> >  	n->vqs[VHOST_TEST_VQ].handle_kick =3D handle_vq_kick;
> > -	vhost_dev_init(dev, vqs, VHOST_TEST_VQ_MAX, UIO_MAXIOV,
> > +	vhost_dev_init(dev, vqs, VHOST_TEST_VQ_MAX, UIO_MAXIOV + 64,
> >  		       VHOST_TEST_PKT_WEIGHT, VHOST_TEST_WEIGHT, true, NULL);
> >  =

> >  	f->private_data =3D n;
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index 11433d709651..28f324fd77df 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -304,6 +304,7 @@ static void vhost_vq_reset(struct vhost_dev *dev,
> >  {
> >  	vq->num =3D 1;
> >  	vq->ndescs =3D 0;
> > +	vq->first_desc =3D 0;
> >  	vq->desc =3D NULL;
> >  	vq->avail =3D NULL;
> >  	vq->used =3D NULL;
> > @@ -372,6 +373,11 @@ static int vhost_worker(void *data)
> >  	return 0;
> >  }
> >  =

> > +static int vhost_vq_num_batch_descs(struct vhost_virtqueue *vq)
> > +{
> > +	return vq->max_descs - UIO_MAXIOV;
> > +}
> > +
> >  static void vhost_vq_free_iovecs(struct vhost_virtqueue *vq)
> >  {
> >  	kfree(vq->descs);
> > @@ -394,6 +400,9 @@ static long vhost_dev_alloc_iovecs(struct vhost_dev=
 *dev)
> >  	for (i =3D 0; i < dev->nvqs; ++i) {
> >  		vq =3D dev->vqs[i];
> >  		vq->max_descs =3D dev->iov_limit;
> > +		if (vhost_vq_num_batch_descs(vq) < 0) {
> > +			return -EINVAL;
> > +		}
> >  		vq->descs =3D kmalloc_array(vq->max_descs,
> >  					  sizeof(*vq->descs),
> >  					  GFP_KERNEL);
> > @@ -1610,6 +1619,7 @@ long vhost_vring_ioctl(struct vhost_dev *d, unsig=
ned int ioctl, void __user *arg
> >  		vq->last_avail_idx =3D s.num;
> >  		/* Forget the cached index value. */
> >  		vq->avail_idx =3D vq->last_avail_idx;
> > +		vq->ndescs =3D vq->first_desc =3D 0;
> =

> This is not needed if it is done in vhost_vq_set_backend, as far as I can=
 tell.
> =

> Actually, maybe it is even better to move `vq->avail_idx =3D vq->last_ava=
il_idx;` line to vhost_vq_set_backend, it is part
> of the backend "set up" procedure, isn't it?
> =

> I tested with virtio_test + batch tests sent in =

> https://lkml.kernel.org/lkml/20200418102217.32327-1-eperezma@redhat.com/T=
/.

Ow did I forget to merge them for rc1?  Should I have? Maybe Linus won't
yell to hard at me if I merge them after rc1.


> I append here what I'm proposing in case it is clearer this way.
> =

> Thanks!
> =

> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 4d198994e7be..809ad2cd2879 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -1617,9 +1617,6 @@ long vhost_vring_ioctl(struct vhost_dev *d, unsigne=
d int ioctl, void __user *arg
>  			break;
>  		}
>  		vq->last_avail_idx =3D s.num;
> -		/* Forget the cached index value. */
> -		vq->avail_idx =3D vq->last_avail_idx;
> -		vq->ndescs =3D vq->first_desc =3D 0;
>  		break;
>  	case VHOST_GET_VRING_BASE:
>  		s.index =3D idx;
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index fed36af5c444..f4902dc808e4 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -258,6 +258,7 @@ static inline void vhost_vq_set_backend(struct vhost_=
virtqueue *vq,
>  					void *private_data)
>  {
>  	vq->private_data =3D private_data;
> +	vq->avail_idx =3D vq->last_avail_idx;
>  	vq->ndescs =3D 0;
>  	vq->first_desc =3D 0;
>  }
> =


Seems like a nice cleanup, though it's harmless right?


-- =

MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
