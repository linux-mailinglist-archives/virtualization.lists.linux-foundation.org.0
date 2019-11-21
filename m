Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 68947104F8D
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 10:46:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E372786F66;
	Thu, 21 Nov 2019 09:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtLjBMByWDjQ; Thu, 21 Nov 2019 09:46:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE1A086F58;
	Thu, 21 Nov 2019 09:46:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A392FC18DA;
	Thu, 21 Nov 2019 09:46:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11091C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EFC5587E95
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMQebt7iXvu2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13BA787E93
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l1so2954596wme.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 01:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WL6pXCeu6XuKW3klwRRmKr6eTtRF5VFWIYJFBOiOTz4=;
 b=hd4lX3Yqf3IW8r/Uil+0yEeCNDDDcm/cDu6uaAjj+xzgIzSiUQqZBJ3PfblpEbkcRG
 BnVDdlyplcWyxQUJQmQdj2iuOLHxzF/fNb65QKDtQM73kJ0bKygsWhKYM5QElvvAO2zy
 opfSHogwVx9l8ovu6mcmr5Yd8pQxw/7nmYZ/z5zEO3Z06gFmIbQsQ4rimEucQs4De/g6
 XTm0TiT3zQpXjKooOwWKGWFpnZMFQU/KForF3wAM0pjWKnAL2lHNnNJda4hL9BW0empV
 lpUeysFyY1uEYahInd5rX9atG3ANPeChM3iTgXDPuPAc3hnVxm4oX2igoZHdWInaIb6M
 Y4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WL6pXCeu6XuKW3klwRRmKr6eTtRF5VFWIYJFBOiOTz4=;
 b=l9BzkaDgTVXsgDbuI8IWkFRQ9Kz7eNek5ecFZbeiA4VTKozXy1XcU3rfPhKmZhJ4EJ
 Lnm7RZ6EuGY7n+3Fqr8ScrrOgr9LnfI9BP97E7nQzn0SJG94ppExYeyb942DX/NTc5+B
 Ax89rtt2ktpIlG7LGwt9kVIifwjqNsWga/r57T9uZH3jVpW0tYZvqUOQiTiAn+MLBjcB
 BBQFF/mdKFAu/HsRrX8cNGf4fyI1yUmZirafxPIguRrh23saYVq2WoVwwYb0QdCm9VsI
 Wmom1ueWZeku/ezchsKnoKAnnBaGc+XPXv2enh/n94sw82qYp3VxuwnuZpCJEGtUdavM
 s8pw==
X-Gm-Message-State: APjAAAUTo1feu+2FWmhhSXGMnqWGxNVaRw3aQzIMqR/ob1DZ2VXHX4wf
 xF4bIvtyK/g+OHuqcaqfEFA=
X-Google-Smtp-Source: APXvYqzF0FGM/Vj/Mprdo+NEZjgKKrkrZxn6+akIEVJMqkE6Jg2J9aBNFPsEXVx/LUZoE3f2tDsIDg==
X-Received: by 2002:a7b:c642:: with SMTP id q2mr8684297wmk.169.1574329605481; 
 Thu, 21 Nov 2019 01:46:45 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id b15sm2536520wrx.77.2019.11.21.01.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 01:46:44 -0800 (PST)
Date: Thu, 21 Nov 2019 09:46:43 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 0/6] vsock: add local transport support
Message-ID: <20191121094643.GD439743@stefanha-x1.localdomain>
References: <20191119110121.14480-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191119110121.14480-1-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============8339820992161836083=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============8339820992161836083==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 12:01:15PM +0100, Stefano Garzarella wrote:
> This series introduces a new transport (vsock_loopback) to handle
> local communication.
> This could be useful to test vsock core itself and to allow developers
> to test their applications without launching a VM.
>=20
> Before this series, vmci and virtio transports allowed this behavior,
> but only in the guest.
> We are moving the loopback handling in a new transport, because it
> might be useful to provide this feature also in the host or when
> no H2G/G2H transports (hyperv, virtio, vmci) are loaded.
>=20
> The user can use the loopback with the new VMADDR_CID_LOCAL (that
> replaces VMADDR_CID_RESERVED) in any condition.
> Otherwise, if the G2H transport is loaded, it can also use the guest
> local CID as previously supported by vmci and virtio transports.
> If G2H transport is not loaded, the user can also use VMADDR_CID_HOST
> for local communication.
>=20
> Patch 1 is a cleanup to build virtio_transport_common without virtio
> Patch 2 adds the new VMADDR_CID_LOCAL, replacing VMADDR_CID_RESERVED
> Patch 3 adds a new feature flag to register a loopback transport
> Patch 4 adds the new vsock_loopback transport based on the loopback
>         implementation of virtio_transport
> Patch 5 implements the logic to use the local transport for loopback
>         communication
> Patch 6 removes the loopback from virtio_transport
>=20
> @Jorgen: Do you think it might be a problem to replace
> VMADDR_CID_RESERVED with VMADDR_CID_LOCAL?
>=20
> Thanks,
> Stefano
>=20
> Stefano Garzarella (6):
>   vsock/virtio_transport_common: remove unused virtio header includes
>   vsock: add VMADDR_CID_LOCAL definition
>   vsock: add local transport support in the vsock core
>   vsock: add vsock_loopback transport
>   vsock: use local transport when it is loaded
>   vsock/virtio: remove loopback handling
>=20
>  MAINTAINERS                             |   1 +
>  include/net/af_vsock.h                  |   2 +
>  include/uapi/linux/vm_sockets.h         |   8 +-
>  net/vmw_vsock/Kconfig                   |  12 ++
>  net/vmw_vsock/Makefile                  |   1 +
>  net/vmw_vsock/af_vsock.c                |  49 +++++-
>  net/vmw_vsock/virtio_transport.c        |  61 +------
>  net/vmw_vsock/virtio_transport_common.c |   3 -
>  net/vmw_vsock/vmci_transport.c          |   2 +-
>  net/vmw_vsock/vsock_loopback.c          | 217 ++++++++++++++++++++++++
>  10 files changed, 283 insertions(+), 73 deletions(-)
>  create mode 100644 net/vmw_vsock/vsock_loopback.c

Please see my comments.  Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3WXQMACgkQnKSrs4Gr
c8h4aQf5ATKD+2md5rF2gaJHwaBfEiLqsK5/ciPJv0qtYXlnZi9wionMXyFbAmo+
tWchVmMP8gpdCf9qsWBQo6beDMWJdZSCZCZ0kiAgoHXGWK50lFhtFBqXjngopcXJ
Hr9IgWPWoobZR0Z0p98tHj0ToumHaFtopLL+rrtCAwkGHxNnVTgv0HRWcAsEORQc
o3AI3/+6a6ESmP8dtcRZ7fY628un7VcdFVrD6mnyxPTX3CVqulPLPLC7Y+DpYtFa
ZqU04KBPp/8t8HtsZZYjGv60H58qzwPDAwwEIpFZ9gYl3cKRGRvUXs3t7vKdzZGA
gu9P/McerEE+0vQCtysTkHsIzrgUvg==
=c63q
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--

--===============8339820992161836083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8339820992161836083==--
