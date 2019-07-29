Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FA78C79
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 15:14:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5B3EC1867;
	Mon, 29 Jul 2019 13:14:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98AD1185A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 13:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 54693604
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 13:13:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so61884042wrs.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OHQOPPy7/4hwyYGA/vv5wVuORcQr6NchGp5zyU89wG0=;
	b=P/a9JaSMUmsNOp66pm4/R4RFIEQFC8Es01OH1gh0MDWPS/RnQH0rtCEI/iDBv1f9Ni
	WxEA9J/3m3OGS42vbFjgpnbNYs7Tf2K0iRZp6vaXGRyOBWZFdQIzncA6FPxHFXtzurU9
	3c33csWVjCIx0g+r7ekeYxAUjueWvsm8xWlE39fvRVjHh9FNj7mZe/wb1eSmnRLLKd8b
	t+sQDgr4DQuNiu1Hd5NX2tcDQgA4KPTSudCRwgdJjC0F/JqHKrHejEua3r9wMQmjw148
	LnEEDE7LrrWePTwwrSjlWJYDEcY14u1hAzqzrQhj2+BIiaxXIcK4MZywFSltIJNfTNGE
	3J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OHQOPPy7/4hwyYGA/vv5wVuORcQr6NchGp5zyU89wG0=;
	b=KTLswqEHSqQLRyldhqhsvf7jxdXn93pXVzQ+B15OKucNeLJUTF7w7MgFcAAQ4ySLJ1
	QzTeH/auhjD4kEg5q/u9xIjONXlzSRFrdTzbymYZ3AIb9QlOJpnDDFb9s8xNM9PySpPB
	Fl9UUWiXBqC3kI5nh2RpnEqD+vz+6k3oJzYFv7RdLc6krok1PCSMEFy6TD+wZL9LHefk
	BRu5qdcaV4oRqUsPBQgPPPYeg7qTzPcLPHvlCSKHyUnDkKYN8lE7hbQtom6QDDI6R+1G
	AASJfb4LpmNtewtcnH7fLdT3QBvNS6dS+RYcYsUyDYRUZtxO2nyd94G2iC7EV0RSXvzg
	P3Dw==
X-Gm-Message-State: APjAAAURiFg4Eu+2E4P2vCRhvA5j/BMk3ZpbZOO5N65Z2uLT+HdGFToE
	AUMY/okas4r0YBWAxRFKUh4=
X-Google-Smtp-Source: APXvYqzvfTuzes+bHEgolmvEBkRLWuJKdlVEp7pcE1/Xi2hdZ9+35M+JXXfDbjbWyLqFKoVnUFEvOQ==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr64680709wrp.220.1564405981926; 
	Mon, 29 Jul 2019 06:13:01 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	i18sm81642557wrp.91.2019.07.29.06.13.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 06:13:00 -0700 (PDT)
Date: Mon, 29 Jul 2019 14:12:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 0/5] vsock/virtio: optimizations to increase the
	throughput
Message-ID: <20190729131259.GA6771@stefanha-x1.localdomain>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190722090835.GF24934@stefanha-x1.localdomain>
	<20190722091434.tzf7lxw3tvrs5w5v@steredhat>
MIME-Version: 1.0
In-Reply-To: <20190722091434.tzf7lxw3tvrs5w5v@steredhat>
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
Content-Type: multipart/mixed; boundary="===============6154588238952013834=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============6154588238952013834==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 11:14:34AM +0200, Stefano Garzarella wrote:
> On Mon, Jul 22, 2019 at 10:08:35AM +0100, Stefan Hajnoczi wrote:
> > On Wed, Jul 17, 2019 at 01:30:25PM +0200, Stefano Garzarella wrote:
> > > This series tries to increase the throughput of virtio-vsock with sli=
ght
> > > changes.
> > > While I was testing the v2 of this series I discovered an huge use of=
 memory,
> > > so I added patch 1 to mitigate this issue. I put it in this series in=
 order
> > > to better track the performance trends.
> > >=20
> > > v4:
> > > - rebased all patches on current master (conflicts is Patch 4)
> > > - Patch 1: added Stefan's R-b
> > > - Patch 3: removed lock when buf_alloc is written [David];
> > >            moved this patch after "vsock/virtio: reduce credit update=
 messages"
> > >            to make it clearer
> > > - Patch 4: vhost_exceeds_weight() is recently introduced, so I've sol=
ved some
> > >            conflicts
> >=20
> > Stefano: Do you want to continue experimenting before we merge this
> > patch series?  The code looks functionally correct and the performance
> > increases, so I'm happy for it to be merged.
>=20
> I think we can merge this series.
>=20
> I'll continue to do other experiments (e.g. removing TX workers, allocati=
ng
> pages, etc.) but I think these changes are prerequisites for the other pa=
tches,
> so we can merge them.
>=20
> Thank you very much for the reviews!

All patches have been reviewed by here.  Have an Ack for good measure:

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

The topics discussed in sub-threads relate to longer-term optimization
work that doesn't block this series.  Please merge.

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0+8NsACgkQnKSrs4Gr
c8gLNgf/Y63sHjZ3yrw3pup1KDkZmcZX9U+gUxzFkEnpGo8Uz20pFa0UQ8EgfdIP
Ow+qZ9hm77WDbeAx8lyWTwAV1C2WS1k5RMpqWJzBdI45MixObQ2+2/ddp+igHDAJ
L7pDH+Wwc/7p0FcMuUqqQKl6MM2yJ9zHrRu/5xVtrWNuw4Hdt7BvWshvE0G496kv
0itr7U5WqDstqYPBWm1DbGBr6Nnwv7a3R/3lslRsTiN3em63/Gl+hVgb+jvk/wSl
W8BS+9/UJkaBG0vv+f89e7xqqvCP90S8CPGtk3LhUhufdf+5I/Hekm+eY7MDN+Au
xX2HJr/ZEPFdghVj8F+OODK+aDR6aw==
=tIn+
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============6154588238952013834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6154588238952013834==--
