Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA1312608F
	for <lists.virtualization@lfdr.de>; Thu, 19 Dec 2019 12:11:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3BCB9231C8;
	Thu, 19 Dec 2019 11:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlmIOtcQmhIv; Thu, 19 Dec 2019 11:11:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 491F923100;
	Thu, 19 Dec 2019 11:11:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F005C1D84;
	Thu, 19 Dec 2019 11:11:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EC1FC077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 11:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 02B5188672
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 11:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZCgcTOvDyISV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 11:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0A47987D92
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 11:11:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so5199709wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YrnybgUoheTzv0oO8IdIe7ptyQE6UeKhluLQtlHkiL4=;
 b=L5jwgvu8SJyXaL7/gM2ue6Gliiu5B28abgkn3MBXlepIvB/3e6eiEFI/xoJx0DWQFm
 Czc1EeAnKsiRfSDoEORA5nGYqKCBTs7YKYQVkJkUdqtpiNBo+35g+6gH2ym8BKM16kRi
 futwiDg6xervRZyvvWdf5vW4X/jRSkUxOl6tWZ0PlvJMSyyqIuIZpg1WEnCb7WQDcOvM
 HtqvwZ47j4yCHXIc3/f8UiWo+bqmUBbsPfkK44q6AjnkcpLwpDmNQV+WYVne+FhJHJ1m
 5W2BQJpVAdLCzCZDZNSuXJqOqDf/LtsZi6CLCgYCkCPzY30fBRFyxyyzwMEpyiwBtrF1
 271A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YrnybgUoheTzv0oO8IdIe7ptyQE6UeKhluLQtlHkiL4=;
 b=jiMTzB2fGVwfhmu9sKEJe1vEqSKum1Il3Xpkxts35rjJmnZBqg5cY6R/qH4WSIjNgV
 NR5hBsMkmyzShLr/IFnJui4K9LtzhKtCrtoRYqTmEEU1GkL2l3/MUm9SsafuraikSKMJ
 HzrDxyUONqd0BnYlyyUM1Es6t8dwfBv/ZZCdGJ/0kqZbR7YnZFIKi0EfRzT6h0C1Solb
 SmBUiSU29R4MpdG6aWf4cfV9bDjDyHe8B3FCuFcn5Hk4K6DwLPXlkeLPnYs/cYZOllVZ
 7fQyW5bZe9MGu8jT58WTielwa8WTv+d9Z3iTtLs1xfcBoh2jNvE/ed8I82cAGqavleeh
 uv7g==
X-Gm-Message-State: APjAAAUwizh2IKDA2JZ9x8adhKyMtOPs7xJcLGWHnz5InCsrXi33orqW
 AgGhJoTnDVG5A5c/LukUH6o=
X-Google-Smtp-Source: APXvYqzUvVcY3kHWc63gcuoVbKWoG+jj5xTx9pH8lTTdeQpbORs22WGWlPob0aZnv9F0VQt7Oxzvkw==
X-Received: by 2002:a1c:16:: with SMTP id 22mr9647105wma.8.1576753887091;
 Thu, 19 Dec 2019 03:11:27 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id p17sm5975871wmk.30.2019.12.19.03.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 03:11:25 -0800 (PST)
Date: Thu, 19 Dec 2019 11:11:24 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next v3 00/11] VSOCK: add vsock_test test suite
Message-ID: <20191219111124.GA1624084@stefanha-x1.localdomain>
References: <20191218180708.120337-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191218180708.120337-1-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, davem@davemloft.net,
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
Content-Type: multipart/mixed; boundary="===============5221010736501477228=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============5221010736501477228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 07:06:57PM +0100, Stefano Garzarella wrote:
> The vsock_diag.ko module already has a test suite but the core AF_VSOCK
> functionality has no tests. This patch series adds several test cases that
> exercise AF_VSOCK SOCK_STREAM socket semantics (send/recv, connect/accept,
> half-closed connections, simultaneous connections).
>=20
> The v1 of this series was originally sent by Stefan.
>=20
> v3:
> - Patch 6:
>   * check the byte received in the recv_byte()
>   * use send(2)/recv(2) instead of write(2)/read(2) to test also flags
>     (e.g. MSG_PEEK)
> - Patch 8:
>   * removed unnecessary control_expectln("CLOSED") [Stefan].
> - removed patches 9,10,11 added in the v2
> - new Patch 9 add parameters to list and skip tests (e.g. useful for vmci
>   that doesn't support half-closed socket in the host)
> - new Patch 10 prints a list of options in the help
> - new Patch 11 tests MSG_PEEK flags of recv(2)
>=20
> v2: https://patchwork.ozlabs.org/cover/1140538/
> v1: https://patchwork.ozlabs.org/cover/847998/
>=20
> Stefan Hajnoczi (7):
>   VSOCK: fix header include in vsock_diag_test
>   VSOCK: add SPDX identifiers to vsock tests
>   VSOCK: extract utility functions from vsock_diag_test.c
>   VSOCK: extract connect/accept functions from vsock_diag_test.c
>   VSOCK: add full barrier between test cases
>   VSOCK: add send_byte()/recv_byte() test utilities
>   VSOCK: add AF_VSOCK test cases
>=20
> Stefano Garzarella (4):
>   vsock_test: wait for the remote to close the connection
>   testing/vsock: add parameters to list and skip tests
>   testing/vsock: print list of options and description
>   vsock_test: add SOCK_STREAM MSG_PEEK test
>=20
>  tools/testing/vsock/.gitignore        |   1 +
>  tools/testing/vsock/Makefile          |   9 +-
>  tools/testing/vsock/README            |   3 +-
>  tools/testing/vsock/control.c         |  15 +-
>  tools/testing/vsock/control.h         |   2 +
>  tools/testing/vsock/timeout.h         |   1 +
>  tools/testing/vsock/util.c            | 376 +++++++++++++++++++++++++
>  tools/testing/vsock/util.h            |  49 ++++
>  tools/testing/vsock/vsock_diag_test.c | 202 ++++----------
>  tools/testing/vsock/vsock_test.c      | 379 ++++++++++++++++++++++++++
>  10 files changed, 883 insertions(+), 154 deletions(-)
>  create mode 100644 tools/testing/vsock/util.c
>  create mode 100644 tools/testing/vsock/util.h
>  create mode 100644 tools/testing/vsock/vsock_test.c
>=20
> --=20
> 2.24.1
>=20
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl37WtwACgkQnKSrs4Gr
c8ghowf8CLQjydPRjm3F7iQ8iS7EhFcrctrj96QbH/gFGwkxcSiXqC0mwtLprUzL
sbzvy6lfKd7nfmXz2O4fJkyKa3qF8/xm3j04fg+6m5WbLNtKMHGE9nyH0NUttTiH
chth84d78ZFP1m+KV0spdJQBoHFi3pHh3eZWdzNaEEkCdEU0sTI37W4CsJjBw1AF
PeJFTmO/sGi8c8f8lvBTb8TipXM7THMhr0O+ypUYXFBG6IuNXsKkXcPOjzd9qKFd
DGr/Ecd6BMIHdNjGgJ707hxsmOooJv9DT4MZQ58KcEzGR9fmtM+E4hnugMt40upL
3ysZQApGZuQOWqxa7oYNLe86Az04uw==
=JzCU
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

--===============5221010736501477228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5221010736501477228==--
