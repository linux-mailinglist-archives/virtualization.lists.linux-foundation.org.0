Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E647E6331
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 15:43:57 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 22EFCB4B;
	Sun, 27 Oct 2019 14:43:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B8694AE7
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1AE4414D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n7so6819624wmc.3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qE0X3ogtNhn0ebFIC/w7JpP2rq2/beNy9tfdgFGDWNI=;
	b=c0fZnZa8IRC4VhCN+ke+befKGunIOO7DkdhdFaW+KDbpyWHkOsSjIKR9Dc0Rq7Kuj3
	Ncr3xzia093wSTG7NjjuBjEOWtDraFGsGPGhWkXSmkyaYAXRGMlB9f4dUS6EkQJ3h87m
	gfgMYdQ+LpSTpCSfgf/PfkwJXXm4DgWlfZExXMdaoyzWYDpTa17vp2m5Z048vWoi3i00
	rcrdtNHrHcrhEyE+Bb6tefzIrXXhFszP1SO1ADgz7YvTfDTI6Qm+FdmI/a3V8SNTbaez
	LA946Gk8I6ZGviJVfCUYd+IiTIJbKwK2jQvvWcsZQkd97KZuUI6T6IrzGOM5UW8dBgnJ
	N8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qE0X3ogtNhn0ebFIC/w7JpP2rq2/beNy9tfdgFGDWNI=;
	b=UrUJCb24xKhj7B19TB1aTsvaoPi28UTgrNwUKM7d+LVF7VwZHd9vmEbsLfAwGs2/jR
	ZSM2yvaPBvtWdDrywPLSTVMt4nm8g+iiSvHPEb4aMAtZPQ75Gc5mwkH0sjyiMVuyt5CZ
	TZhw9A7wNW8lyphru5bLm5USjgCLnfKRlJu0/zfH0x5oeyHrUedy/zY3+TWy5TWpE1qQ
	OT2j8lNzZQfvWD0Hd/12ba8jtGW0vExxShSB+HY/IHe6tNXOvLsAI4JOnlB84qVFJcOH
	zoF0l7ag3XJWJss2mQMj3FD4qtnYLR0o2G3vl3v7m/p154b3rt6kQd9a0IyPSwypHnTU
	4eoA==
X-Gm-Message-State: APjAAAUnteWdlS6pnY8Ctmkfw9iRWcIUNzHWahhxIWXnfzlXTtj3iTTN
	PXz04MJp8bhz1Nt5CG6gRW4=
X-Google-Smtp-Source: APXvYqyBiUGAZ2CjiSe1OPmeBxzC1CyoaPv3kh/kHYYIFyajS1xQnlY1UJFFT+LYInWLXZcO8WGb+Q==
X-Received: by 2002:a7b:cd86:: with SMTP id y6mr12203560wmj.101.1572187413656; 
	Sun, 27 Oct 2019 07:43:33 -0700 (PDT)
Received: from localhost (94.222.26.109.rev.sfr.net. [109.26.222.94])
	by smtp.gmail.com with ESMTPSA id l15sm1194788wme.5.2019.10.27.07.43.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 07:43:32 -0700 (PDT)
Date: Sun, 27 Oct 2019 09:12:13 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 08/14] vsock: add vsock_create_connected()
	called by transports
Message-ID: <20191027081213.GC4472@stefanha-x1.localdomain>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-9-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191023095554.11340-9-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00, DATE_IN_PAST_06_12, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============4026023754936226677=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============4026023754936226677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 11:55:48AM +0200, Stefano Garzarella wrote:
> All transports call __vsock_create() with the same parameters,
> most of them depending on the parent socket. In order to simplify
> the VSOCK core APIs exposed to the transports, this patch adds
> the vsock_create_connected() callable from transports to create
> a new socket when a connection request is received.
> We also unexported the __vsock_create().
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/net/af_vsock.h                  |  5 +----
>  net/vmw_vsock/af_vsock.c                | 20 +++++++++++++-------
>  net/vmw_vsock/hyperv_transport.c        |  3 +--
>  net/vmw_vsock/virtio_transport_common.c |  3 +--
>  net/vmw_vsock/vmci_transport.c          |  3 +--
>  5 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl21UV0ACgkQnKSrs4Gr
c8j8/ggAyDA6UkgCfi0daj2HF5HCXYLlJ9/XXtklusGF1Wc9tWjzw/GXPdNlYum9
SqWtDu4YlWC3HH5TXKiMuTFjsumU6qJOSXKbPTFOmHdsQAnYeBMB1LZZRAd1O85T
LeBzRaNJjd+3qcjEeGf4gy7TuHGk49qnJaaP9n+SvheaN6DRf4cVJYhVYHf15xnI
qyhbT8cq5YcgszT/mp/D4guFPl9gYFPT7IqFvN8FOhELWmj7q6noJqAlEiUMsOSW
fg8L76b1v8h04Q7iF2lmvUMFu3q9POIgkxqCQcYZzxJUMFLJez2y8nWnRIbNLJnJ
l70AGpwkVMKXrJfa8DwyCI39cmT1Hg==
=06uZ
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--

--===============4026023754936226677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4026023754936226677==--
