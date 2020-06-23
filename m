Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D3815205509
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 16:42:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7D1602042C;
	Tue, 23 Jun 2020 14:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cREL4Z739Voo; Tue, 23 Jun 2020 14:42:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 95C9524C4F;
	Tue, 23 Jun 2020 14:42:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89EEEC016F;
	Tue, 23 Jun 2020 14:42:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E0F1C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6971788DAD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F+d37kuDlI6w
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:42:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AC8D188D8A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592923335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BX6exThwo9bFxhAlmYNfxCvgC8eKVDaYUmoMRAOjza4=;
 b=Xe0iLrQFKKAfFnE2UlU5D/DcXDWgXaXJ8Jha7W/8sJS2IDGDT6+Og+Gtr/bgSJZm3uXF5R
 VhpTQa04+HytNbJELwuc9/ANeogGwox3lrneE+23QP/qbrHHfjXeSMPfIgPX+Z9fNuFuoo
 yF+I/Gy9YPfD1eWu24yXlPd2Y/MU98Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-yZWs4tsxPZ-hwmi_TZDwrg-1; Tue, 23 Jun 2020 10:42:14 -0400
X-MC-Unique: yZWs4tsxPZ-hwmi_TZDwrg-1
Received: by mail-wm1-f70.google.com with SMTP id g187so4598998wme.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 07:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mPOfZFaF+bdCbm0ydM+kQRFRBQ8scE3A9xTZmb9+eHU=;
 b=alUkfGzoxFAfS3jE17UcP0IrS6v3DWPSCP1eAkcTj2dtRL8cg3Eaw2u/02dgdH1A19
 ZuE8gTpxZp56ry9kpex71Y4P2xSCHXi1vTkpSk9enB0wCPp/fqpEdQxlEwJAZmGKtxRP
 a2oKdz+Tudb0QDoeDffCjF5rdhCd4bWBmxzso6iM0WMM/Bk1KfZJjrfqWfqSrWZiv+1a
 Oki2vfSKKdC8Mo86S3IlRAlt6qzVyj8LpYclq+LUDhYtltJqah/2AI+mKjTkeA6Yn5KT
 uAOnSXdcvWstHj5zr0npGU+cGLMPhwPjQnaLlB3ssyG0NeWQxMjbq0Kgcmcs8Fr53z2T
 th4A==
X-Gm-Message-State: AOAM530DZ7Z/AQzxN9q1qmtcbKyjZZPCk7Nimvk9lYa32cYddD69r8kK
 JGxhDlcO9AxJ8Qsf5tiawW/OkeRQcEsvLZBwPewOs5BwCyHYqS4L3i6fbfWWg93Oo6eHE1XbTxo
 qweo8zSNHPU6YzcfDiBX6C5UKMERjHyiRk5N73gwAUg==
X-Received: by 2002:adf:e285:: with SMTP id v5mr25169184wri.129.1592923330754; 
 Tue, 23 Jun 2020 07:42:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmHWDOuDtiB37Ir1bpYYZm3cgpiWQYz+hwCXOOThQnShQNMF77cdnf/6yuMEyCU5MTi1D9bA==
X-Received: by 2002:adf:e285:: with SMTP id v5mr25169152wri.129.1592923330463; 
 Tue, 23 Jun 2020 07:42:10 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 n14sm521539wro.81.2020.06.23.07.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 07:42:09 -0700 (PDT)
Date: Tue, 23 Jun 2020 10:42:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v9 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200623103746-mutt-send-email-mst@kernel.org>
References: <20200619182302.850-1-eperezma@redhat.com>
 <20200619182302.850-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619182302.850-3-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm list <kvm@vger.kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Fri, Jun 19, 2020 at 08:22:53PM +0200, Eugenio P=C3=A9rez wrote:
> From: "Michael S. Tsirkin" <mst@redhat.com>
> =

> As testing shows no performance change, switch to that now.
> =

> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Link: https://lore.kernel.org/r/20200401183118.8334-3-eperezma@redhat.com
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  drivers/vhost/test.c  |   2 +-
>  drivers/vhost/vhost.c | 314 ++++++++----------------------------------
>  drivers/vhost/vhost.h |   7 +-
>  3 files changed, 61 insertions(+), 262 deletions(-)
> =

> diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
> index a09dedc79f68..650e69261557 100644
> --- a/drivers/vhost/test.c
> +++ b/drivers/vhost/test.c
> @@ -119,7 +119,7 @@ static int vhost_test_open(struct inode *inode, struc=
t file *f)
>  	dev =3D &n->dev;
>  	vqs[VHOST_TEST_VQ] =3D &n->vqs[VHOST_TEST_VQ];
>  	n->vqs[VHOST_TEST_VQ].handle_kick =3D handle_vq_kick;
> -	vhost_dev_init(dev, vqs, VHOST_TEST_VQ_MAX, UIO_MAXIOV,
> +	vhost_dev_init(dev, vqs, VHOST_TEST_VQ_MAX, UIO_MAXIOV + 64,
>  		       VHOST_TEST_PKT_WEIGHT, VHOST_TEST_WEIGHT, true, NULL);
>  =

>  	f->private_data =3D n;
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 2d784681b0fa..13021d6986eb 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -304,6 +304,7 @@ static void vhost_vq_reset(struct vhost_dev *dev,
>  {
>  	vq->num =3D 1;
>  	vq->ndescs =3D 0;
> +	vq->first_desc =3D 0;
>  	vq->desc =3D NULL;
>  	vq->avail =3D NULL;
>  	vq->used =3D NULL;
> @@ -372,6 +373,11 @@ static int vhost_worker(void *data)
>  	return 0;
>  }
>  =

> +static int vhost_vq_num_batch_descs(struct vhost_virtqueue *vq)
> +{
> +	return vq->max_descs - UIO_MAXIOV;
> +}
> +
>  static void vhost_vq_free_iovecs(struct vhost_virtqueue *vq)
>  {
>  	kfree(vq->descs);


Batching is enabled if max_descs > UIO_MAXIOV.

So this uses batching for test.

But net is unchanged, so it is still not using the batched version.
Is that right?

I think a better subject would be "vhost/test: use batched get_vq_desc vers=
ion".

And that explains which testing it refers to: the one executed by vhost tes=
t.

I think there was a separate patch to enable that for net separately,
but it got lost - or did I miss it?

-- =

MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
