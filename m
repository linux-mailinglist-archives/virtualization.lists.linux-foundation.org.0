Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A331F15F1
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:57:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 91750858F5;
	Mon,  8 Jun 2020 09:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYodBLz44SYO; Mon,  8 Jun 2020 09:57:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3003485E25;
	Mon,  8 Jun 2020 09:57:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24568C016F;
	Mon,  8 Jun 2020 09:57:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F371C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7746E85E25
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jsk7o1Rna_Fv
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 96AE4858F5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:57:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l10so16660914wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=irlh/DAmGezzFSz/ZBwka7zqE6vVCqBDs6ozHXOIxqY=;
 b=EngZ9vYwjWfjJRgmP5bX1bo/qHbsxx85LLqxWUmO8c7u3d+JbZn5DNJCLIZ+i84LnX
 H3diKX8V9KBpQOv8CPJ8GRwqJf93FpaocP5msBC+L+erbYF55mdnYYpMN17bvAdj389D
 Yd0mrpJkTb8eRXVqqFa8GZbqY5m4h0ZNW7SpZz6Yj0OU2ol93aoVsIa73q1xzXpJU+cv
 +7nLuX/sRwV4BMPDPLLdF5mMZZouXn64XQy9RANABnhLwaAFAW6gY5p70M9lnil07N/G
 E1eZ0d3g5aAMPySs8MpXyZ798UDZVAo603is4axZif/QLMA3Kexo9en9GYOUBSJL6Rz5
 7rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=irlh/DAmGezzFSz/ZBwka7zqE6vVCqBDs6ozHXOIxqY=;
 b=bjp9t8TCXLnzEfbgiqUSg5zlnHjKeWYJSI434cI1cPyDu2q/InbsJ5W1BRPSf1RHJh
 v/hq2mbwDwS7gVDi36BN8HUurzqYlyscbnALQPTgz1AI4GIq0qDpTMmPtIAE7cfFMhpt
 0XyGmDh3yqdRdJ9lNxl/QZW/XngJgV+738sQsCpQLYERt9+SsMneeEFYyYuv0+kzxAl7
 Zi7KShLv3h/zRz/WmtsSePYjs1m4czbUnhI0QGGkw93q09SPE8n5AfIVcUiaQrNBXqkh
 KENQslSiUqKCW2FomaQUCdGrl5LrDm72G1WfMEzColXulbnPpLsRvUhLR+s3tWXxmwl/
 4uUg==
X-Gm-Message-State: AOAM530XrhLL1tUeTxiX7d8F9u5UKx/1neHuEmXjlA0TFk8Wg2Vglzbq
 2J4/uiDOUPWnS1m/XuerSSk=
X-Google-Smtp-Source: ABdhPJwM5am6ET01ZHpQxOXqWgs/YmeMFbTYTcVvDiGZDZOutBBcV+gGDbCKng83YgT4N3gVfVuOLw==
X-Received: by 2002:adf:d852:: with SMTP id k18mr22928605wrl.177.1591610234965; 
 Mon, 08 Jun 2020 02:57:14 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id c70sm11547618wme.32.2020.06.08.02.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:57:14 -0700 (PDT)
Date: Mon, 8 Jun 2020 10:57:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC v5 11/13] vhost/scsi: switch to buf APIs
Message-ID: <20200608095712.GD83191@stefanha-x1.localdomain>
References: <20200607141057.704085-1-mst@redhat.com>
 <20200607141057.704085-12-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200607141057.704085-12-mst@redhat.com>
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============7937025780558049637=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============7937025780558049637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2020 at 10:11:46AM -0400, Michael S. Tsirkin wrote:
> Switch to buf APIs. Doing this exposes a spec violation in vhost scsi:
> all used bufs are marked with length 0.
> Fix that is left for another day.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/scsi.c | 73 ++++++++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 29 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7eC3gACgkQnKSrs4Gr
c8jC3Af+LPXirMBmRcs7FQbxFSgLfLDjpnub+fLUo+dN0CH5ElfkoqGW6HJ8d7er
qlDKL+3ZPm1i0cRsqnN+xg6qZ2UKbC83RHrZ1z12NzkrluuFD4knW3/gjyyQPXvw
N8QQvguhNCO6DJ5yj8njHLuaAi44jkigVA5kFA5e8EFjsGHSQhoamQH23M/89rey
FOot5VmlwGfXtL216ALh6oIoLPuVvrQlQA6iVZGxXP4hgv+z7mJXzLmfJ7l2UnkB
OrdaqlvJcy4ZpKXZtVl5kfLbvRMuuv6a1OeLKW/FU2pJKxa5gn8WGdek5o5XrmpP
Uf/M6MvauUK5c9F369S2pWsEv+mqag==
=6nV4
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--

--===============7937025780558049637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7937025780558049637==--
