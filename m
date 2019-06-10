Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB403B636
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 15:44:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6BDB5C51;
	Mon, 10 Jun 2019 13:44:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F0C3B265
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 13:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7806A87C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 13:44:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x15so8548114wmj.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sNvG9YY7XPCNYQ2UBNpiCWdd5MhYb4kt+Gf0IbU8IOo=;
	b=flinDNZKnjs6s4ma5tdG2A0oUJSPW8EfGrulHAaE8+83iieBVEkBJSrRiseB4+Zaf/
	wnra9k5DaOXkMUS6B9CQLATnNz9AzAN1IzxiNiHuqrI14zKJVZbZRVe7KcbWmLQKZWQi
	tq7N/UIQM63jeVb8UkApaACWxG57FihRIf/udOZLFnSOXMbw13LCYFpByQnswx/igX70
	6P6U3ya9H5Wk0DLccjmca/xlX4HguUTNC31cMoAa70gNnIjeVlmgBaBs5WhwovedVJwl
	boaWUBTMhgZJt0mKGfracDo3a+Q5D9n8p7ZSyj5KsPsAePnJcuGnQ7kCEMi8Z31V2zxa
	asUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sNvG9YY7XPCNYQ2UBNpiCWdd5MhYb4kt+Gf0IbU8IOo=;
	b=aHk+QPrF3iUIK0KkVaPf1fw6DWHaCkjOccpzseDt0KTwJx3GFK/5nzyI1irSKA6wx2
	jzqCfL/85429nf3Akb20Ptf05hWdKGDUBISd2N6LEs9D7UrQCJucWfwJu+LRPmXhmoLl
	AQ3S+c27HRSZPeCIUoalWAIem47jp/txqzoEvi6IC5/fMoPZVDK4je+eD03MVXBKUyZ+
	bsPCih076cnZF8vDA2/k0J5TW+ZisuHLik0knX9mJQt/b9AOjSZj9QmE4Prb9AMXvV37
	48+9eTcEQa2eJt6MLlgrlWeBWNACDiEFk5EJUmHwTT7RZ3VjSW8xQgYpDvhHlJrtI6eY
	JgQg==
X-Gm-Message-State: APjAAAV2hq8JipAjrvI7vYSYTeRSJ9b4Yj4COI4X/hq8ww5n6YTtzzZi
	0wjSeRnAd1xVtOOXUtW7tOY=
X-Google-Smtp-Source: APXvYqxEibZ8BSB7QvrWbXPInpARHLL3QAUyPrZGR1ruT7xW5dTaQbkJ7lPpm57kOWpII+bEypnqJA==
X-Received: by 2002:a1c:7a01:: with SMTP id v1mr14178337wmc.10.1560174249089; 
	Mon, 10 Jun 2019 06:44:09 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	w6sm16045904wro.71.2019.06.10.06.44.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 10 Jun 2019 06:44:08 -0700 (PDT)
Date: Mon, 10 Jun 2019 14:44:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v3 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190610134407.GM14257@stefanha-x1.localdomain>
References: <20190531133954.122567-1-sgarzare@redhat.com>
	<20190531133954.122567-2-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190531133954.122567-2-sgarzare@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Content-Type: multipart/mixed; boundary="===============8446837325855411614=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8446837325855411614==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hdhkc9EpVJoq6PQ6"
Content-Disposition: inline


--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2019 at 03:39:50PM +0200, Stefano Garzarella wrote:
> Since virtio-vsock was introduced, the buffers filled by the host
> and pushed to the guest using the vring, are directly queued in
> a per-socket list. These buffers are preallocated by the guest
> with a fixed size (4 KB).
>=20
> The maximum amount of memory used by each socket should be
> controlled by the credit mechanism.
> The default credit available per-socket is 256 KB, but if we use
> only 1 byte per packet, the guest can queue up to 262144 of 4 KB
> buffers, using up to 1 GB of memory per-socket. In addition, the
> guest will continue to fill the vring with new 4 KB free buffers
> to avoid starvation of other sockets.
>=20
> This patch mitigates this issue copying the payload of small
> packets (< 128 bytes) into the buffer of last packet queued, in
> order to avoid wasting memory.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  drivers/vhost/vsock.c                   |  2 +
>  include/linux/virtio_vsock.h            |  1 +
>  net/vmw_vsock/virtio_transport.c        |  1 +
>  net/vmw_vsock/virtio_transport_common.c | 60 +++++++++++++++++++++----
>  4 files changed, 55 insertions(+), 9 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--hdhkc9EpVJoq6PQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlz+XqcACgkQnKSrs4Gr
c8i67gf+IaHwIE70u0NAFbNbt2B8lH5vRZt1H3I0PmFUqoxPIhZ6wFj4rL1mPDD8
W6mT6mla/sDPZQpeYKNJKg1tZ0N4rsl1hH/bW3huwjAGBlk7x9mP0LWUWailXE5P
efL35fpqoiaVvqMDFCwwZFkoba7gB1jcYzzQJfbMz9k1UNRkypvhJyVD4Hs3JI+O
C23eoQb5zO+9Z6aeFnsEj29zR4Abyw+f4kRVKPaJIETKUiMhK3x7fTaEXAkyW4R+
bl1D7xPH+VCInPAbSdkGKp7xbWTAzASEfEPrq14jRNwt6mDAKY3Q51l3Ia0l19NY
DMP6ErcemmdNksPZvxl0YWYTOD9pCg==
=Jzyw
-----END PGP SIGNATURE-----

--hdhkc9EpVJoq6PQ6--

--===============8446837325855411614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8446837325855411614==--
