Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15D2CA34A
	for <lists.virtualization@lfdr.de>; Tue,  1 Dec 2020 13:59:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3DDFA86C5D;
	Tue,  1 Dec 2020 12:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSnL1rjMq3ZQ; Tue,  1 Dec 2020 12:59:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 73EDF86BF2;
	Tue,  1 Dec 2020 12:59:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BE50C0859;
	Tue,  1 Dec 2020 12:59:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB5C3C0859
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 12:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E5BCF87720
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 12:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCLaAo191eZ6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 12:59:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BEDD987666
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606827589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y0fFNDxGbQNOcsUGaCDG6x16itFRDEvyd8G3CtWJQeY=;
 b=io0lvFERhTqP5Yue456HpSaviXdzCGx2U6Gfr3xjCQVImIxQ5mNewoyC4uQIyJW6Sk6RFd
 lKIB1Yu7iCWG0XiVR64YD2s0HnNuWq12/6Ci3Bge5BEDzFVpLBT7UXVmnD8iIDsCRPeZ2w
 FsM355nQw+qeXAmtXYmZKsTfuxfy5xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-9D66DZ3WO26x0-ajTcL9ug-1; Tue, 01 Dec 2020 07:59:46 -0500
X-MC-Unique: 9D66DZ3WO26x0-ajTcL9ug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FC60800D53;
 Tue,  1 Dec 2020 12:59:45 +0000 (UTC)
Received: from localhost (ovpn-114-82.ams2.redhat.com [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 965BD5D6AB;
 Tue,  1 Dec 2020 12:59:44 +0000 (UTC)
Date: Tue, 1 Dec 2020 12:59:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201201125943.GE585157@stefanha-x1.localdomain>
References: <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118113117.GF182763@stefanha-x1.localdomain>
 <20201119094315-mutt-send-email-mst@kernel.org>
 <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
 <CAJSP0QUvSwX5NCPmfSODV_C+D41E21LZT=oXQ2PLc6baAsGGDQ@mail.gmail.com>
 <ffd88f0c-981e-a102-4b08-f29d6b9a0f71@oracle.com>
 <CAJSP0QUfqd=QNFa-RikH4dVcLmfcP-pYCwznP3W0zobYkM+KDw@mail.gmail.com>
 <CAJSP0QVu4P6c+kdFkhw1S_OEaj7B-eiDqFOVDxWAaSOcsAADrA@mail.gmail.com>
 <20201120072802-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201120072802-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: fam <fam@euphon.net>, linux-scsi <linux-scsi@vger.kernel.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 target-devel <target-devel@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============9009565832795677795=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============9009565832795677795==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline

--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:31:08AM -0500, Michael S. Tsirkin wrote:
> On Fri, Nov 20, 2020 at 08:45:49AM +0000, Stefan Hajnoczi wrote:
> > On Thu, Nov 19, 2020 at 5:08 PM Stefan Hajnoczi <stefanha@gmail.com> wr=
ote:
> > >
> > > On Thu, Nov 19, 2020 at 4:43 PM Mike Christie
> > > <michael.christie@oracle.com> wrote:
> > > >
> > > > On 11/19/20 10:24 AM, Stefan Hajnoczi wrote:
> > > > > On Thu, Nov 19, 2020 at 4:13 PM Mike Christie
> > > > > <michael.christie@oracle.com> wrote:
> > > > >>
> > > > >> On 11/19/20 8:46 AM, Michael S. Tsirkin wrote:
> > > > >>> On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi wrote=
:
> > > > > struct vhost_run_worker_info {
> > > > >      struct timespec *timeout;
> > > > >      sigset_t *sigmask;
> > > > >
> > > > >      /* List of virtqueues to process */
> > > > >      unsigned nvqs;
> > > > >      unsigned vqs[];
> > > > > };
> > > > >
> > > > > /* This blocks until the timeout is reached, a signal is received=
, or
> > > > > the vhost device is destroyed */
> > > > > int ret =3D ioctl(vhost_fd, VHOST_RUN_WORKER, &info);
> > > > >
> > > > > As you can see, userspace isn't involved with dealing with the
> > > > > requests. It just acts as a thread donor to the vhost driver.
> > > > >
> > > > > We would want the VHOST_RUN_WORKER calls to be infrequent to avoi=
d the
> > > > > penalty of switching into the kernel, copying in the arguments, e=
tc.
> > > >
> > > > I didn't get this part. Why have the timeout? When the timeout expi=
res,
> > > > does userspace just call right back down to the kernel or does it d=
o
> > > > some sort of processing/operation?
> > > >
> > > > You could have your worker function run from that ioctl wait for a
> > > > signal or a wake up call from the vhost_work/poll functions.
> > >
> > > An optional timeout argument is common in blocking interfaces like
> > > poll(2), recvmmsg(2), etc.
> > >
> > > Although something can send a signal to the thread instead,
> > > implementing that in an application is more awkward than passing a
> > > struct timespec.
> > >
> > > Compared to other blocking calls we don't expect
> > > ioctl(VHOST_RUN_WORKER) to return soon, so maybe the timeout will
> > > rarely be used and can be dropped from the interface.
> > >
> > > BTW the code I posted wasn't a carefully thought out proposal :). The
> > > details still need to be considered and I'm going to be offline for
> > > the next week so maybe someone else can think it through in the
> > > meantime.
> >=20
> > One final thought before I'm offline for a week. If
> > ioctl(VHOST_RUN_WORKER) is specific to a single vhost device instance
> > then it's hard to support poll-mode (busy waiting) workers because
> > each device instance consumes a whole CPU. If we stick to an interface
> > where the kernel manages the worker threads then it's easier to share
> > workers between devices for polling.
>=20
>=20
> Yes that is the reason vhost did its own reason in the first place.
>=20
>=20
> I am vaguely thinking about poll(2) or a similar interface,
> which can wait for an event on multiple FDs.

I can imagine how using poll(2) would work from a userspace perspective,
but on the kernel side I don't think it can be implemented cleanly.
poll(2) is tied to the file_operations->poll() callback and
read/write/error events. Not to mention there isn't a way to substitue
the vhost worker thread function instead of scheduling out the current
thread while waiting for poll fd events.

But maybe ioctl(VHOST_WORKER_RUN) can do it:

  struct vhost_run_worker_dev {
      int vhostfd;      /* /dev/vhost-TYPE fd */
      unsigned nvqs;    /* number of virtqueues in vqs[] */
      unsigned vqs[];   /* virtqueues to process */
  };

  struct vhost_run_worker_info {
       struct timespec *timeout;
       sigset_t *sigmask;

       unsigned ndevices;
       struct vhost_run_worker_dev *devices[];
  };

In the simple case userspace sets ndevices to 1 and we just handle
virtqueues for the current device.

In the fancier shared worker thread case the userspace process has the
vhost fds of all the devices it is processing and passes them to
ioctl(VHOST_WORKER_RUN) via struct vhost_run_worker_dev elements.

From a security perspective it means the userspace thread has access to
all vhost devices (because it has their fds).

I'm not sure how the mm is supposed to work. The devices might be
associated with different userspace processes (guests) and therefore
have different virtual memory.

Just wanted to push this discussion along a little further. I'm buried
under emails and probably wont be very active over the next few days.

Stefan

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/GPj8ACgkQnKSrs4Gr
c8g9UAf/Qor9MVeSJMu8Q5hSTOXxx74/+SFNAXBVf1tTx1aGgpJ+CNftEcU3Xfgr
iivW/d6OvJ8GmHwgnyJWSS1v9xfUnRTzXDL5YLOl/83NLXu3blxk0uKktWqQ7Ddw
6jU/TZY6ECdFSXvZp3vTShNWDVyBvlFUiVvOapacS+REKPrEyLONQkHgjLn+M301
FdU79eYtPx9oGpMNYlIOZ6aw7NYZQ8UfUlL4QnA/qnTh+/1fvUuPugGxvMGuPwe7
u00eDVlluvcxLhAkte9OPGq4aSif5Zx5zqNntJU2H66skeiB01eV3KGsYwFDnePu
Nu/pwCfxOiRCDGZUxj/6jLejURcr1g==
=oHMn
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--


--===============9009565832795677795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============9009565832795677795==--

