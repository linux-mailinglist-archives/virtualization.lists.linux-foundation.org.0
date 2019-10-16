Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DBDD9157
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 14:46:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D92C2DC1;
	Wed, 16 Oct 2019 12:46:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B069AD67;
	Wed, 16 Oct 2019 12:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 220C013A;
	Wed, 16 Oct 2019 12:46:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b24so2602489wmj.5;
	Wed, 16 Oct 2019 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zKeyF68jMzkZ8PZE+zyf0AJaz2r+snV2TpAgt4NOVLs=;
	b=KTEToaQ6qrUyieyWQDtnZTqU0uLP/8iwXQlf8besLewIcU49APKdYdkSgI38Agh1MC
	fybhBfRdkx5N+TTVr1tYMxdymZL3T0riuRTK/LOyyxhgaZQubAeRVPpVt+A3RnXX8QXs
	URwFg3CqEOZzLc5RyI2hhW6B0aejSropBsziuKyyH/FIwM2Q/afI6g5YmezT97h0gfC5
	m7l0yztoR6wQheMj/D2XjlMwJcTuiMahzWX2A2g4HbTmV1V3s2gVyEtGwQa4xFvdKB7X
	+hlE/qsb3XwJejEKcLz/Da0ZJ8PWWa/2vOpEx0Rr6ALCbfpwZCOQM8tBCVrg0yVT28Nz
	rENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zKeyF68jMzkZ8PZE+zyf0AJaz2r+snV2TpAgt4NOVLs=;
	b=GgtHLY/v0VIwGrDIF2jrB13dqz0eZv8fXK57S+B8nVQR4++ndUX1hGhYBoo1t1TErf
	sMA5i8g0e/RPQ+qWlA++15B41hQnj9IdHIrqC/PFr4E0aRFFf/5br1UDr0BnctGV5Xmf
	ebMe1jnixjCQ+tu4leZNCfie+4rBSEFFSfECt22l21SQEyrpFldZZKQ4a6S9xMZ7BHHV
	4UsQii6ztq3qG+ZqwSexj5/SL+wvvKFqRG/VJiO2q8u5NGO0hNAdO6L3Y0mPK4qdn4kW
	1tOqUJ0Wsx7eVLs/p6/g914fWzs0j4GJZx3NIxVVGmaOcWZjW4bMma1Wkdq4D4QdUSYc
	1spQ==
X-Gm-Message-State: APjAAAUF6DECd4mACrN1PTV0U8hMwF9xQfMgRkHJolmLqYJMAqo0rEp5
	N0Nb36+HW/U7i7TLnpwdx5Q=
X-Google-Smtp-Source: APXvYqy4uLAxXK8dZ9uj0Q5OXVcdh/jm7RvNEApTwfDvS63JBb+q8OpwLefZS54uymyMLUA4t9VzRQ==
X-Received: by 2002:a7b:c4c6:: with SMTP id g6mr3276352wmk.126.1571230003562; 
	Wed, 16 Oct 2019 05:46:43 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
	by smtp.gmail.com with ESMTPSA id
	c18sm22646572wrv.10.2019.10.16.05.46.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 05:46:41 -0700 (PDT)
Date: Wed, 16 Oct 2019 14:46:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 1/5] iommu: Implement iommu_put_resv_regions_simple()
Message-ID: <20191016124640.GA1772382@ulmo>
References: <20190829111752.17513-1-thierry.reding@gmail.com>
	<20190829111752.17513-2-thierry.reding@gmail.com>
	<20190918153737.dea2z5dddhuus25g@willie-the-truck>
MIME-Version: 1.0
In-Reply-To: <20190918153737.dea2z5dddhuus25g@willie-the-truck>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============2040086399292798659=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============2040086399292798659==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 04:37:38PM +0100, Will Deacon wrote:
> On Thu, Aug 29, 2019 at 01:17:48PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Implement a generic function for removing reserved regions. This can be
> > used by drivers that don't do anything fancy with these regions other
> > than allocating memory for them.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/iommu/iommu.c | 19 +++++++++++++++++++
> >  include/linux/iommu.h |  2 ++
> >  2 files changed, 21 insertions(+)
> >=20
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 0f585b614657..73a2a6b13507 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -2170,6 +2170,25 @@ void iommu_put_resv_regions(struct device *dev, =
struct list_head *list)
> >  		ops->put_resv_regions(dev, list);
> >  }
> > =20
> > +/**
> > + * iommu_put_resv_regions_simple - Reserved region driver helper
> > + * @dev: device for which to free reserved regions
> > + * @list: reserved region list for device
> > + *
> > + * IOMMU drivers can use this to implement their .put_resv_regions() c=
allback
> > + * for simple reservations. Memory allocated for each reserved region =
will be
> > + * freed. If an IOMMU driver allocates additional resources per region=
, it is
> > + * going to have to implement a custom callback.
> > + */
> > +void iommu_put_resv_regions_simple(struct device *dev, struct list_hea=
d *list)
> > +{
> > +	struct iommu_resv_region *entry, *next;
> > +
> > +	list_for_each_entry_safe(entry, next, list, list)
> > +		kfree(entry);
> > +}
> > +EXPORT_SYMBOL(iommu_put_resv_regions_simple);
>=20
> Can you call this directly from iommu_put_resv_regions() if the function
> pointer in ops is NULL? That would save having to plumb the default callb=
ack
> into a bunch of drivers.

I probably could, but I don't think that necessarily improves things.
The reason is that that would cause the helper to get called even if the
driver doesn't support reserved regions. That's likely harmless because
in that case the list of regions passed to it would be empty. However, I
think the current way to do this, where we have to implement both hooks
for ->get_resv_regions() and ->put_resv_regions() is nicely symmetric.

Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2nES4ACgkQ3SOs138+
s6EONg//ZrYWm5ShwdyQ9XivGxuuU1NxmrAJMtWHz2z0xMVhLv8vVlvNeGNNepm/
AYozw/NMlEZokXfJVW9zNHDpOdr+MB6EchafhOZo9kK592CE18NhVrpVDptMvf29
K1QsQvgCq5Lu9EHBeDMxpx6Kn9VNBFJuAeYCIVzD5GOm80sHdAp1eKMwu/od+oTQ
IwZLB0K82tKdvnwYDYjN/JUW0dbrthH+fW843oOxAqQgrJYApL64k6WuPn6evN11
V7xbw3/Yk3LMqxmBzve7b7ATYXdGRuN7TdMX7aZmLX8xyu11L6LbK+Lss10BbBKi
Vja3MbZgoD54Eam3zOvj+b7tfdiRry4jhqqVksJ/Q2U7KOygrzLORgYR6wTgtz9g
opzD+i9cGdaSj1k8kvVeFPqX9TL/er2hy05MIEWYYTuVh3Y6xiPekH988bHvxf9X
bcl8I5YARin8U2n5R9kaS+drtuo3HvgeQMfszEf9UDNLQc+Pl5niTQPJzljWiZ36
zI8Tq7Sq8Fph33gOGbpcZMTDux4cjlYtGWle7U5tkS38Xte7+IgRxmpwWDC6Y0jX
muP1UNGkXJMLvJtssGseFZZw9qkJcq0NPRdjaN4k+LTdbrw0B10f1CDST8g/9Z4H
xvmbe6SyeWzgcBc43Fs4V3YjZXAYWxf66eD2B9h9AdAEHSmCgD4=
=LljU
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============2040086399292798659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2040086399292798659==--
