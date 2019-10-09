Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF4D123B
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 17:15:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B5499FAB;
	Wed,  9 Oct 2019 15:15:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13328F9B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 15:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B23105D3
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 15:15:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C35D3084032;
	Wed,  9 Oct 2019 15:15:08 +0000 (UTC)
Received: from localhost (ovpn-116-110.ams2.redhat.com [10.36.116.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 649F960167;
	Wed,  9 Oct 2019 15:15:05 +0000 (UTC)
Date: Wed, 9 Oct 2019 16:15:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 07/11] VSOCK: add AF_VSOCK test cases
Message-ID: <20191009151503.GA13568@stefanha-x1.localdomain>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-8-sgarzare@redhat.com>
	<CAGxU2F4N5ACePf6YLQCBFMHPu8wDLScF+AGQ2==JAuBUj0GB-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F4N5ACePf6YLQCBFMHPu8wDLScF+AGQ2==JAuBUj0GB-A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 09 Oct 2019 15:15:08 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm <kvm@vger.kernel.org>, netdev@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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
Content-Type: multipart/mixed; boundary="===============1999454677069219780=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1999454677069219780==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2019 at 12:03:53PM +0200, Stefano Garzarella wrote:
> Hi Stefan,
> I'm thinking about dividing this test into single applications, one
> for each test, do you think it makes sense?
> Or is it just a useless complication?

I don't mind either way but personally I would leave it as a single
program.

Stefan

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d+XcACgkQnKSrs4Gr
c8iLyQf/Zhb+RZJm3omrM8JeMvDADeG1HsilYyQHLlWrpKPJHyQVtNqGNx9bJxd+
Eq68BTkMmICqtmYwilCPPVlrx8et8zehRq871XzI6O/sXIme49zDJ056dPX1R1Gb
+HAyhD9QD3YqFicOy1eA7YAtT8/VsQdXMQTUVkwcv/Nzi37O0xyd7KVV0TJvBVka
0NwoQYWegJqj48HghPtJrhr6xjOjj2xbBgW2AI9SFwSYNW9asQeEgfWbYAZZU/Ri
Q2/xQjZbaaEKRhiIw+WoWJ4eXSZXzAzqh4cnyHVvJnoyLnO0Ed7qEUf4tcwFS1Eu
KaaYezbOhj4tIKbacDvJ5+HM6M2QYA==
=fCBd
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

--===============1999454677069219780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1999454677069219780==--
