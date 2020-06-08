Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A218D1F15F5
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:57:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2503B86AF2;
	Mon,  8 Jun 2020 09:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CcQWCUfBPvJ; Mon,  8 Jun 2020 09:57:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80EE386B68;
	Mon,  8 Jun 2020 09:57:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 536AAC016F;
	Mon,  8 Jun 2020 09:57:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E0F5C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2AC2886AF2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRix0qotHTT3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 40937868FF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k26so15875510wmi.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ut3XaYVr0/pdTUeXNMqLLOtxnewlvYwLTTD1iBm+7XQ=;
 b=RdlctmTtfBbd8Uko+DYTxuhK1HAbvp3LGhsev90w5XdLn4pFR6m2lTBek1+49DwYdk
 VmL5CGX4YMjrmhpUY/1+uw8UpfPgX8eiMWhn2Xlz1mS0lEw6w05bjC1i9IBKsFrZP1LH
 UerrHxTT5ZilPw+4+FiDPQOWEbWRfwVIN1HBObUPF7eUVE/U0wVHR73pK1TWWAFtmLRv
 k3mwFrDKgtG+ZjPKZOlHaPSlXScavyU/xrJlJcIcE8RL9KfvqwfXbPyz13ezM8tfNQaj
 jlPIMXjUL+I1zT2WcMv9onrW4KpD5djfRWEFACtNrqvnkm8TRRLl2hDp6Bba/HgHa+Ju
 wirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ut3XaYVr0/pdTUeXNMqLLOtxnewlvYwLTTD1iBm+7XQ=;
 b=bqAfWVaErO7sQWXc6jDWxus7oOgfgfhUVKzv2qmEFKkSNbwLE6RJr5CmQDVvLgbJTh
 dU2J0kQzcsmh7sVdSNv/e7sKG0jsLRptZ0isMLPAUw83u3ofY1MsVj9/AbUsXgp4o2GM
 oQWcHwltXP/QnITYcElzF6C78jO9UdBYTJnBxjBHWhA8MSvWgc7LJUFUZZaP5lJSYcjJ
 XjE59J+YHrBqD7oe4Qb62C0u1H5UlBzXcC7MT1Ntjf+Wa1S8zWW8K0GvXmDsBHNVPR4s
 JeDgqhYXjhfrNHlLrMFM7flVcRr/I0iEr9epj6/khtacEClUpenmpDQu7cNXoIQ3t84g
 RTLw==
X-Gm-Message-State: AOAM532nXxy2LDSGePPHE4KEsa+GFzDPiyuSjGOLS4cLrwEytwnQCvmV
 tQw5cRI80gi/fPvwe+0OxBc=
X-Google-Smtp-Source: ABdhPJxJZHspLs3/DHVKLx71a8WqmLy9gtnH+/lgVFgY/SGOtd7nkirOgTZxJcOMxzfUjQ7R8JH09w==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr16591261wmj.121.1591610239597; 
 Mon, 08 Jun 2020 02:57:19 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id d24sm21246990wmb.45.2020.06.08.02.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:57:18 -0700 (PDT)
Date: Mon, 8 Jun 2020 10:57:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC v5 12/13] vhost/vsock: switch to the buf API
Message-ID: <20200608095716.GE83191@stefanha-x1.localdomain>
References: <20200607141057.704085-1-mst@redhat.com>
 <20200607141057.704085-13-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200607141057.704085-13-mst@redhat.com>
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
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
Content-Type: multipart/mixed; boundary="===============4478659862676583647=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============4478659862676583647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2020 at 10:11:49AM -0400, Michael S. Tsirkin wrote:
> A straight-forward conversion.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/vsock.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7eC3wACgkQnKSrs4Gr
c8jwtAf+JgEio09QmwBTCC4RhAS9zTZxiNWAHCdPtESgu4E+VLcxHjEEpkF7w+Cm
pQiZHcW0mG7Y2PKAg8VkP2GvXH0gbiNSQ/7ZTOFsExePWay5vLQdYg/u21hleZae
zQ4oI905vhOEb6L92iAvzuFr0hTpIwZ1kvc+1bUAHQwLIycKalMkym1jgoyUaD2/
eFPwvzPIPZfEuorb3mmhEq98yKTDxH5U5glFjBaZWD3E3Mg9RZN3g0Iqps80abIS
Z47zkqMzxw8heuyjScbbz26hhKj6ziP1mcs3crmThZk3H1EpPqaVIcNHUTs6AE0P
pRlUbV4l4np3xvL9u4DDOb2FGjgDlA==
=6gku
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--

--===============4478659862676583647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4478659862676583647==--
