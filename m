Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F925BEC3
	for <lists.virtualization@lfdr.de>; Mon,  1 Jul 2019 16:54:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3426445D3;
	Mon,  1 Jul 2019 14:54:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 02AEF45C3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 14:54:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7000A834
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 14:54:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v19so16272660wmj.5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CAXSIF6Ao3g4SuCwb5RSzByJ3Q/JacDT0Jn2E1kcim4=;
	b=vV0wO44KZqDziwzq3iRnqdyJDdA7zcKHMyjALa20OiZd2Ci2laoS0ILAuulyy/SSsa
	9zJzGSGle3y/YQ5lmhnTvY8Qobmy/oAC/Stk7bKFaDja/e4Y48k4D5iRBkZDqqCBGd8Y
	73qJfTbJt81QTHdmrK+KP8PbOtNPIG4U+xawb+Sz1OAYyIr0SDFcg2TM64vZHRQK771x
	uoB6p9fjQVCDITV/KB3pwXIum83iJ1J+cGX1Uini9VlwlB+QYsM0xf48QTiXbmIZcVtX
	dNsyL3XMPHLaMRgWYQIeUgz27ZKezCSpUIZfimoyzjaUBiw16SeQ99AtCvgofSnsef1r
	WKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CAXSIF6Ao3g4SuCwb5RSzByJ3Q/JacDT0Jn2E1kcim4=;
	b=I3X6aDTzh1/Umv+J5m+m+vjJCPhL2jmXa4xiEd8XaJ1IO1usS5cPTZnFxrUk1nzKbH
	+rJKnsEPfktwrjJBuxZcFNHW4O1tGwdVe++oN/YAfHqKetSGai+NTYVIR5sRMpG2ZThx
	Xtc/GkuaqURqQbd4/N6yOE0iRQfl7GWtxX0ubRKWwb9VBz7eTbbnumEGyglgqEzm92wM
	3HDOrjTg8xod+llFAUiDsKgqCUOghp6HBokKfm/MiIA+ItGno01AWyFmvoEkaspOafnx
	XBhFaMZgvQAXb2/9ZwXiTeUa2qxLHD6lbGH4cRQgzNdrCtq1rT5JFjrr4/acekY7bERb
	Fdxg==
X-Gm-Message-State: APjAAAWHuT8C29najIIdmiwJfkmExkjLkoVuSYVOd8CdjEghDedZ9ZZh
	v0txX755I/cNfp2iRU+kw4Y=
X-Google-Smtp-Source: APXvYqzNw+l/hQ290ZZxE7dWlMt05RbBEfvm60/xqqW6qlfwCFjaO2VCtbx4Ol6vrWUk5mD2SswNow==
X-Received: by 2002:a1c:b146:: with SMTP id a67mr17097250wmf.124.1561992854086;
	Mon, 01 Jul 2019 07:54:14 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	32sm22933497wra.35.2019.07.01.07.54.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 07:54:13 -0700 (PDT)
Date: Mon, 1 Jul 2019 15:54:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/3] vsock/virtio: use RCU to avoid use-after-free on
	the_virtio_vsock
Message-ID: <20190701145412.GA11900@stefanha-x1.localdomain>
References: <20190628123659.139576-1-sgarzare@redhat.com>
	<20190628123659.139576-2-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190628123659.139576-2-sgarzare@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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
Content-Type: multipart/mixed; boundary="===============4216647553637226525=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============4216647553637226525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 02:36:57PM +0200, Stefano Garzarella wrote:
> Some callbacks used by the upper layers can run while we are in the
> .remove(). A potential use-after-free can happen, because we free
> the_virtio_vsock without knowing if the callbacks are over or not.
>=20
> To solve this issue we move the assignment of the_virtio_vsock at the
> end of .probe(), when we finished all the initialization, and at the
> beginning of .remove(), before to release resources.
> For the same reason, we do the same also for the vdev->priv.
>=20
> We use RCU to be sure that all callbacks that use the_virtio_vsock
> ended before freeing it. This is not required for callbacks that
> use vdev->priv, because after the vdev->config->del_vqs() we are sure
> that they are ended and will no longer be invoked.

->del_vqs() is only called at the very end, did you forget to move it
earlier?

In particular, the virtqueue handler callbacks schedule a workqueue.
The work functions use container_of() to get vsock.  We need to be sure
that the work item isn't freed along with vsock while the work item is
still pending.

How do we know that the virtqueue handler is never called in such a way
that it sees vsock !=3D NULL (there is no explicit memory barrier on the
read side) and then schedules a work item after flush_work() has run?

Stefan

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0aHpQACgkQnKSrs4Gr
c8h3iggAyuubhQSWc2lhNVpR8Iy+q+vzwq6cn2HkKAJfd12b4HEHPiQthM2torlj
Bv8w164J+O/rOon9ZrilyvFEgF2NuQbHiyd7REvtp4tKyZow9wVqj4VT2s0CIxAM
5w3ijDBYRXnC2YmnnjJLJb/xhmkrjboxZcX7BuPjNbsNtkxcVer9KlOZOp9tjL7N
OYm4hhy/aHydI1SwBIbVYNvyWGvjhpZqYixHr2uOB/Xd/kisVztQoJE77oRPD6IS
3kScisIJxoNurY1izyyJfSI0OJ+chyeGNLeR/NzvMGiPRUeEIZCC/Z2jGGBGD7WU
re2dtf93pyrxquVVa7nd39azFSXO3w==
=NQ6E
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

--===============4216647553637226525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4216647553637226525==--
