Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 11599435DBF
	for <lists.virtualization@lfdr.de>; Thu, 21 Oct 2021 11:15:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E59407E3;
	Thu, 21 Oct 2021 09:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4bpEOyvBfoDy; Thu, 21 Oct 2021 09:15:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 65BDC407DF;
	Thu, 21 Oct 2021 09:15:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E0AFC0036;
	Thu, 21 Oct 2021 09:15:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D194BC0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 09:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F4F838D7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 09:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yB_vpppmHuGT
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 09:15:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20ABC834FE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 09:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634807730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eh0P5mryTqMVFT8OU4rlcC8njpXupHZKrJD/hBOoqL0=;
 b=Q2Jgv4T4hXX5xscSQ3fG/O34D0rYQqDCxcFPE5aAzZhSjYjLLgu3BvsK1HeZ1m9BbzfbZd
 cTrI8zSjnPfEyKLmD5EPGMxvovOyhn0oIb8yovZYXYqZO5NF1Vo5UB4lpbGB5gxe40V3qR
 hUTtYf8Gm6bVXDdFFVtL2bql2uaL4mU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-T9Ae63S8M3Cvpmz-nbegUg-1; Thu, 21 Oct 2021 05:15:26 -0400
X-MC-Unique: T9Ae63S8M3Cvpmz-nbegUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837D51922961;
 Thu, 21 Oct 2021 09:15:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAE3014104;
 Thu, 21 Oct 2021 09:15:16 +0000 (UTC)
Date: Thu, 21 Oct 2021 10:15:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] virtio-blk: fixup coccinelle warnings
Message-ID: <YXEvo5w6OzH3T0Tv@stefanha-x1.localdomain>
References: <20211021065111.1047824-1-ye.guojin@zte.com.cn>
 <b85fee5ff20d2b398948a6bccf1bcc5eb22b49ff.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <b85fee5ff20d2b398948a6bccf1bcc5eb22b49ff.camel@perches.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Michal Marek <michal.lkml@markovi.net>, mst@redhat.com, cgel.zte@gmail.com,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 Denis Efremov <efremov@linux.com>, virtualization@lists.linux-foundation.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Gilles Muller <Gilles.Muller@inria.fr>,
 Ye Guojin <ye.guojin@zte.com.cn>, pbonzini@redhat.com,
 Zeal Robot <zealci@zte.com.cn>, cocci@inria.fr
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
Content-Type: multipart/mixed; boundary="===============0119154939218729406=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============0119154939218729406==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MKTZmaAbKHGPJEyk"
Content-Disposition: inline


--MKTZmaAbKHGPJEyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 12:08:23AM -0700, Joe Perches wrote:
> On Thu, 2021-10-21 at 06:51 +0000, cgel.zte@gmail.com wrote:
> > From: Ye Guojin <ye.guojin@zte.com.cn>
> >=20
> > coccicheck complains about the use of snprintf() in sysfs show
> > functions:
> > WARNING  use scnprintf or sprintf
> >=20
> > Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> []
> > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> []
> > @@ -624,7 +624,7 @@ cache_type_show(struct device *dev, struct device_a=
ttribute *attr, char *buf)
> > -	return snprintf(buf, 40, "%s\n", virtblk_cache_types[writeback]);
> > +	return sysfs_emit(buf, "%s\n", virtblk_cache_types[writeback]);
>=20
> Perhaps scripts/coccinelle/api/device_attr_show.cocci should be updated
> to be more like the script used in commit 1c7fd72687d6

This won't catch the case covered by the patch because it's
"snprintf(buf, 40" instead of "snprintf(buf, PAGE_SIZE", although
any size that's not PAGE_SIZE needs to be reviewed carefully in case the
intent of the statement is to truncate the output.

Stefan

--MKTZmaAbKHGPJEyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxL6MACgkQnKSrs4Gr
c8js/wgAvvwLyhlzNHhPnOnKHV4zzRCS5mL7wTXIPYXRIuZLbmJe7cfyn2qfZtBE
o6KUg+EZMrSddh+yqN2A/D010ZKvothDHO+XHnjXjc1YEtD9gsUUTO0u4/3sjOwx
KZ04JmhYNuk3Q/KJNokoiqIQ4IYxx2g2puHbCXZBjoRwn2PQ5AmF5FmncmEOPaxy
0uK3v8fBNqBcYbaf759HJzAV3MfTV/kA+ybQIbTo/bt9iv8CVeM55kwPFqjGh0v2
/Lq0X45AKKRPF351kE7zO2F7/Bf4wVJEoeQVpct9rROwSNR52em6LuaRE5Q2s+ba
cVrOmOZTmCqirILmZ0Aqp+U8EnHEVA==
=qJkM
-----END PGP SIGNATURE-----

--MKTZmaAbKHGPJEyk--


--===============0119154939218729406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0119154939218729406==--

