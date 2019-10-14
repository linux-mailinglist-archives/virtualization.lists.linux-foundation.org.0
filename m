Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCDD68DB
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 19:52:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 799432752;
	Mon, 14 Oct 2019 17:49:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D46C32743
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4FD4989D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:49:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b9so20760816wrs.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 10:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XXUMrGZIb6oF2ZXlkY6NvVGKtm0a8dgxsmrS0PyzrVM=;
	b=I/j8jtNurZb03wO5OtpFMwdIEKSI/vQc1BpvLpGl7ryBO321tGoGGD/dOPskkClYgw
	od4t5zjq2+ndwxdNXh+zb0qgGfEDiYNC8CJI5nF9z0sOJtW/AfXcRs9u9iWNzfztTASm
	zRmpLe4p98ADBn7rdM7pjSDzk7VKVIejQmclv2xjvGruv1pY+/Z3iKi3Ri2jzo/vZXKZ
	U1CtlK0iIYAuWGsQk/PJUF6nLEzNapqKj/Nhjmq1INYWCFMOd1+W22by2mHCL9aIRP7o
	dRogtOEYzA8TV/asYmxRHwEpPsFleBrtG5/5o48RbATHAQ6SxNYlqC7Ip8//tVEgp69R
	zJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XXUMrGZIb6oF2ZXlkY6NvVGKtm0a8dgxsmrS0PyzrVM=;
	b=j3bArCl5AION+3/d4jnG24iKT/uWoz6Qv8bnHI8DX3Q3YE56FJFne8ot6r5CIPvO8V
	bG72l+ZeZMuaTebRG+R34NreAfctW0TlPtidLZMrjO9BowV1gso2UmSNKzij5XHvO2Wk
	MCEhUHSsQ2IjmrRcnSYeuZg4YAb0S3OTAKUZqvqNwv60J5Un76P7bhigmEDKr7ld1koP
	KvVwDD40HKv0UbElLS7Ef1kEOWdL2Vd+U7ovP0+pHUCR88UhdrebMF4DNY1b4Tiw7aQK
	ipaNZgIdhqaEhSPPG8iCOBuVxPLzQ2FPP9yQ5BsBzjwjh9X3i3M6QDINqFqZP517vmEV
	xn5Q==
X-Gm-Message-State: APjAAAX3+5T07YgidmiduMvkMtIUXjriuMSFZDTFQGcM31YOMFOoBkFN
	IwReO7eQy31y7CK++eAT7wk=
X-Google-Smtp-Source: APXvYqy78vv8xomOjJzk/rQmkBz13qhvU+ercRByH/EBEIZm2MrjAU0AN+KF4wDSX2QXx60c7i4efw==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr26866005wrr.220.1571075388812;
	Mon, 14 Oct 2019 10:49:48 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	o70sm26093856wme.29.2019.10.14.10.49.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 10:49:48 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:49:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 0/7] mdev based hardware virtio offloading support
Message-ID: <20191014174946.GC5359@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191011081557.28302-1-jasowang@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============6480184366919298761=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============6480184366919298761==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 04:15:50PM +0800, Jason Wang wrote:
> There are hardware that can do virtio datapath offloading while having
> its own control path. This path tries to implement a mdev based
> unified API to support using kernel virtio driver to drive those
> devices. This is done by introducing a new mdev transport for virtio
> (virtio_mdev) and register itself as a new kind of mdev driver. Then
> it provides a unified way for kernel virtio driver to talk with mdev
> device implementation.
>=20
> Though the series only contains kernel driver support, the goal is to
> make the transport generic enough to support userspace drivers. This
> means vhost-mdev[1] could be built on top as well by resuing the
> transport.
>=20
> A sample driver is also implemented which simulate a virito-net
> loopback ethernet device on top of vringh + workqueue. This could be
> used as a reference implementation for real hardware driver.
>=20
> Consider mdev framework only support VFIO device and driver right now,
> this series also extend it to support other types. This is done
> through introducing class id to the device and pairing it with
> id_talbe claimed by the driver. On top, this seris also decouple
> device specific parents ops out of the common ones.

I was curious so I took a quick look and posted comments.

I guess this driver runs inside the guest since it registers virtio
devices?

If this is used with physical PCI devices that support datapath
offloading then how are physical devices presented to the guest without
SR-IOV?

Stefan

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2ktToACgkQnKSrs4Gr
c8jgRgf/WWO5uJxyZLwosUbr+PGHcqci4COe1VGy3Aveab34yl0NQekiPT6CEG5k
PLqiRN9UlPXnMq5H6tsIptfG1mBTxJpF0H7FVRGvwKnV+NizCllURp1Eb1y6ucTd
j3Rg8JZAwDCdJsZ8d2o4JXQKv9CIavomjp0ZQNIdRiKJ8gOueiWydBgCOSO/l0dh
t/YI7ENprVpSg56pZba9Y3eueA6Gt4oSfHZbgtQWXBueHkyN90em9JoDAktAOu1m
PZAQykFnCUGV7RwfK2jUW+WIgh8mSrhu36zoyl9OAASnmHeiMBCTqpvHTKzRH180
fEnf2WwIaOxFvEnbfxu/3ljKyhjEaA==
=X6sM
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--

--===============6480184366919298761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6480184366919298761==--
