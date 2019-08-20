Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 195999599F
	for <lists.virtualization@lfdr.de>; Tue, 20 Aug 2019 10:32:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 129EED89;
	Tue, 20 Aug 2019 08:32:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E687ACBB
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 08:32:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9A20287
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 08:32:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E947B300CB24;
	Tue, 20 Aug 2019 08:32:04 +0000 (UTC)
Received: from localhost (ovpn-117-123.ams2.redhat.com [10.36.117.123])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63E448CBE6;
	Tue, 20 Aug 2019 08:32:04 +0000 (UTC)
Date: Tue, 20 Aug 2019 09:32:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 10/11] vsock_test: skip read() in test_stream*close
	tests on a VMCI host
Message-ID: <20190820083203.GB9855@stefanha-x1.localdomain>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-11-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190801152541.245833-11-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 20 Aug 2019 08:32:05 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============2223663232642248723=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============2223663232642248723==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 01, 2019 at 05:25:40PM +0200, Stefano Garzarella wrote:
> When VMCI transport is used, if the guest closes a connection,
> all data is gone and EOF is returned, so we should skip the read
> of data written by the peer before closing the connection.

All transports should aim for identical semantics.  I think virtio-vsock
should behave the same as VMCI since userspace applications should be
transport-independent.

Let's view this as a vsock bug.  Is it feasible to change the VMCI
behavior so it's more like TCP sockets?  If not, let's change the
virtio-vsock behavior to be compatible with VMCI.

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1bsAIACgkQnKSrs4Gr
c8iy2wf9Hf2RT30SVoJTzJ+hX0eVKck7gc8yFdT08PLyaZW9ND3d2J7oYGhT3/kF
3IneL017fwh3nVZ9rcWcVH2ntn7Mq8+I0mTBH24UP0UMLMz/Ieq/6oRj3ySm/UbA
7/RZHJ2+he0dBgOPggnmNBPDTqAytUBaDouuIWJiXYnVX8g82C1qhcckeuIrxbc5
5hQPmjQnSmRVcclubheU+QAqqQbAySFDYbJp36sRGiAyJR31vQJGQWqk+r0uZvlt
DT1YTMdU7EfmWoVp4nW2dDMnN+WlZA0qFZ2gv/7/ZiZ0etvXTPN8/owaW3HxTQOJ
PPVwBTXGU+LNuAHvJOt9METVQX4+oQ==
=YtHX
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--

--===============2223663232642248723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2223663232642248723==--
