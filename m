Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5EEB0094
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 17:52:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7A00CD8C;
	Wed, 11 Sep 2019 15:52:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF264CD1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 15:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7507B8A2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 15:52:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7E671918644;
	Wed, 11 Sep 2019 15:52:12 +0000 (UTC)
Received: from localhost (ovpn-116-185.ams2.redhat.com [10.36.116.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C4A860BEC;
	Wed, 11 Sep 2019 15:52:10 +0000 (UTC)
Date: Wed, 11 Sep 2019 17:52:08 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH v5 0/4] virtio-fs: shared file system for virtual machines
Message-ID: <20190911155208.GA20527@stefanha-x1.localdomain>
References: <20190910151206.4671-1-mszeredi@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190910151206.4671-1-mszeredi@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Wed, 11 Sep 2019 15:52:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============7373355730591513927=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7373355730591513927==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2019 at 05:12:02PM +0200, Miklos Szeredi wrote:
> I've folded the series from Vivek and fixed a couple of TODO comments
> myself.  AFAICS two issues remain that need to be resolved in the short
> term, one way or the other: freeze/restore and full virtqueue.

I have researched freeze/restore and come to the conclusion that it
needs to be a future feature.  It will probably come together with live
migration support for reasons mentioned below.

Most virtio devices have fairly simply power management freeze/restore
functions that shut down the device and bring it back to the state held
in memory, respectively.  virtio-fs, as well as virtio-9p and
virtio-gpu, are different because they contain session state.  It is not
easily possible to bring back the state held in memory after the device
has been reset.

The following areas of the FUSE protocol are stateful and need special
attention:

 * FUSE_INIT - this is pretty easy, we must re-negotiate the same
   settings as before.

 * FUSE_LOOKUP -> fuse_inode (inode_map)

   The session contains a set of inode numbers that have been looked up
   using FUSE_LOOKUP.  They are ephemeral in the current virtiofsd
   implementation and vary across device reset.  Therefore we are unable
   to restore the same inode numbers upon restore.

   The solution is persistent inode numbers in virtiofsd.  This is also
   needed to make open_by_handle_at(2) work and probably for live
   migration.

 * FUSE_OPEN -> fh (fd_map)

   The session contains FUSE file handles for open files.  There is
   currently no way of re-opening a file so that a specific fh is
   returned.  A mechanism to do so probably isn't necessary if the
   driver can update the fh to the new one produced by the device for
   all open files instead.

 * FUSE_OPENDIR -> fh (dirp_map)

   Same story as for FUSE_OPEN but for open directories.

 * FUSE_GETLK/SETLK/SETLKW -> (inode->posix_locks and fcntl(F_OFD_GET/SETLK))

   The session contains file locks.  The driver must reacquire them upon
   restore.  It's unclear what to do when locking fails.

Live migration has the same problem since the FUSE session will be moved
to a new virtio-fs device instance.  It makes sense to tackle both
features together.  This is something that can be implemented in the
next year, but it's not a quick fix.

Stefan

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl15GCgACgkQnKSrs4Gr
c8igAgf/aNAbXEnx1hxe1ARrpZRbdhkuuHJ/eV/iEWLUuRcNmDT2c7mrvoekWt5L
j6w1ePRZfFn0FEZrpLNo45HfKfnfPwazWm7NTi1vlz2EdrRXKibFEjMwqZuFlkSO
iVIpS5k3LHEk2P587Kye/Tek1JnevDKOOCZB1PIpxuQ3aRZXZKcYmWECp5dC+hR1
PGt2w5O9L4qbiAFF32Gn5Y4DWxi3N+p6dcdtH09Zlh8AONhiH/z8rag5ZPQaMWhS
HcWhqpxgBo3MHs0Da+PrWZ8U81DmuRXirLYcr5HaeDqM7mMow2hxF12KWiZ/ovP2
7mjCdT/9OGlWNyES9XYexdsEM4fsyw==
=41cO
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============7373355730591513927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7373355730591513927==--
