Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EF54FAB611
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:36:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 365F71F12;
	Fri,  6 Sep 2019 10:36:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4A4161EF7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:36:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EFE61831
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AB56308A958;
	Fri,  6 Sep 2019 10:36:19 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22A5460605;
	Fri,  6 Sep 2019 10:36:13 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:36:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH 00/18] virtiofs: Fix various races and cleanups round 1
Message-ID: <20190906103613.GH5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<CAJfpegu8POz9gC4MDEcXxDWBD0giUNFgJhMEzntJX_u4+cS9Zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegu8POz9gC4MDEcXxDWBD0giUNFgJhMEzntJX_u4+cS9Zw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 06 Sep 2019 10:36:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	linux-kernel@vger.kernel.org, virtio-fs@redhat.com,
	linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Vivek Goyal <vgoyal@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============9157435429700023806=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============9157435429700023806==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Content-Disposition: inline


--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 10:15:14AM +0200, Miklos Szeredi wrote:
> On Thu, Sep 5, 2019 at 9:49 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > Hi,
> >
> > Michael Tsirkin pointed out issues w.r.t various locking related TODO
> > items and races w.r.t device removal.
> >
> > In this first round of cleanups, I have taken care of most pressing
> > issues.
> >
> > These patches apply on top of following.
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtiof=
s-v4
> >
> > I have tested these patches with mount/umount and device removal using
> > qemu monitor. For example.
>=20
> Is device removal mandatory?  Can't this be made a non-removable
> device?  Is there a good reason why removing the virtio-fs device
> makes sense?

Hot plugging and unplugging virtio PCI adapters is common.  I'd very
much like removal to work from the beginning.

Stefan

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yNpwACgkQnKSrs4Gr
c8hY9AgAmU3k7f2gZ5ko9Rvr8+tXDTSrw1Uakzbgk+pEb54Z2M4jFGJgWglMNfqa
4PI0iDsPz1ikbT9wOhko7AGyaeX1/EQqmXWdBGgCjXVBekhLsOR4dOl/y6Q/1eW1
fEQ5B/Ngl1Z5AbMZ5xwlYA89Iq4yZCVn8IbyhkreLZ8KHzMc6CnQkNEM8goE1HgO
oSiD15lf3RiiwQlYbBabMOc3nOlIqebZKyk2oizbPfQLC9/afkmPcPv+sZfTMMwW
LXa6ZV7ZHxi6sgQSPaN/yh9Ve+2NvMcyPPYyAZFduruK5C/Rkx+Er/uzXgPDQ4j3
57uYA27caA6arIq+CUvclGvmk2+ajA==
=Llfc
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--

--===============9157435429700023806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============9157435429700023806==--
