Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 760562E930B
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 11:05:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2B9085F93;
	Mon,  4 Jan 2021 10:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1c-W5dDB3Ee; Mon,  4 Jan 2021 10:05:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E24CB85F74;
	Mon,  4 Jan 2021 10:05:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A47CDC013A;
	Mon,  4 Jan 2021 10:05:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D608C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 10:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A19B85F94
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 10:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 459f43PCakWR
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 10:05:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 472EC85F93
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 10:05:02 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t16so31564514wra.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 04 Jan 2021 02:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uFFU3VXsv3EPwLwjLxtgH+p/qlSMAwu7grwI0PaoZiQ=;
 b=QWHADie0s84qde1sI/e7JgVp7NxxE472JwIN5+FxFbv0+u60SVbKkD00Whsau0NoYi
 xHiPER08qL35eUyUT+waT/v6wk4E1Mwd1YNeoY1k4fKaI22fU/WTMA6NNFiEI8eCmBVs
 59rYSyNyisznbyyBOgt4g27fCW3SlwkGU7eF67/Q6L7XEiXaw1mhD7ztsx9zyKgD5bkC
 E1uz/HbEf8he4AJvRV3uJANyJZA+1SV7DyY4485hqC0N392FNN0Li2LQ5SEZN2VHmUpk
 L5IBSzuUI8c+g0XKddW6OFMVoWy2MDkT3OkrFF5Endgg5/j4BGIEc+o1l0E2NO8yleFf
 wheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uFFU3VXsv3EPwLwjLxtgH+p/qlSMAwu7grwI0PaoZiQ=;
 b=SmOCl4QRpkbq6/pB7pnJjl3GIYisv+CMJJ8r2bJiY4mcigHHUG2coqMGWwuAT5voLI
 OscP6hoWq4L27MIh5tmhgBhbgPl+16v7WpwWteUayNVwo8PyD+a3WxWHTJo4e2e9vH9d
 JC1EKYVh+DKkO9LsDPCX323ACaZO9+SYekUwJnwRXSENG/63aB0/1+8qLCy631LO56T8
 8uWnxp9iW29SDSXUJSX8BV96i6VHFU8TJpTrmGl+8OkgnensHn3obDxs6llKPLHnAftN
 ha/CK/WyMAbDiAZBwlyasiw29NNWDfU0g4iixXI0AiwIQYY8BfTgx+3x7LE8XZFZxWn7
 yyPA==
X-Gm-Message-State: AOAM53339hLNEdrkMdSmZBy1BWmPfOAdDzFU3UY5i5JlT+xDvDQRyKTF
 03ZNipfZIMxHIQHRZ/9jUKk=
X-Google-Smtp-Source: ABdhPJzHUrpdcysfWmvcKOTpV/rCqvrg6zvR2no2fO3kzOoq/dycLaf10uIQjBP/NfbhUBxGo0HWIg==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr82200857wru.66.1609754700700; 
 Mon, 04 Jan 2021 02:05:00 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id f14sm77042982wre.69.2021.01.04.02.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 02:04:59 -0800 (PST)
Date: Mon, 4 Jan 2021 10:04:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 06/21] vdpa: introduce virtqueue groups
Message-ID: <20210104100458.GC342399@stefanha-x1.localdomain>
References: <20201216064818.48239-1-jasowang@redhat.com>
 <20201216064818.48239-7-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201216064818.48239-7-jasowang@redhat.com>
Cc: kvm@vger.kernel.org, lulu@redhat.com, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 stefanha@redhat.com, eli@mellanox.com, lingshan.zhu@intel.com,
 rob.miller@broadcom.com
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
Content-Type: multipart/mixed; boundary="===============8494592134226267975=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============8494592134226267975==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 02:48:03PM +0800, Jason Wang wrote:
> This patch introduces virtqueue groups to vDPA device. The virtqueue
> group is the minimal set of virtqueues that must share an address
> space. And the adddress space identifier could only be attached to
> a specific virtqueue group.
>=20
> A new mandated bus operation is introduced to get the virtqueue group
> ID for a specific virtqueue.
>=20
> All the vDPA device drivers were converted to simply support a single
> virtqueue group.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vdpa/ifcvf/ifcvf_main.c   |  9 ++++++++-
>  drivers/vdpa/mlx5/net/mlx5_vnet.c |  8 +++++++-
>  drivers/vdpa/vdpa.c               |  4 +++-
>  drivers/vdpa/vdpa_sim/vdpa_sim.c  | 11 ++++++++++-
>  include/linux/vdpa.h              | 12 +++++++++---
>  5 files changed, 37 insertions(+), 7 deletions(-)

Maybe consider calling it iotlb_group or iommu_group so the purpose of
the group is clear?

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/y6EoACgkQnKSrs4Gr
c8iKNwgAtnS7PgEL7jT2JkaKAXLejyXKO8IW8xfLeTqNpJCmwkwbyzsQjH83riBW
TFaz9i//mTuWeJjzc9ZPWSkeDGQ30KdUG+keqyrr4IBcu2g7YO58mAqf8DL/b/Vf
EkX+sXimegTguYioYzT5zbgApNPlo5RPJWS0UTInQ8n2+gzXKmBmhyI9EXchVNqz
MZDTWzKqZ6urkT5JZlOIlMa1Mw/Xr+yRQpVIBYuZe3GEdwM5gfn6ElhAyrT8qhO/
ssFCNPzcSuJl+2MhxDVM3uyaadUQhr63o4BzNSSyr2Gk4i+nepfTCe0pXukbrnGs
wWqtRMGsRbjl811BZJwNtdVCqu/lsw==
=J7Jn
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--

--===============8494592134226267975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8494592134226267975==--
