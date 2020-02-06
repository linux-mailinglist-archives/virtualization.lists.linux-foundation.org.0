Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0F154E97
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 23:07:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB44887E4D;
	Thu,  6 Feb 2020 22:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1LIr-5HT+WD; Thu,  6 Feb 2020 22:07:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A6A987E59;
	Thu,  6 Feb 2020 22:07:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41A72C013E;
	Thu,  6 Feb 2020 22:07:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32BE1C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1790C869D7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyOyQqfOcp8U
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:07:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 44557869C7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581026850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/wRM+asIy6ociZ5byyUUQi0inMDK3mudSVn8zSYSa0=;
 b=FliO/pRmrdWQG7GlBQCwiJ0be6rEwhb4NtC8FGwQIV954M8wedFAypX8pohnnhQTlJPat8
 iNd7AgMjbO3K/y1E8ECYecLcsqtzDT6kNpzP0Pt+7YNzz2anz8XUirGLyfD7Dq/5ewtnfu
 IQfCkMyr+IztMmDRPC5Xh22nnWw1Qd4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-qZCmGSiCOkitkG0aL_29IQ-1; Thu, 06 Feb 2020 17:07:28 -0500
Received: by mail-qv1-f71.google.com with SMTP id k2so4595008qvu.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 14:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gCVOUfYXtJqZqTDmxurK3VSKtKDk2XaSteNP/54JEfc=;
 b=bp91g3hv2QmjiHPKVQnTV50fKJsun2gS2QTK3a4aBmBNfGIkNcOQDwTfYRQP/C9VUh
 oPHOtXa23IMelog/CM7M7cPIqMtkoUHvGXjF7ryn9WGzrKuU9dlgyu0DB3snMCEuPIXQ
 BqxPz7auN3dvMcmmO5JhieFerCILNguyUwvNFB/QZEGWTlpfuxM6J5CUTKs127WZqPj6
 U+UWWs7q5kfYZlHOiDZQX0zH41XmJwW953EL1OqVURYdSTkpo3ClKN6NY2itpnExne37
 vSAC2ON/6Xb4gFNBPyHPJowVBtv9WXKeeh47GsCD1L4SzMMb+nMLcb0gq6+K6QH0oQXL
 pVHQ==
X-Gm-Message-State: APjAAAWNOoHeH/xZTgIYhR4RELp6JfzPRJDNsBeuNpD5ZfoZBaNnxRq6
 KslSUTR9p0EvY6fKCxfNlG4ZcK1lPr+51JQyq85pYCVjnY0zW/7IU/4nEvdtaK90WzYSemOYQJ5
 aMedZJl529fXpxAb+Z85yQEGxdDGna2vyJ/TNmJB8Pg==
X-Received: by 2002:a37:9ce:: with SMTP id 197mr4617851qkj.194.1581026846345; 
 Thu, 06 Feb 2020 14:07:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzAgfHaRVNBIU1YBIUwKBiXLz4+7Fyka8EXNPWEWH74Hw3OkWCnDHFfZMkzruPNBzMPRLUrJA==
X-Received: by 2002:a37:9ce:: with SMTP id 197mr4617822qkj.194.1581026846050; 
 Thu, 06 Feb 2020 14:07:26 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id z5sm383804qta.7.2020.02.06.14.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 14:07:25 -0800 (PST)
Date: Thu, 6 Feb 2020 17:07:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: eperezma@redhat.com
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200206170005-mutt-send-email-mst@kernel.org>
References: <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
X-MC-Unique: qZCmGSiCOkitkG0aL_29IQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
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

On Thu, Feb 06, 2020 at 03:22:39PM +0100, eperezma@redhat.com wrote:
> Hi Christian.
> =

> Could you try this patch on top of ("38ced0208491 vhost: use batched vers=
ion by default")?
> =

> It will not solve your first random crash but it should help with the los=
t of network connectivity.
> =

> Please let me know how does it goes.
> =

> Thanks!
> =

> >From 99f0f543f3939dbe803988c9153a95616ccccacd Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Eugenio=3D20P=3DC3=3DA9rez?=3D <eperezma@redhat.com>
> Date: Thu, 6 Feb 2020 15:13:42 +0100
> Subject: [PATCH] vhost: filter valid vhost descriptors flags
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
> =

> Previous commit copy _NEXT flag, and it complains if a copied descriptor
> contains it.
> =

> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  drivers/vhost/vhost.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 27ae5b4872a0..56c5253056ee 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2125,6 +2125,8 @@ static void pop_split_desc(struct vhost_virtqueue *=
vq)
>  	--vq->ndescs;
>  }
>  =

> +#define VHOST_DESC_FLAGS (VRING_DESC_F_INDIRECT | VRING_DESC_F_WRITE | \
> +			  VRING_DESC_F_NEXT)
>  static int push_split_desc(struct vhost_virtqueue *vq, struct vring_desc=
 *desc, u16 id)
>  {
>  	struct vhost_desc *h;
> @@ -2134,7 +2136,7 @@ static int push_split_desc(struct vhost_virtqueue *=
vq, struct vring_desc *desc,
>  	h =3D &vq->descs[vq->ndescs++];
>  	h->addr =3D vhost64_to_cpu(vq, desc->addr);
>  	h->len =3D vhost32_to_cpu(vq, desc->len);
> -	h->flags =3D vhost16_to_cpu(vq, desc->flags);
> +	h->flags =3D vhost16_to_cpu(vq, desc->flags) & VHOST_DESC_FLAGS;
>  	h->id =3D id;
>  =

>  	return 0;



> @@ -2343,7 +2345,7 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
>  		struct vhost_desc *desc =3D &vq->descs[i];
>  		int access;
>  =

> -		if (desc->flags & ~(VRING_DESC_F_INDIRECT | VRING_DESC_F_WRITE)) {
> +		if (desc->flags & ~VHOST_DESC_FLAGS) {
>  			vq_err(vq, "Unexpected flags: 0x%x at descriptor id 0x%x\n",
>  			       desc->flags, desc->id);
>  			ret =3D -EINVAL;
> -- =

> 2.18.1

Thanks for catching this!

Do we need the 1st chunk though?

It seems preferable to just muck with flags in 1 place, when we
validate them ...

> =

> On Wed, 2020-01-22 at 20:32 +0100, Christian Borntraeger wrote:
> > =

> > On 20.01.20 07:27, Michael S. Tsirkin wrote:
> > > On Tue, Jan 07, 2020 at 01:16:50PM +0100, Christian Borntraeger wrote:
> > > > On 07.01.20 12:55, Michael S. Tsirkin wrote:
> > > > =

> > > > > I pushed batched-v3 - same head but bisect should work now.
> > > > > =

> > > > =

> > > > With =

> > > > commit 38ced0208491103b50f1056f0d1c8f28e2e13d08 (HEAD)
> > > > Author:     Michael S. Tsirkin <mst@redhat.com>
> > > > AuthorDate: Wed Dec 11 12:19:26 2019 -0500
> > > > Commit:     Michael S. Tsirkin <mst@redhat.com>
> > > > CommitDate: Tue Jan 7 06:52:42 2020 -0500
> > > > =

> > > >     vhost: use batched version by default
> > > > =

> > > > =

> > > > I have exactly one successful ping and then the network inside the =
guest is broken (no packet
> > > > anymore).
> > > =

> > > Does anything appear in host's dmesg when this happens?
> > =

> > I think there was nothing, but I am not sure. I would need to redo the =
test if this is important to know.
> > =

> > > =

> > > > So you could consider this commit broken (but in a different way an=
d also without any
> > > > guest reboot necessary).
> > > > =

> > > > =

> > > > bisect log:
> > > > git bisect start
> > > > # bad: [d2f6175f52062ee51ee69754a6925608213475d2] vhost: use vhost_=
desc instead of vhost_log
> > > > git bisect bad d2f6175f52062ee51ee69754a6925608213475d2
> > > > # good: [d1281e3a562ec6a08f944a876481dd043ba739b9] virtio-blk: remo=
ve VIRTIO_BLK_F_SCSI support
> > > > git bisect good d1281e3a562ec6a08f944a876481dd043ba739b9
> > > > # good: [fac7c0f46996e32d996f5c46121df24a6b95ec3b] vhost: option to=
 fetch descriptors through an independent
> > > > struct
> > > > git bisect good fac7c0f46996e32d996f5c46121df24a6b95ec3b
> > > > # bad: [539eb9d738f048cd7be61f404e8f9c7d9d2ff3cc] vhost: batching f=
etches
> > > > git bisect bad 539eb9d738f048cd7be61f404e8f9c7d9d2ff3cc

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
