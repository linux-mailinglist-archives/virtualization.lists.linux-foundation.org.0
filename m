Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 95531D78CA
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 16:37:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6A7B3E23;
	Tue, 15 Oct 2019 14:37:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7895AC5D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 14:37:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D2F946C5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 14:37:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y19so24205227wrd.3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=neBsjR3UuUvIqjWSRW2rTQl/yD7xf9xUmzZJeouSucY=;
	b=Ha/JGsd50SAmjoukDYzVJ+uuPpyS6R2PO/eaw9gkiIRIoM/HGQIlw9cEAjxcehLXgX
	xtPrKatNFAft1UWxIzn3Defz+Km3jvCRPXTsAq9Pq3ufY6HVgJoOWyGxGPfjPvEdYCas
	nmFfVEj8/OM25w2meSCjx2zxPPI1LmHgXKvgVJTMlwuYyyzncaqGB6hSe47Jkm2BmDdE
	7Q1oVk61trb1ophCLz3TyIvG+5B4wxLnGIWfh8XXAXF2YWMuNcBZpEq+5iu4OQD/KM2o
	pmgr9RP7X7EJ6h82CRMMDcjBoylZdxySRDcK25cQYOVMInHl93hoNZ/0PIMDNaEQWzXg
	37Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=neBsjR3UuUvIqjWSRW2rTQl/yD7xf9xUmzZJeouSucY=;
	b=e+1mEJFRCB35vBLZPDfM2J0LzbtHW12cXMwT3PfAp9xZoW/ZfIc/bzzSDKeQrbTkCa
	0hgw4bNFK7gxs1tmtaHd7+M39/4/at1CFheeeVumywpFDOhF9Dh5C7cRsT879OoiiXNm
	xGOdaiakL0NClfS4V+oOhfYY/1SukSwkAuDixWffyi/3AK/RKzguMQLU39FyOPwRyxnY
	2LDayHGjAYIayTz+i6jicZXNhDLnJDf+H4+QRJr6uW1LElWidz/a9owM7FjOKE6SjO8+
	lOOTta7o4mqs+U8wQxPM0oZtbK9Xtxoq3ott9BqxwQKW7h2DDLMaS5bK7YXnEfiFRYZS
	Cn+Q==
X-Gm-Message-State: APjAAAUY9G4nh/lSXjZGq3G7mZX8gDqoVvcsBIg3sBEKL1ftpDWbcPo2
	9+5ZR1W7lDoIaQ/HjPmwLgQ=
X-Google-Smtp-Source: APXvYqzV3/RVLumtjzKMF39X/kb+3GTjFjA6Zi36mjTbF3VD42lPRp342ZlZGPdL0S+AnrxMQCU2bw==
X-Received: by 2002:a5d:674e:: with SMTP id l14mr29799012wrw.45.1571150243309; 
	Tue, 15 Oct 2019 07:37:23 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	r20sm29954681wrg.61.2019.10.15.07.37.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 07:37:22 -0700 (PDT)
Date: Tue, 15 Oct 2019 15:37:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 0/7] mdev based hardware virtio offloading support
Message-ID: <20191015143720.GA13108@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191014174946.GC5359@stefanha-x1.localdomain>
	<6d12ad8f-8137-e07d-d735-da59a326e8ed@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6d12ad8f-8137-e07d-d735-da59a326e8ed@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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
Content-Type: multipart/mixed; boundary="===============0407183153316574642=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0407183153316574642==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 11:37:17AM +0800, Jason Wang wrote:
>=20
> On 2019/10/15 =E4=B8=8A=E5=8D=881:49, Stefan Hajnoczi wrote:
> > On Fri, Oct 11, 2019 at 04:15:50PM +0800, Jason Wang wrote:
> > > There are hardware that can do virtio datapath offloading while having
> > > its own control path. This path tries to implement a mdev based
> > > unified API to support using kernel virtio driver to drive those
> > > devices. This is done by introducing a new mdev transport for virtio
> > > (virtio_mdev) and register itself as a new kind of mdev driver. Then
> > > it provides a unified way for kernel virtio driver to talk with mdev
> > > device implementation.
> > >=20
> > > Though the series only contains kernel driver support, the goal is to
> > > make the transport generic enough to support userspace drivers. This
> > > means vhost-mdev[1] could be built on top as well by resuing the
> > > transport.
> > >=20
> > > A sample driver is also implemented which simulate a virito-net
> > > loopback ethernet device on top of vringh + workqueue. This could be
> > > used as a reference implementation for real hardware driver.
> > >=20
> > > Consider mdev framework only support VFIO device and driver right now,
> > > this series also extend it to support other types. This is done
> > > through introducing class id to the device and pairing it with
> > > id_talbe claimed by the driver. On top, this seris also decouple
> > > device specific parents ops out of the common ones.
> > I was curious so I took a quick look and posted comments.
> >=20
> > I guess this driver runs inside the guest since it registers virtio
> > devices?
>=20
>=20
> It could run in either guest or host. But the main focus is to run in the
> host then we can use virtio drivers in containers.
>=20
>=20
> >=20
> > If this is used with physical PCI devices that support datapath
> > offloading then how are physical devices presented to the guest without
> > SR-IOV?
>=20
>=20
> We will do control path meditation through vhost-mdev[1] and vhost-vfio[2=
].
> Then we will present a full virtio compatible ethernet device for guest.
>=20
> SR-IOV is not a must, any mdev device that implements the API defined in
> patch 5 can be used by this framework.

What I'm trying to understand is: if you want to present a virtio-pci
device to the guest (e.g. using vhost-mdev or vhost-vfio), then how is
that related to this patch series?

Does this mean this patch series is useful mostly for presenting virtio
devices to containers or the host?

Stefan

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2l2aAACgkQnKSrs4Gr
c8ji7wf9FHyYry8VO4FqVBdQWMz/h/mmNTgeyBCpCasw+joJ3LRHOyyGPsu2BiOX
IhAuZvK3azvtP7vh1etYaoBrCPmyFBTh2UXsIYoGK1qpUzPNkB7nuGYTBPJgZbxd
jmJNDjc9wrrn9sWBJjkJaFYSjEDfob63FtUG2VM6f109LXI4bTyt03KqS1tZ75Hi
SSjVt95GYQ1xENjKUcVqV9ULwfsv0Wz/WQ2XIvn8Oij7NK9bKHWl3HLirrUE62FP
y6/3Y2fKKhes58jmY09L37Ym625X95M//6g2WYv+uR5rTTfo7jQBlLZ1tklwNY/k
X8Sw0iHJKxZjvZqItbu49kJtRJwm9g==
=nOrh
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

--===============0407183153316574642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0407183153316574642==--
