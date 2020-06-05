Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD71EF33D
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 10:37:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8D1ED203A5;
	Fri,  5 Jun 2020 08:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZpYKXAM46Mf; Fri,  5 Jun 2020 08:36:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5DF8822264;
	Fri,  5 Jun 2020 08:36:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 437C2C016E;
	Fri,  5 Jun 2020 08:36:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A168BC016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91E1A886A5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tx3vU74EpUsK
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:36:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68A2D88677
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:36:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k26so8241952wmi.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 05 Jun 2020 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3nTFlmbzjc8v0pH7sZvwI+DHbaQtTE22skIrB/BBsac=;
 b=e67AZEdW7AQDvDVQqSMO75BKdN9sXsQ31mldbeM81dO6BOICEsD2O5FUbT6AtHWRGJ
 plZ42JBpABtAE0qkoYP0pTcrEnHaBdxBXb2TqXVeprtt7h0rkxNMPlsWlshIHPQvFC3f
 LIk3kKcIyHE4kbOCKEy+Oitwg1ku4027jK0wI2jYWVAMCSMdaqleuPGztuOKDBJFgF3y
 PERlNqsNtwYYDncipouKU3kMoPoxwbgfTlz5gslrVzJ43mHdWSUQM8/bTNCx6Z2/ENou
 BkMUs1ZqDNy3mRk9R2QVvQDdZt3IRrKyrNetY1lggLmAixWg09XWFx9nwpriBfYcF4b/
 gh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3nTFlmbzjc8v0pH7sZvwI+DHbaQtTE22skIrB/BBsac=;
 b=ITFTUCs5iEBH2eqAGV07RinD80AuqKg3tMjU0PjTjxJDL14Ujmv3tfsopunLP10uZr
 haxGfTix8Yj/EpMzJHroN8ZEo2psFsxD0J31u4QfRQu2ygELsP1cKEA/r8YWr68R0l7r
 xtI3ATTG+pbpD0HNmvPTlN0RWHYrGZSC0EBqsGX3lh6EazbZRGW475ztbJ+ulbouAyrk
 4YwSm8yfVve17sHvxOsr6GKKh0UaZUDGy6LS94sJuX9TVSWPjTeGdoRyyuOP4LRfdorK
 8VISNzFXPlF2YyuYjfbronMX39JNs5gk+HR0zzrucAuG7pM1NC6rs72yDarV5p4pc+Cf
 26UA==
X-Gm-Message-State: AOAM532H2PFrZOGz+Q+YEVE0FhHy+86IUFFFOR/0WfvFDKfueujWPcVn
 z6XjEEk/I9EYZe2a/ZlOKM8=
X-Google-Smtp-Source: ABdhPJzD5hm7+HVTbJ0qq5buzfUjWSLLl36UEL8lKEkif51XgpXz2Frm5/M2WeUz/+7QwQtLTt0pgQ==
X-Received: by 2002:a1c:de82:: with SMTP id v124mr1554125wmg.89.1591346214788; 
 Fri, 05 Jun 2020 01:36:54 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id r11sm11692035wre.25.2020.06.05.01.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 01:36:53 -0700 (PDT)
Date: Fri, 5 Jun 2020 09:36:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC 12/13] vhost/vsock: switch to the buf API
Message-ID: <20200605083652.GC59410@stefanha-x1.localdomain>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-13-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-13-mst@redhat.com>
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1479031628415887130=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============1479031628415887130==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 09:06:22AM -0400, Michael S. Tsirkin wrote:
> A straight-forward conversion.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/vsock.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7aBCQACgkQnKSrs4Gr
c8iqrgf/W5qzuVqOztDa26raKxGSK1HW1tigkHdgjm6LUcghCLUBNVTqklvPgnVt
8n0X/em12Ztmj43uNCuw0U+4ZpTZjibzwlvp4QnFw8nVsLtdMZIR9nAORPM/9Lbq
cihrvmGGikfHp5Rlj76nOnVODooOuQEI+S0ii+m5uKGEE3Y2z5n0LIh8j1p5Ms0k
Xr5j9JKZ5mHH9ZYA6c79KVPPn7k18+4H5aSr5GPr3gsrUR8jSJhUhub1H6tAwKoB
Tg+68nP4BA7Gcowm+QE22SwmmT1YEmjLKydYLH0bP2NewcRqh10Dw3DsV2fMU8BN
3LEoQfYetWn383ZxfvbNLNO8JCQ4wQ==
=D/8f
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--

--===============1479031628415887130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1479031628415887130==--
