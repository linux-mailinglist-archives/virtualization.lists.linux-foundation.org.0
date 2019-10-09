Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFCD0E03
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 13:52:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 30DC4F7E;
	Wed,  9 Oct 2019 11:52:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 035FFF68
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:52:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6A09914D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:52:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r5so2530177wrm.12
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7VJ857xf7kJYbDvUJe6HpwVbXrE5Sy9/QjGlnISt5HI=;
	b=T7djoM651ASFiFStwI/GcZ1ev87dCbWYHE4844UaAiakzYGNKTEdAI6/YNqDn7Wi/4
	ZP4Dz/F3ge+7+PuusD6uSZp62tzMYb9gOX8y3qdTiQ7JE9ezVO2RkrVUemDK0YhxZHKN
	V5XgqFhS6TMLfO7W47Xl8aHEAdSPe54UsqJ+Rr9XLuTy8W7ykO6UzrVH6PyT0SJ4eepl
	0t/fizwIdnfLxT612IAaLs6mA3A4hYhCJe97tIaS701tBHccNS6OLgBQC9WOg0dZIMDl
	SrF8ICiBeLIks97sM6yd9X9Jw21ImVbBqur27N6Fdup98+vGlbyF5r+Q44lCgqPUSsGY
	CDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7VJ857xf7kJYbDvUJe6HpwVbXrE5Sy9/QjGlnISt5HI=;
	b=VknUnWUUMMBebGkvObtMGoOLZR9ViQg5Z5JXOMZKSd2uNqhvThQz5ivu4NwDqmCUbZ
	eoD1/iMWAFNUMz7GTfmELMasN6tmaSRNZG5h26ChkyHtZ0EnlUIvyCpufWV9xWZrNC39
	W4aCRJ41KgUuF1F9QkyGH2zT+aaB/kWx1ABecMxJXxbRl8xU7l1txqF08F+ZtVvg2Qff
	uKWNPoRC0ypkV0Yt31FtgaRUYdxCx8SuSJYDBcts+oCikMTjwDfShUqkcpDUzor54dII
	R0+ZLrP66bj3sBN4BACWoE/HrcsPRoP68fW3rgnwZU7OA+qEDYuMsoxPr+zDP7BGF3kk
	l+IQ==
X-Gm-Message-State: APjAAAVd3jCgBsLepE+EpaURElkgHB/FbMbhrYlUkRO47UwHHXAhtDeG
	Vuvql47PDBQFKr/Osi4DNKw=
X-Google-Smtp-Source: APXvYqyvW0+QHKMoLgMknuglsyzr1heZ22+8CzIumVTWiRFwX8xngBSj/o885RGQvdjZD+abrBDN+w==
X-Received: by 2002:a05:6000:1288:: with SMTP id
	f8mr2476859wrx.111.1570621954039; 
	Wed, 09 Oct 2019 04:52:34 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	r140sm3122984wme.47.2019.10.09.04.52.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:52:33 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:52:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 05/13] vsock/virtio: add transport parameter to the
	virtio_transport_reset_no_sock()
Message-ID: <20191009115231.GF5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-6-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-6-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
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
Content-Type: multipart/mixed; boundary="===============9004108802409798419=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============9004108802409798419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Content-Disposition: inline


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:26:55PM +0200, Stefano Garzarella wrote:
> We are going to add 'struct vsock_sock *' parameter to
> virtio_transport_get_ops().
>=20
> In some cases, like in the virtio_transport_reset_no_sock(),
> we don't have any socket assigned to the packet received,
> so we can't use the virtio_transport_get_ops().
>=20
> In order to allow virtio_transport_reset_no_sock() to use the
> '.send_pkt' callback from the 'vhost_transport' or 'virtio_transport',
> we add the 'struct virtio_transport *' to it and to its caller:
> virtio_transport_recv_pkt().
>=20
> We moved the 'vhost_transport' and 'virtio_transport' definition,
> to pass their address to the virtio_transport_recv_pkt().
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  drivers/vhost/vsock.c                   |  94 +++++++-------
>  include/linux/virtio_vsock.h            |   3 +-
>  net/vmw_vsock/virtio_transport.c        | 160 ++++++++++++------------
>  net/vmw_vsock/virtio_transport_common.c |  12 +-
>  4 files changed, 135 insertions(+), 134 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2dyf8ACgkQnKSrs4Gr
c8ipQAf+N9DOIP9BQ9hDc3C/yWPRdpws712iHQbOHVNiBXDKyxZsYFY51fCC7KyF
9YxSDHJ+9RDm2jzHdItNAwmxXaSpULxrORIVG2c67hxwahN9r90kpWe+yp90NJR9
WPk9aEgIxgSbypf1nzAbI4ZqJDmTXq7zd3yG6QngmvRhrYF0s81JSSYeVo+rN96G
qFFiYYEEA7nlESBV9INveLYF1W9qtNIyy0IgxM3gCrWOkNbRYTWDNAnBEipM/siE
apf48ghnlNeD77gwbjk0SREQStWdle319cCM03Fw1kYT4WoUOOulI2B2opJ2N0qt
eDpkxHTBrmJpGg+NU9sLUblRs7Rikg==
=d4Pb
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--

--===============9004108802409798419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============9004108802409798419==--
