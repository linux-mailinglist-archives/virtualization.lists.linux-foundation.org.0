Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F8D0FC4
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 15:16:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A24EDB65;
	Wed,  9 Oct 2019 13:16:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B427C2F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3821E81A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 13:16:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b9so2984326wrs.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NqNWhKNuCxFUkqS6MSW/V4hcC4NeZ3p7cRwpDVaRvJU=;
	b=RZx/O7qMfkNbDIazZ56VS7ESeE2Z2sLtUueTWwQkf7SSsC3l8tYZzyA/zENcCZu5V7
	Xkh5tMeMIroML0fjI/u88dqhMAER0sSvU2/NZO4s6hWZKWwoQHR7H5d2jVhAZBQ9JUE9
	k/d5jIxtHEdcwfxQpVJ7gse++fkOhKrysRGRuqQt8IkMF5MTz6nw6t/sknS82VcWmxOU
	/5+z1EGFMKdlCbKg8etnls7MfwpreLW+oMaVAikKJ4E5EdYIYjKbZHXlmso3VgwUVcoL
	2WVVAuIWPrvNdUcvDa+bC7yRb6Em2jU09II/RlPt9E5r4uJ9kOc68WKqTw2iL3hG4tee
	nU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NqNWhKNuCxFUkqS6MSW/V4hcC4NeZ3p7cRwpDVaRvJU=;
	b=hjroQGzkapULwFavYbrbEAMHSta0pGYCPcEENOpagG0dns4rNHn1JfvZu2XiGdx+3O
	jBuhzysCVrSIYOw30OxZubGYlRWMcy24pYv8Oa2Pd5o7JJd5VCPW0LgZgb7HQifun121
	NPMjU+6LnZ8pu/zxFwdieb+iRkRS2CoxZlHo5s5a5IrxZDA5lPOCALbWbJ5JH1JJAe0K
	9JAKzr0IEE3HHO6tQTIV2JdWpMOPJXBa5Wfl7mcEn4/0412RXJqO1L58MTmuH5JjEi/p
	s+hdmvOrKbnrOCDMbdwItSTZ6+7p1LnL9hZWohP1JPLqoA0lffO/Wb/UXcnCG8KDSlF9
	h1ZA==
X-Gm-Message-State: APjAAAU082wcKNjIyBc6toQFzrC1AERC5USoyRef/9xJjweeNiIhgeQv
	gTHb3F5hYfC59joA7H2brm4=
X-Google-Smtp-Source: APXvYqynU7qFd7yDda1viaOJp3TtU+OF6WkbTnfJ4JhjvUDrcR6isTKKdN0nskgcBotiInIqXq9Pgw==
X-Received: by 2002:a5d:6ad0:: with SMTP id u16mr2810067wrw.313.1570627005754; 
	Wed, 09 Oct 2019 06:16:45 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id z9sm2771325wrl.35.2019.10.09.06.16.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 06:16:44 -0700 (PDT)
Date: Wed, 9 Oct 2019 14:16:43 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 11/13] vsock: add 'transport_hg' to handle g2h\h2g
	transports
Message-ID: <20191009131643.GL5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-12-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-12-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============2003499781538441833=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============2003499781538441833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Content-Disposition: inline


--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 01:27:01PM +0200, Stefano Garzarella wrote:
> VMCI transport provides both g2h and h2g behaviors in a single
> transport.
> We are able to set (or not) the g2h behavior, detecting if we
> are in a VMware guest (or not), but the h2g feature is always set.
> This prevents to load other h2g transports while we are in a
> VMware guest.

In the vhost_vsock.ko case we only register the h2g transport when
userspace has loaded the module (by opening /dev/vhost-vsock).

VMCI has something kind of similar: /dev/vmci and the
vmci_host_active_users counter.  Maybe we can use this instead of
introducing the transport_hg concept?

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d3bsACgkQnKSrs4Gr
c8iGmQf8CrTUBmiSd3MH3EamjJ8bZk3tA9Ej+1ywL//u+F4Qx3lKOoX+rWnMK5O0
pkoMAUGpvkKpC23xoV8gFfS9jtRax71aGCjFHnCDj6AoIOu/EwdqWTN28DjF0pF/
v2D3y2FJtItZeyB2JxnV/ouq9wnglcYDXuvVzwlIGvQi7cV2pj4TyVUzo55Qbtqb
+pbmGCQ845YsfBrmNGA28L7r7OiGp0XCXkrNiTpmgBvQpkUiYg5sKxbWZQj13dKU
UMBAQV8O4rNjJuEW/9oGehzTzq7JqwiA0TPRGlqkdfovgqA3m0dvSAVbZm/D74al
Y7NuoOX5k8zZlatP7hk+KQoph/MKrg==
=Wk8M
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--

--===============2003499781538441833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2003499781538441833==--
