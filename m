Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D325D685C
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 19:23:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A184D2721;
	Mon, 14 Oct 2019 17:23:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2948526C9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 98748821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:23:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o18so20597548wrv.13
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EGGdaz7JChYl4JPWAU70Za+RRAZ6S/LKBm6uuB4+/Xc=;
	b=RRPJF2yb4XFeB7uEMgAAHug959rwOOi8I/aMvVs+16qpBMg/xi88CdeE9Z0H9RouJ+
	fuML1Z9e9rjBfDAPLO3vADPa3LKcP9qnEf/xpsiWQnNh+luQFiGV3tK5aWSEkUPYzdfA
	KpZpZ+iy0Yoy/NcKo/yZtrnc6V+97GtwBpJroCZjdetayH+gySMvQCYQhbhgEwH6uh48
	WPbN59RIfr0Ttxd+BL05PY62ls2843A5TDjRJu5P2+VWH3gHHPu5bJlTNgtK5BrOavSZ
	bJycA88kKLnGA677mFQ8W/bpEIMLoXR5m1yU1geUzd8TFe+sPFHy6SrFhwmpW0BGfxq4
	DNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EGGdaz7JChYl4JPWAU70Za+RRAZ6S/LKBm6uuB4+/Xc=;
	b=b87x0+cVxd0vyxoPcMH5bxMLHk02YxhKXNrpM3LVy22iKZBA4/iPqBFHdZXHMJPg28
	Yz+36GG7Lf5IpKdWTtvrYKbB5WORy94dBcI9FdtGP1ljEBantEitFPGMxhc/04DqhMRa
	Wff3dDL0Z0l5Fa5NX75Nlh1sfKWXDnRqDsb1yOEdS1NMXIUxZRZt3ZSLm6Eb5UCwvhA/
	evAadFUV0meFxCt147TanAU06Nzc0gFQV2rYM/cBzdExj8Hn+mXvmF88/vVAIFW/9Lx2
	MYJHFwBpCg4oLU2mUfM+nzXGw+udWIfNN1mCxiRS9J40BfA58Q0EbcDFC+bpFBNf08sv
	CCPA==
X-Gm-Message-State: APjAAAX0fkUV6bhO+qFtXcnc2w+dbU+wPTE8pove9mVCpmlUrPmHe+yR
	qbD3ZDFd7aTQ4PbiQVNMMt0=
X-Google-Smtp-Source: APXvYqwzHqNY1eXa8Wf7T+/uPb0SEQxKfUwA6RcA+GYW/wDuACvWvp5czJ0hnFuczXqrqbCUluKYlA==
X-Received: by 2002:adf:e403:: with SMTP id g3mr24811494wrm.294.1571073784104; 
	Mon, 14 Oct 2019 10:23:04 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	u11sm17480327wmd.32.2019.10.14.10.23.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 10:23:02 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:23:01 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 5/7] mdev: introduce virtio device and its device ops
Message-ID: <20191014172301.GA5359@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-6-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191011081557.28302-6-jasowang@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0553217446153230562=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0553217446153230562==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 11, 2019 at 04:15:55PM +0800, Jason Wang wrote:
> + * @set_vq_cb:			Set the interrut calback function for

s/interrut/interrupt/

s/calback/callback/

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2krvUACgkQnKSrs4Gr
c8hIpQgArOf5wNMCOOx9mrAoFEfDyFDnQGYWa6Ce2/25rBYZVN1BIaLrZLwRk4Za
aM65SiUsAMIh+UTdezqEPyUZCoRZbcxFRWUtyQZqHLCVg3yrwM++9xtTFclrIY0p
hP+v2ZVAMUT/1BQiaAo3+qlItEYbUDwtSl+wsSwzlvu9nFRlHjjdbUZAJmU78zv0
Y50LNaXQf3+E9GqPDj6nJEUSxpww44C1FOgxh9SErmqG8j7ReyAfng0loRKNdZbv
6g7U1I0J+vNgzcCxTSipVRS8EH0bOEY07w3OggpIoIRnOx6voaXYz8SMEQZ8tiRu
k0SSOtAyZ48s1BaOt3vREX8uYFlt0A==
=/ZZN
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

--===============0553217446153230562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0553217446153230562==--
