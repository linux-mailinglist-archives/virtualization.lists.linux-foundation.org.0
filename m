Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B143E632D
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 15:43:49 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DD2DDB50;
	Sun, 27 Oct 2019 14:43:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C07E6AEF
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4E7E114D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 11so6841659wmk.0
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 07:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K1drSj56NAMifp0a52nujMXEWxvKYc9KCSSsaeobpyU=;
	b=TyzHBKD+Hyl4HO0A4bnaZYaumW+Bj/xP+SRf/Gyzp9LM2IPa0nApKEzMny34zY2nni
	/jZhVQQMkOA6w1fkLsXyCvZ4wSYOTFxaO3AjVsJGJvJkcsO/lzGVgGeQngK/RNc7Egri
	vcK+0EhYd7ZlM1z6inTn6NOxMFHs+Pb3pOBZ6vhw7YSe4PqKmG/frwtLNLcEq6k2+aE9
	jxtFwZ4mg+SL5Ee4EKdIpMQC0OuOLgcrxmGnPBP4d4E92oNWKVi+Puh4M0wCaNJr6lHn
	0Rh0AMSpRQsCmYGBDT4pEtOzApgtfEeCQGkf3x3kQqyZwQ73BtMFIzymjJc/+v70cVZO
	NIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K1drSj56NAMifp0a52nujMXEWxvKYc9KCSSsaeobpyU=;
	b=TOXXKwBwT+JXyC7lWB4Admowmffongcx3NdUwoY7zzvJZTZxUmHNn748iXMVC9kkQf
	Z4YgBrlN36D8FS5cqswdPEFhUPpAnIv3Br/hk17xVE6AhpCCzDpz3COFVo1jepeaYrYI
	zO8a6qlOFguaO3Tbw6KqD56rWLjCbMpT1/1m4MkqC8qtgORjOdlB3QanjoP5Z5Bbp6/V
	KyKSiNN2k0lFU3arrz4gKz8Z2QkXTZ6Ok/c9nz1Gc9dPIJjSe8J4z79uQJ+YnFA/Xmz7
	s0AuZ6QDNNo2wKPI/xDZQNCPLQd7fedaQZ8twtTyErWt5w61P1OkPeamftzuxHrDZlMe
	bjfw==
X-Gm-Message-State: APjAAAV5lJv3C9mRkHRRgwc89PHBAeDWnyRT9P5yBFNAMLs3m3jtaiUF
	txGfVWJqhj4CmHBQ4MP5Avs=
X-Google-Smtp-Source: APXvYqxLw4bBUvZYDSjjOukhCIcplahm2+ltAyfvlmEEdDvw7ye8qdWpBrNXeBrD9mv/HgOQmciqAg==
X-Received: by 2002:a1c:5f82:: with SMTP id
	t124mr12409011wmb.114.1572187411930; 
	Sun, 27 Oct 2019 07:43:31 -0700 (PDT)
Received: from localhost (94.222.26.109.rev.sfr.net. [109.26.222.94])
	by smtp.gmail.com with ESMTPSA id
	h124sm1133697wmf.30.2019.10.27.07.43.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 07:43:31 -0700 (PDT)
Date: Sun, 27 Oct 2019 09:08:23 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 07/14] vsock: handle buffer_size sockopts in the
	core
Message-ID: <20191027080823.GB4472@stefanha-x1.localdomain>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-8-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191023095554.11340-8-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============2813262763275677183=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============2813262763275677183==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 11:55:47AM +0200, Stefano Garzarella wrote:
> virtio_transport and vmci_transport handle the buffer_size
> sockopts in a very similar way.
>=20
> In order to support multiple transports, this patch moves this
> handling in the core to allow the user to change the options
> also if the socket is not yet assigned to any transport.
>=20
> This patch also adds the '.notify_buffer_size' callback in the
> 'struct virtio_transport' in order to inform the transport,
> when the buffer_size is changed by the user. It is also useful
> to limit the 'buffer_size' requested (e.g. virtio transports).
>=20
> Acked-by: Dexuan Cui <decui@microsoft.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> RFC -> v1:
> - changed .notify_buffer_size return to void (Stefan)
> - documented that .notify_buffer_size is called with sk_lock held (Stefan)
> ---
>  drivers/vhost/vsock.c                   |  7 +-
>  include/linux/virtio_vsock.h            | 15 +----
>  include/net/af_vsock.h                  | 15 ++---
>  net/vmw_vsock/af_vsock.c                | 43 ++++++++++---
>  net/vmw_vsock/hyperv_transport.c        | 36 -----------
>  net/vmw_vsock/virtio_transport.c        |  8 +--
>  net/vmw_vsock/virtio_transport_common.c | 79 ++++-------------------
>  net/vmw_vsock/vmci_transport.c          | 86 +++----------------------
>  net/vmw_vsock/vmci_transport.h          |  3 -
>  9 files changed, 65 insertions(+), 227 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl21UHcACgkQnKSrs4Gr
c8jf5wf6ArMyUiMMsXentQxUSlbUpCtIRf1HllqzAAYdsb4/GngX/TcZHaVU4JYg
vnMxPnYs9IatdJgEmJ2oV7Xemt2KdT67eqeqpeUuvOXzwCFTqx7gmCq0GYXPobTW
5Km+oVwrDxfzrUNVK5ZmeFhOSQuB09zbY1JhuwXTiX+nXOVOBP91Mt3i5wijc6a1
M6W2KtgysSkW1K4tf+8/c12QdNlB5bwL6HX2Tgop6bE+yTFpxmykopRkXonrLSQ7
2Ba02wkFAOakw0f9AlF0xBCJfY8OvHUNPYRvnh5g9OJc9DjvZPl2p2PLTpMv7DLm
XF8KeD/VWkSjA8RIYlUYmzUdVvshGA==
=oEzi
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--

--===============2813262763275677183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2813262763275677183==--
