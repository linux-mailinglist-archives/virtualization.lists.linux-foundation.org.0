Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 580EC20CD8E
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 11:26:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F0DF525D76;
	Mon, 29 Jun 2020 09:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GqwROe2jDT9l; Mon, 29 Jun 2020 09:26:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B447025D66;
	Mon, 29 Jun 2020 09:26:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91C26C016E;
	Mon, 29 Jun 2020 09:26:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A98FDC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A523B88832
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0YpLW6+t9dd
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 93C8988834
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z15so4521851wrl.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ag+08nSeSr6EqkiGuHLlAELsHQApzSuYKPqMWgc+aA=;
 b=sGVxejwGSDuSw2Q1kO4cvm5jx1DmxMYSYraHX6cHuB0RJNXu+AVUG/392jEMAZWFiN
 rqLodF1hAY1isTwa7TGAF8sPw782rX09KHEpMQdnR+ZGr7IbQN05/7Q1GhPT2X10V5bz
 Xbm+tPkA2azeZ55pSjdePfxWMcem9WNDIjN/Iv309PoMB9CapVAIiTG4zzQlT+ygA+kP
 Myn5f74stAiNV+OrA0CvqIucteZ8PjjPq3oq2c6GQZiJT75JdNsfRrbLRkZBsmjVtvs+
 9MgsGDOI2yj9taw/BsNjwj2dixG2tsffTsOwt6S3vPEdQt/6Altn4pm/WlhI1TM/pIf5
 EKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ag+08nSeSr6EqkiGuHLlAELsHQApzSuYKPqMWgc+aA=;
 b=d4c7h3trqdjchw7IFBdurV3wHfBkC+sEP7Utmr8GbSB2tlpoZlhiiSrFtcMK/5ae3j
 +si9cdF7gDQHmtuOr8+eZdVJCuF2GkkAZq1fbCTh1jpOvnCdwo4dByygMJUb4LneF/Df
 4B4lwmTMKx+kmHjvmeK+7Zpitt4QO1tRc3kL8+srQ9fA6u7b31SGyfvApKEccmAqKK2t
 vdO3+KcOmK2WChoNJd+HSj3MO8tgkPRXX7f1hr6tAbeVu4ogvc+lJdpjLlUyP3uLl+sj
 eQgjp1eAxR+FevX+y1F480ZhrBP+HqINUvLIf0c61ChBT/kUxD+NqqB3P0IAz/vj07Ds
 mLdA==
X-Gm-Message-State: AOAM530XquQecIxpg5knFcbjOGGeiZuo8VC5qcOw4K4bhQ06MYg2VjD5
 Q0L5zItIFh8x5HpTGZtmZFA=
X-Google-Smtp-Source: ABdhPJw2AMURrJPby179MwG4mhz9UG670amev/bcvGRiECK4d8FyEybeGQpKxfxKTP0KVngy0h617A==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr17395732wrq.38.1593422809180; 
 Mon, 29 Jun 2020 02:26:49 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id l18sm19774398wrm.52.2020.06.29.02.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:26:48 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:26:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC 0/3] virtio: NUMA-aware memory allocation
Message-ID: <20200629092646.GC31392@stefanha-x1.localdomain>
References: <20200625135752.227293-1-stefanha@redhat.com>
 <9cd725b5-4954-efd9-4d1b-3a448a436472@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9cd725b5-4954-efd9-4d1b-3a448a436472@redhat.com>
Cc: virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3542228649958609992=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3542228649958609992==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2020 at 02:34:37PM +0800, Jason Wang wrote:
>=20
> On 2020/6/25 =E4=B8=8B=E5=8D=889:57, Stefan Hajnoczi wrote:
> > These patches are not ready to be merged because I was unable to measur=
e a
> > performance improvement. I'm publishing them so they are archived in ca=
se
> > someone picks up this work again in the future.
> >=20
> > The goal of these patches is to allocate virtqueues and driver state fr=
om the
> > device's NUMA node for optimal memory access latency. Only guests with =
a vNUMA
> > topology and virtio devices spread across vNUMA nodes benefit from this=
=2E  In
> > other cases the memory placement is fine and we don't need to take NUMA=
 into
> > account inside the guest.
> >=20
> > These patches could be extended to virtio_net.ko and other devices in t=
he
> > future. I only tested virtio_blk.ko.
> >=20
> > The benchmark configuration was designed to trigger worst-case NUMA pla=
cement:
> >   * Physical NVMe storage controller on host NUMA node 0
> >   * IOThread pinned to host NUMA node 0
> >   * virtio-blk-pci device in vNUMA node 1
> >   * vCPU 0 on host NUMA node 1 and vCPU 1 on host NUMA node 0
> >   * vCPU 0 in vNUMA node 0 and vCPU 1 in vNUMA node 1
> >=20
> > The intent is to have .probe() code run on vCPU 0 in vNUMA node 0 (host=
 NUMA
> > node 1) so that memory is in the wrong NUMA node for the virtio-blk-pci=
 devic=3D
> > e.
> > Applying these patches fixes memory placement so that virtqueues and dr=
iver
> > state is allocated in vNUMA node 1 where the virtio-blk-pci device is l=
ocated.
> >=20
> > The fio 4KB randread benchmark results do not show a significant improv=
ement:
> >=20
> > Name                  IOPS   Error
> > virtio-blk        42373.79 =3DC2=3DB1 0.54%
> > virtio-blk-numa   42517.07 =3DC2=3DB1 0.79%
>=20
>=20
> I remember I did something similar in vhost by using page_to_nid() for
> descriptor ring. And I get little improvement as shown here.
>=20
> Michael reminds that it was probably because all data were cached. So I
> doubt if the test lacks sufficient stress on the cache ...

Yes, that sounds likely. If there's no real-world performance
improvement then I'm happy to leave these patches unmerged.

Stefan

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl75s9YACgkQnKSrs4Gr
c8jAlQgAkxcrX8BwizJMukF4LIVrZHVVDcZjCvl+WEazZ8s6RpSCMj1yeg1wyplH
lt34UesBkGMWTyRQPfQTC16lAQy9hn1nPLhrqyFPk9oiQUEK9Kzf5j7I3JnLVNnI
jBGARfiyb0nKnhfqx0y/ixeAOLDNf9d2swoEc4lnqCo584dlMliJLIC/2jE7AvwF
M6xsrjW6JNxLuV4shp0CaWVgsPd/6OR8PMPy9XatWVPgyF9fpPn6pZJsb6B8d+gL
8lCvNa0+Deq/ruy67yyzenpuqvyMmA11HeQocFFqIvaEdCHA6QCGil0fmXVb0Ile
4X2GnES1wsHbGId3ofPrpM4rjxm7Rw==
=IwcF
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--

--===============3542228649958609992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3542228649958609992==--
