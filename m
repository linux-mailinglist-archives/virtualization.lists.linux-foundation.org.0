Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6E0D0FB2
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 15:11:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DEC38B65;
	Wed,  9 Oct 2019 13:11:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3142BA95
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:11:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EC82C5F4
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:11:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r17so4744879wme.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 06:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2pQmxSEy5O4RUtCVnV8Yf/x1Ag/UDy5/MGukZNn79Q0=;
	b=mk+INmVRkRDoT4Bs6Nxmev59RMyapJN7jDswk5JjtC0k+6bcGsazyhsWJHx6SpDK0l
	AbIEM7i85+3V47TX+c/cWTSk3II/7EJOtPtPGYrtsqwNgScxLyWHiPn1y9zW0KjI+n2i
	0e3b43fc/X/+nRTUDhdzwyCoowAL2fHXihzFMq8Vh5y46dkn7YZ7GHiT3XHwBYKWErX0
	Taf00CbGmtxWROZd3GNRQAXSA0Ksx818dA/SC6oT/3qQ/xRqJ8mWvhuJqT8OmcAgfsG9
	AU4yyL/nBsYSfSpobna5dmmUBYw5ym3Hai7uW9DWQzef+CEPNQ/C0SuUAqeBS1DOJP6r
	ryjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2pQmxSEy5O4RUtCVnV8Yf/x1Ag/UDy5/MGukZNn79Q0=;
	b=qEWv0hxFId4fATvTbNoYiosVB44Ma8qKjiZOrDrAzKWp4ZKHe2QvTXUF/35Qgra1TL
	Kwb3Zz7Cu4MmibwnI5olr7GaWYPDOuiqRriT5L18M4DhD0RByxCEVb4nPLtEBnoUVeOe
	/JmzF5kYPf0iParKGW8k0dqkxeHO/Dm8d6FjrbWLODcbthdrRsuLDmpIkLxlsF+ALYzA
	DvWvoNEquEXyxWtx2zJVV5anLiVW2FL16KpZFjXj+TVccOcbIImQsHVsscD3XVMoYsNy
	96WS/HU6V5GCS+YiGWtEBzHojkKRJqovYcmQvZG9V3OP9fVoJHDbc0AtRJEUV21YwCL5
	zCqw==
X-Gm-Message-State: APjAAAUSXRaG1YMcPml/6U4ZR4ZuPghXILEjS9WuqYh2gTGpIm05A08c
	FCG6hTejFl0Mmy8B+pTksyg=
X-Google-Smtp-Source: APXvYqxK8FcAs+SBpkNlf7mfE+EHGTKFvUN/qAClYU9GQc9ACK8NpwSGL0VEqOAY9F4eXxCOAphvIQ==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr2605040wmk.30.1570626685433; 
	Wed, 09 Oct 2019 06:11:25 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	r18sm3705058wme.48.2019.10.09.06.11.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 06:11:24 -0700 (PDT)
Date: Wed, 9 Oct 2019 14:11:23 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 10/13] vsock: add multi-transports support
Message-ID: <20191009131123.GK5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-11-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-11-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3392423860032156658=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3392423860032156658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IA03tywDYuoVKXrw"
Content-Disposition: inline


--IA03tywDYuoVKXrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:27:00PM +0200, Stefano Garzarella wrote:
> RFC:
> - I'd like to move MODULE_ALIAS_NETPROTO(PF_VSOCK) to af_vsock.c.
>   @Jorgen could this break the VMware products?

What will cause the vmw_vsock_vmci_transport.ko module to be loaded
after you remove MODULE_ALIAS_NETPROTO(PF_VSOCK)?  Perhaps
drivers/misc/vmw_vmci/vmci_guest.c:vmci_guest_probe_device() could do
something when the guest driver loads.  There would need to be something
equivalent for the host side too.

This will solve another issue too.  Today the VMCI transport can be
loaded if an application creates an AF_VSOCK socket during early boot
before the virtio transport has been probed.  This happens because the
VMCI transport uses MODULE_ALIAS_NETPROTO(PF_VSOCK) *and* it does not
probe whether this system is actually a VMware guest.

If we instead load the core af_vsock.ko module and transports are only
loaded based on hardware feature probing (e.g. the presence of VMware
guest mode, a virtio PCI adapter, etc) then transports will be
well-behaved.

> - DGRAM sockets are handled as before, I don't know if make sense work
>   on it now, or when another transport will support DGRAM. The big
>   issues here is that we cannot link 1-1 a socket to transport as
>   for stream sockets since DGRAM is not connection-oriented.

Let's ignore DGRAM for now since only VMCI supports it and we therefore
do not require multi-transport support.

> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> index 86f8f463e01a..2a081d19e20d 100644
> --- a/include/net/af_vsock.h
> +++ b/include/net/af_vsock.h
> @@ -94,7 +94,13 @@ struct vsock_transport_send_notify_data {
>  	u64 data2; /* Transport-defined. */
>  };
> =20
> +#define VSOCK_TRANSPORT_F_H2G		0x00000001
> +#define VSOCK_TRANSPORT_F_G2H		0x00000002
> +#define VSOCK_TRANSPORT_F_DGRAM		0x00000004

Documentation comments, please.

> +void vsock_core_unregister(const struct vsock_transport *t)
> +{
> +	mutex_lock(&vsock_register_mutex);
> +
> +	/* RFC-TODO: maybe we should check if there are open sockets
> +	 * assigned to that transport and avoid the unregistration
> +	 */

If unregister() is only called from module_exit() functions then holding
a reference to the transport module would be enough to prevent this
case.  The transport could only be removed once all sockets have been
destroyed (and dropped their transport module reference).

--IA03tywDYuoVKXrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d3HoACgkQnKSrs4Gr
c8hckgf/ZTFwJLw3fxdGNwt8fds62hVvtGGsVru3VbLN9WrtPanY8WHTVxqC18Vp
pF78jglD8L0LV3gjDG4rc5A4Op4a/ND2IjjaEwixZzEeuzkxO+tw/zuGsEQM63jz
Kckudl+xi6pD5hgxV4a3qH07yLcdBdDXyUdbrHOpxfhvvOEAHaNLdXZhXjvtrrtd
XnsSEr9/3Be4cTcwhN1+nugiFit8xhonF/zYnIv3rZsouWpJnwUKcy4fEazCSRTz
6yWFh/iRSwq/5roe5KrD6rJFh4XoW3VDF4oVQKwZ8vaviYSl1kw8AJY/W7tErbrd
yneRuN0muehGfAMpX1z/jwcR05p6Hg==
=sE/v
-----END PGP SIGNATURE-----

--IA03tywDYuoVKXrw--

--===============3392423860032156658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3392423860032156658==--
