Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D55BF1D
	for <lists.virtualization@lfdr.de>; Mon,  1 Jul 2019 17:10:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D1F534ABE;
	Mon,  1 Jul 2019 15:10:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A1ABF4AAB
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:10:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 20152834
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:10:12 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s15so16333461wmj.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cKBDkOpvKjLwutZn7sL3J9AG+5UUlt9ecagKzXF/p+A=;
	b=bPdtV88+SHvNgkziID/kz0SH8vs3gkIFHQ3Rtc/Di79qYKHOVFvdS9r6qxRxogVrNb
	L0g0o4A2c/B+8ss7nR1cllYuJIzNG1vYYIcwJcJWOIH8lPRG/ks/wgY5izLZwn+fOnp5
	d/x+J6eaf/ORtIpphHhsLMmbUHx/o7PPhZbT1i343IQTV8W3beKsaoBZ9pgfYwLFuvRm
	T6VrFYiSnAk8dFEGFz7iWLTObbJz7f+SJJLgchXBKArGJBZmN6T6YjcmX3ZpKJRa1nDP
	Gj/jmVFTa0T64rOip2Ig7vxN/OLRNg+nuQS207aXWLTBoPHVwT1UBu3BlKJP4qVwjEU/
	AEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cKBDkOpvKjLwutZn7sL3J9AG+5UUlt9ecagKzXF/p+A=;
	b=MRka3er1+2/SiBRl0L3W0Wfc46h9mktjMvb8H+w9IoWCHI8/hvAiFLknxUpgQHytsw
	Hxhm9pf4eYaDN9y4emoTaWldjfzCB7OGdxQDyRxDOnXKQMe+BzvYUl1ppnXlvPB5Nud8
	6kvoqn/5bPUIPFR8brj+5zS3gVTomCe1B1nQ0j0PXw7hto3OIU+aJkmL3NSEI+/X18gq
	55nxscnLdNz7aZX+toov5p+KHudaFsXMWzT/fHH6dfYEvHrigia/JkKClhN3I9oobQ3p
	OyjTCxV98BQOKzNAc8ujqoqotw7oLXYdi5fCGU58PbajglYWhQ8z36hNrTvf4/DqKQXC
	baOg==
X-Gm-Message-State: APjAAAX7ZwL+615XYhd0gn+cykvtrNLTFOjtkla+ZwBY/9UEHXcn2Qrf
	gxEEDEuJCNH1HtgFhjYsW3uZ72d0Sz198Q==
X-Google-Smtp-Source: APXvYqwzdzD/Nu303zbbwC59IVEqcZCYPI3Dlbsg1C2PVErQ5oJuJ9Pi3+8XXCP/FsckTq1J2uQbcA==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr16805844wmg.54.1561993810558;
	Mon, 01 Jul 2019 08:10:10 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	w10sm9533163wru.76.2019.07.01.08.10.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 08:10:09 -0700 (PDT)
Date: Mon, 1 Jul 2019 16:10:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/3] vsock/virtio: use RCU to avoid use-after-free on
	the_virtio_vsock
Message-ID: <20190701151008.GD11900@stefanha-x1.localdomain>
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
Content-Type: multipart/mixed; boundary="===============7758578093657282467=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7758578093657282467==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline


--MAH+hnPXVZWQ5cD/
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

My question is answered in Patch 3.

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0aIlAACgkQnKSrs4Gr
c8iPgwf9H+ImGI64a81fQKFhYTfBN6jeHcQ+jv0hTEUzxX5RL3sSbhlj2Xy8dW3I
2aoAQdGC6fFfVNN8oQjZ/uW3rQCm6wB6zf2rSNgChnnHl3mkm8whnUwbJJosQOCC
7y1ZIL70zcpqOlpTD7k4sNZs7/isLXyKR41ptEkzWSm/rfDXHLBfIvglUpWhBM3q
gsA2ytSw1/8t74Cm7K+bovYuRJH/A4B9DcoYz6cx1jGlPbIUaNRph/zY1AapqFcT
oWnj+9Pi5ajzg+JUoRtJwgPxCY3CO9V3Xj0w0H36wnoWW16fN1D0l3DTN+vzjUJ2
oSqYzBWzeohwx7QGeHxC26mvLpUnBw==
=jGKr
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--

--===============7758578093657282467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7758578093657282467==--
