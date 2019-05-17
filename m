Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1E21606
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 11:11:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9805C9EE;
	Fri, 17 May 2019 09:11:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9155B9EE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 09:10:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6821D710
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 09:10:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s17so6321051wru.3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uQP6UNBIuUPV1AZ1CoOW9AZlPGtgb8rjFjKOBI0fJng=;
	b=MK7l06K/5p1djD0GO7FMR5hUiraiIDATcpZ/TXE0SqO3vXLhBq+yLai+CCX3FgzlWo
	813DJmO1DOtdeNYPVD3e3cvs8+xEuhHYmcOzmMu4krLuLoVwQRSvpNGvoKqCKeWqtttD
	ahb/XQdbQZvQpm3XLp1fkRokLCL2zMGhAT+wC8LXIcT2dC8dD0jJfu/o6dfzhUjlG/Gu
	qVWeafdYi/FvTLSACg7rCkSBvj3qkziXsjwusmYqqPheTg3nZZrKOIdVi2mLV5iBMmvF
	ZlgtBbL1ryWttAUlQm+vG3QyHxcI6C255vFXf/zmbDebolGxZTPUEjquagUWkkzlIrve
	UVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uQP6UNBIuUPV1AZ1CoOW9AZlPGtgb8rjFjKOBI0fJng=;
	b=soFyeavKBIo2bjNeCXmP9a8L+UEiOypyCFHukDt0FIptW3hj6dUFXBYmzA7R9gVCXf
	wXJXOOJL1rUq3ZY8+bZ572SFnQC/OzbpYBP+fdjkptRqRLCw36XOk81z2nk6FXvwhR0L
	4o1wMJywvjJhuwtuefOCIO5VCH7Bos7SfBKpSoGtHKrLKYxfnUWPrWicoAE1dq4YC43A
	h4mnUpMW+qILdlKoEZbdNM4Ga4Qi0VnZjSCcwGMClYOWIDCQ2drxgXQ0V5V4llIfpAs9
	0mfOGe7PJq9j6giJkcEhO43u72fre9O7HGl/a4pikxsN2n7/PxtYfAg/oHGrNaIJ3HSu
	dvzA==
X-Gm-Message-State: APjAAAW90JdA7B3Pc2yivngRFTye7kwiFAK3lItTPlBEF4toC1B41Fwr
	rDf2cScnC4UhlMiKlaCT5X0=
X-Google-Smtp-Source: APXvYqynhf+F/VtAp3WICJenqlGOUtcwqDHIX042FUWZUXsuXf49AXeMdg+LfCNqZaZUCPolt9fLdA==
X-Received: by 2002:adf:eb84:: with SMTP id t4mr4431385wrn.43.1558084256073;
	Fri, 17 May 2019 02:10:56 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	k67sm8663482wmb.34.2019.05.17.02.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 02:10:55 -0700 (PDT)
Date: Fri, 17 May 2019 10:10:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 0/4] Prevent vhost kthread from hogging CPU
Message-ID: <20190517091054.GE3679@stefanha-x1.localdomain>
References: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============5855275875370286018=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5855275875370286018==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 12:29:48AM -0400, Jason Wang wrote:
> Hi:
>=20
> This series try to prevent a guest triggerable CPU hogging through
> vhost kthread. This is done by introducing and checking the weight
> after each requrest. The patch has been tested with reproducer of
> vsock and virtio-net. Only compile test is done for vhost-scsi.
>=20
> Please review.
>=20
> This addresses CVE-2019-3900.
>=20
> Changs from V1:
> - fix user-ater-free in vosck patch
>=20
> Jason Wang (4):
>   vhost: introduce vhost_exceeds_weight()
>   vhost_net: fix possible infinite loop
>   vhost: vsock: add weight support
>   vhost: scsi: add weight support
>=20
>  drivers/vhost/net.c   | 41 ++++++++++++++---------------------------
>  drivers/vhost/scsi.c  | 21 ++++++++++++++-------
>  drivers/vhost/vhost.c | 20 +++++++++++++++++++-
>  drivers/vhost/vhost.h |  5 ++++-
>  drivers/vhost/vsock.c | 28 +++++++++++++++++++++-------
>  5 files changed, 72 insertions(+), 43 deletions(-)
>=20
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzeep4ACgkQnKSrs4Gr
c8iNjggAneRqHvB02eyRBli2HesL5fARqNFQbAFYGE3ABJtYfF1NDOnIwXI1t5Bt
BassfyZocyhGcUX5kzLujRenaH0Yponx/sp7aDcA3EzH8gwyjdFAlozMSO5Mo/1M
Tq48N/3dHRew7HDCyR83slVKuuaYch4HBtn/K8XAe+HaDAEcdGx8tGAoieeBd1fH
jt7U2G0upIpOGhR1HOtHIZJ6llJU888Xj/l9EySxcXcoApQgaTV1Ta3oR2Sml3ts
WrSc06MuGo/2kKevVAW+qWvqLWk01rIhUWF1IH8+FGUkrPY/QZQDay+muNVXrD7m
/Zp2SmuE+tdA+yhwHfGEWgMsIDspGA==
=Dchs
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--

--===============5855275875370286018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5855275875370286018==--
