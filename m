Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECEDD0DE8
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 13:46:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6CE7FF7E;
	Wed,  9 Oct 2019 11:46:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A50CAF68
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 27D70709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:46:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q9so2529166wrm.8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tKPlVOyQX0Mune1fiTMXvubT6ipc/MtiuESvbbCqVwA=;
	b=tfAur79IhqF7wyao5kZUd9YgUGH1vIsmdgKNoxBs2vpbNOP8YmIxbc5xmrGLAnSgFb
	nbQSQSxChJq8lAcivLbr0JZHSnbndhraQDtZBqW4F6z7sXPVXdJR1q8hUAyf74dsiuDj
	W/ZBbrnCh7013OOsNB90IBEwi3GQ1y3MLWqAaQs8QoZhy46MUkwBBWwawYFwDTFMJ9Jp
	47BDhuQMCOZCjsv8pDWbRQz9ij9hLaBPelGzUX0OfHOaYc+lqdINR0bHzSQelS4pIvuK
	Vc6zxx6v+x46nwuG/UOXq5SAtsG+P33cxhH37KhBSGLGwQagjNaxCzIrCZ3Z4EhQ47wh
	FYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tKPlVOyQX0Mune1fiTMXvubT6ipc/MtiuESvbbCqVwA=;
	b=pB9Gi22AbXUSOvHpJARpMdG/BG+4kJ841OWtYmdSa4LUf9PAV2z99BJVDqSKwAlFSG
	o9WtJaJYcvMuE5083kHREX1dXhmLzA4L+FP8vP2zsgwu2IfA83b3wL07CZzaBAnFVsjg
	LNKqCKAdyb5dgdyVGRrenMDWQd/ECrPef43p6ykUewc+m/96GXmog6b5I7hP4L+o3Vvs
	rOmpwdH8S6xS0bobym/TbCjrU6WNURIjxYXxVBjK0BCFEXCLHWE42b//r6gu/G4sgrZZ
	yJKmghgsj+zxu4R2o/In3iBrXdvPwGKlL39UsJmS1BSzHmGjdiRQ/tSpi2EykKaEFiq8
	lzew==
X-Gm-Message-State: APjAAAWt4Vd7fCU5UPFPfGMbO0I95ppar6+5dkAc4Q3+GyqClbEIDzBA
	6NPhJBgAfXNwyAt92BjmFzg=
X-Google-Smtp-Source: APXvYqwavV9IPYcWKUfdQEMiJWJzx8yh1yPx1dxVIpmks3FRBII+mSAk/MXkMGyOZd/46y+5xHO+PQ==
X-Received: by 2002:adf:db43:: with SMTP id f3mr1458077wrj.11.1570621603697;
	Wed, 09 Oct 2019 04:46:43 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id w5sm2212043wrs.34.2019.10.09.04.46.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:46:42 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:46:41 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 04/13] vsock: add 'transport' member in the struct
	vsock_sock
Message-ID: <20191009114641.GE5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-5-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-5-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1895690195600032825=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1895690195600032825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Content-Disposition: inline


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 01:26:54PM +0200, Stefano Garzarella wrote:
> As a preparation to support multiple transports, this patch adds
> the 'transport' member at the 'struct vsock_sock'.
> This new field is initialized during the creation in the
> __vsock_create() function.
>=20
> This patch also renames the global 'transport' pointer to
> 'transport_single', since for now we're only supporting a single
> transport registered at run-time.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/net/af_vsock.h   |  1 +
>  net/vmw_vsock/af_vsock.c | 56 +++++++++++++++++++++++++++-------------
>  2 files changed, 39 insertions(+), 18 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2dyKEACgkQnKSrs4Gr
c8gl2wf9GDmxHYnnuV/4iY/UGudKy+Um/JJ6pvLVFrUG/VRJTTs7M23YLemIGqSr
G8h+cAEog9/59utW/OavWSSiV6dn3b84u74m7VrMCp4SYrYO8XbdUy0adjFAi6CT
+CeNnNORBhdA98Z8vMb4Z7oRjNF6i93S2Qb/ShDZX1K9zq1OhMNKstoZ+nrCbTOD
PP8heokQ0sC2Gh6+QOMFmG/yPufk9Yp3Ld1FN4jzxZuLnj7vS/qq8w6/m33qdkKs
O59qSocNgs90h6x7IP8dxTzfyjPIL76Pd8YeER0+WKvMubbc2tp1fyAZFXGHCf8p
8MPdEyjQYwluu8naEZY7Xp29OVNOnQ==
=2nON
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--

--===============1895690195600032825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1895690195600032825==--
