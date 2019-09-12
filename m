Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0AB0F2F
	for <lists.virtualization@lfdr.de>; Thu, 12 Sep 2019 14:54:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B5B16DD1;
	Thu, 12 Sep 2019 12:54:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7597FDC3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 12:54:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EEF906D6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 12:54:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E2ED3086268;
	Thu, 12 Sep 2019 12:54:29 +0000 (UTC)
Received: from localhost (ovpn-117-48.ams2.redhat.com [10.36.117.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E166360872;
	Thu, 12 Sep 2019 12:54:25 +0000 (UTC)
Date: Thu, 12 Sep 2019 14:54:24 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v5 0/4] virtio-fs: shared file system for virtual machines
Message-ID: <20190912125424.GJ23174@stefanha-x1.localdomain>
References: <20190910151206.4671-1-mszeredi@redhat.com>
	<20190911155208.GA20527@stefanha-x1.localdomain>
	<CAJfpegsorJKWoqRyThCfgLUyXiK7TLjSwmh5DqC8cytYRE4TLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegsorJKWoqRyThCfgLUyXiK7TLjSwmh5DqC8cytYRE4TLw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 12 Sep 2019 12:54:29 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miklos Szeredi <mszeredi@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	linux-fsdevel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============5891154452580641305=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============5891154452580641305==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Content-Disposition: inline


--enLffk0M6cffIOOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2019 at 10:14:11AM +0200, Miklos Szeredi wrote:
> On Wed, Sep 11, 2019 at 5:54 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Sep 10, 2019 at 05:12:02PM +0200, Miklos Szeredi wrote:
> > > I've folded the series from Vivek and fixed a couple of TODO comments
> > > myself.  AFAICS two issues remain that need to be resolved in the sho=
rt
> > > term, one way or the other: freeze/restore and full virtqueue.
> >
> > I have researched freeze/restore and come to the conclusion that it
> > needs to be a future feature.  It will probably come together with live
> > migration support for reasons mentioned below.
> >
> > Most virtio devices have fairly simply power management freeze/restore
> > functions that shut down the device and bring it back to the state held
> > in memory, respectively.  virtio-fs, as well as virtio-9p and
> > virtio-gpu, are different because they contain session state.  It is not
> > easily possible to bring back the state held in memory after the device
> > has been reset.
> >
> > The following areas of the FUSE protocol are stateful and need special
> > attention:
> >
> >  * FUSE_INIT - this is pretty easy, we must re-negotiate the same
> >    settings as before.
> >
> >  * FUSE_LOOKUP -> fuse_inode (inode_map)
> >
> >    The session contains a set of inode numbers that have been looked up
> >    using FUSE_LOOKUP.  They are ephemeral in the current virtiofsd
> >    implementation and vary across device reset.  Therefore we are unable
> >    to restore the same inode numbers upon restore.
> >
> >    The solution is persistent inode numbers in virtiofsd.  This is also
> >    needed to make open_by_handle_at(2) work and probably for live
> >    migration.
> >
> >  * FUSE_OPEN -> fh (fd_map)
> >
> >    The session contains FUSE file handles for open files.  There is
> >    currently no way of re-opening a file so that a specific fh is
> >    returned.  A mechanism to do so probably isn't necessary if the
> >    driver can update the fh to the new one produced by the device for
> >    all open files instead.
> >
> >  * FUSE_OPENDIR -> fh (dirp_map)
> >
> >    Same story as for FUSE_OPEN but for open directories.
> >
> >  * FUSE_GETLK/SETLK/SETLKW -> (inode->posix_locks and fcntl(F_OFD_GET/S=
ETLK))
> >
> >    The session contains file locks.  The driver must reacquire them upon
> >    restore.  It's unclear what to do when locking fails.
> >
> > Live migration has the same problem since the FUSE session will be moved
> > to a new virtio-fs device instance.  It makes sense to tackle both
> > features together.  This is something that can be implemented in the
> > next year, but it's not a quick fix.
>=20
> Right.   The question for now is: should the freeze silently succeed
> (as it seems to do now) or should it fail instead?
>=20
> I guess normally freezing should be okay, as long as the virtiofsd
> remains connected while the system is frozen.
>=20
> I tried to test this with "echo -n mem > /sys/power/state", which
> indeed resulted in the virtio_fs_freeze() callback being called.
> However, I couldn't find a way to wake up the system...

The issue occurs only on restore.  The core virtio driver code resets
the device so we lose state and cannot resume.

virtio-9p and virtio-gpu do not implement the .freeze() callback but
this is problematic since the system will think freeze succeeded.  It's
safer for virtio-fs to implement .freeze() and return -EOPNOTSUPP.

Can you squash in a trivial return -EOPNOTSUPP .freeze() function?

Thanks,
Stefan

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl16QAAACgkQnKSrs4Gr
c8iYdwgAtJZR/J/qxKfNWszL8WnMCpXEoyha8KLXO+gFkX9epTv24eyJTGheEWDg
9tA4iT/hUGGxFYChgYOOHIpLnhxZ5XE5qzyFjN0ay41bzW6vbbmq5NWqoHWxxQpg
/MtHKo3wfpDMbQ/9eSbBhkTB+Gny48m+jlbZV7wb/m+NEgbnadsMsNcNyKvcW3+5
DDcb9iPneUBOjtGtsjHcqu8ndAx5BA6sxHjcOe1+15a+atO1D+JQ2kF1l3dQ7tVW
qr1vYHFNnxx5x39w5tJIwCX9j8xEb6bZxIch+ZRSldISL7XmXsyENAz65g0rznRc
JfKoEsUB+ahS1/cxtFcs1gPtKM2vuQ==
=Q8Sr
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--

--===============5891154452580641305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5891154452580641305==--
