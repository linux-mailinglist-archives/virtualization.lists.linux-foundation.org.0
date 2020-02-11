Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A07AE15911B
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 14:58:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 56D86204DD;
	Tue, 11 Feb 2020 13:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLuZpZJa0ZLk; Tue, 11 Feb 2020 13:58:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2251C204E4;
	Tue, 11 Feb 2020 13:58:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3BE2C07FE;
	Tue, 11 Feb 2020 13:58:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4757EC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 32F2487111
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgJveAwfDFLK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7DEE2870A1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581429492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOgNYfeson6DGVMt52GdG1eIMdZkb6CQICeU1aVFfGE=;
 b=EFPdn6xSmctbUcFMAvpBOOLZwufb+FFtwK1A6z2D8MPp1j6uIxiEIjhDbaSe64QnBZlDpj
 Y/JgZyZFcBQfmkBLvOQM9MsLvy04dDCy0bnrUF94UYVvPz+RKhOpPtbK5ySknClowJFyQl
 gF+2F7PApDoXqfmoyYcnh8HYEfpOohg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-WXtVD00fNteRXPdtS14ylQ-1; Tue, 11 Feb 2020 08:58:04 -0500
Received: by mail-qk1-f200.google.com with SMTP id t195so7056069qke.23
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 05:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WG0Npq/OjpsV9gQYxRWfzFxfkdPt4v/t5ykKU8PVL2k=;
 b=V57JYIUmcE9Mn2vf+wOZWcNnAag8MJD9ps4nGxZ7oj/cWuZeSgOWImbKeCbVQlniIs
 3Jwvl5vgaCccVx55t+5hN28FjtQS89M30EfeCvCs4z3gnSM1x6AMEtO5WizBW6krsMSV
 CxV94VMr1Icl/OHbkmA8Qu+HgpG+qxO04tt44Hn0gUcDOM7LCKAtVn1vijZ+7JDzmYAF
 pSM8i6wABVFVagDKhNelwga3ReKIqbxM3sKnyJ2ToAnR4HLBhlenzOk6jCrf7BxmYIGF
 enBGc6eg+0S6HD+0axStdA2PH9CfVcydLIVu/ZLGWRd5j1dviOGoSMjoKr/7oht9Lews
 DwnA==
X-Gm-Message-State: APjAAAVZYYXz6PcEh9UJqa4ec9FcHPViciBxP3d9wMCJuCKxDgXZvK1B
 PorEWkOeMuksDcTV5NN8UL1l84UypndA2KCgmcX/fmKkf+TfnY7pOHQJF6tqSInDrdZjPjJl0+0
 aCQBn9FpJSRI5v07s9UyQ27IUcZGDO2NQuz4Mc1ub/Q==
X-Received: by 2002:ad4:49ca:: with SMTP id j10mr2823703qvy.155.1581429483900; 
 Tue, 11 Feb 2020 05:58:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqz11UYC/BUBAy6kXD/YknIJWxgOMbrK5yvh/VgO+Bst7ojYaRjy5EybVs2SGNTw/K86LmEO+w==
X-Received: by 2002:ad4:49ca:: with SMTP id j10mr2823688qvy.155.1581429483704; 
 Tue, 11 Feb 2020 05:58:03 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id a72sm2102422qkc.121.2020.02.11.05.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 05:58:02 -0800 (PST)
Date: Tue, 11 Feb 2020 08:57:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200211085736-mutt-send-email-mst@kernel.org>
References: <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
 <43a5dbaa-9129-e220-8483-45c60a82c945@de.ibm.com>
 <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
X-MC-Unique: WXtVD00fNteRXPdtS14ylQ-1
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

On Tue, Feb 11, 2020 at 02:04:54PM +0100, Eugenio P=C3=A9rez wrote:
> On Mon, 2020-02-10 at 12:01 +0100, Christian Borntraeger wrote:
> > =

> > On 10.02.20 10:47, Eugenio Perez Martin wrote:
> > > Hi Christian.
> > > =

> > > I'm not able to reproduce the failure with eccb852f1fe6bede630e2e4f1a=
121a81e34354ab commit. Could you add more data?
> > > Your configuration (libvirt or qemu line), and host's dmesg output if=
 any?
> > > =

> > > Thanks!
> > =

> > If it was not obvious, this is on s390x, a big endian system.
> > =

> =

> Hi Christian. Thank you very much for your fast responses.
> =

> Could you try this patch on top of eccb852f1fe6bede630e2e4f1a121a81e34354=
ab?
> =

> Thanks!
> =

> >From 71d0f9108a18aa894cc0c0c1c7efbad39f465a27 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Eugenio=3D20P=3DC3=3DA9rez?=3D <
> eperezma@redhat.com>
> Date: Tue, 11 Feb 2020 13:19:10 +0100
> Subject: [PATCH] vhost: fix return value of vhost_get_vq_desc
> =

> Before of the batch change, it was the chain's head. Need to keep that
> way or we will not be able to free a chain of descriptors.

I think it's cleaner to have all descriptors in the chain
have the same id.

> Fixes: eccb852f1fe6 ("vhost: batching fetches")
> ---
>  drivers/vhost/vhost.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index b5a51b1f2e79..fc422c3e5c08 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2409,12 +2409,11 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
>  			*out_num +=3D ret;
>  		}
>  =

> -		ret =3D desc->id;
> -
>  		if (!(desc->flags & VRING_DESC_F_NEXT))
>  			break;
>  	}
>  =

> +	ret =3D vq->descs[vq->first_desc].id;
>  	vq->first_desc =3D i + 1;
>  =

>  	return ret;
> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
