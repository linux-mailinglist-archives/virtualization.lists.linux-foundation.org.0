Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C86B2CA9F9
	for <lists.virtualization@lfdr.de>; Tue,  1 Dec 2020 18:44:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4B95D203B4;
	Tue,  1 Dec 2020 17:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YoUoQUUzNZEp; Tue,  1 Dec 2020 17:43:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 70C6B228AE;
	Tue,  1 Dec 2020 17:43:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA09C0052;
	Tue,  1 Dec 2020 17:43:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A697FC0052
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 17:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 69C1D20449
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 17:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrniCHbf5o2z
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 17:43:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 7FD8E203B4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 17:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606844632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=knIDZSVvEYg05Fp1QEgiwa+zurWE4bXcDiX5a26vU3s=;
 b=ZZYkK71UC6b176yjXYi6oQcCT7Wz5XlVszI3DGmi7xhtD5cxX9tp3DPA1PaT2YtOgoVl6d
 V4ACjFjxybmfNiSmLMRW42Cm3pBDXWRe/NGTUo+KffMns7q8cfEqSV6j4bb4vBmUxgRaBv
 WzEoRQ1NLBXJfkI1o2U9slYNWVIVo9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-KXv7Gs4cP82CK0P_xSKa6g-1; Tue, 01 Dec 2020 12:43:48 -0500
X-MC-Unique: KXv7Gs4cP82CK0P_xSKa6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 425C61842164;
 Tue,  1 Dec 2020 17:43:46 +0000 (UTC)
Received: from localhost (ovpn-114-82.ams2.redhat.com [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58BDC5C1B4;
 Tue,  1 Dec 2020 17:43:39 +0000 (UTC)
Date: Tue, 1 Dec 2020 17:43:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201201174338.GB595829@stefanha-x1.localdomain>
References: <20201118113117.GF182763@stefanha-x1.localdomain>
 <20201119094315-mutt-send-email-mst@kernel.org>
 <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
 <CAJSP0QUvSwX5NCPmfSODV_C+D41E21LZT=oXQ2PLc6baAsGGDQ@mail.gmail.com>
 <ffd88f0c-981e-a102-4b08-f29d6b9a0f71@oracle.com>
 <CAJSP0QUfqd=QNFa-RikH4dVcLmfcP-pYCwznP3W0zobYkM+KDw@mail.gmail.com>
 <CAJSP0QVu4P6c+kdFkhw1S_OEaj7B-eiDqFOVDxWAaSOcsAADrA@mail.gmail.com>
 <20201120072802-mutt-send-email-mst@kernel.org>
 <20201201125943.GE585157@stefanha-x1.localdomain>
 <20201201134518.pwrggkmixpyro4sg@steredhat>
MIME-Version: 1.0
In-Reply-To: <20201201134518.pwrggkmixpyro4sg@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: fam <fam@euphon.net>, linux-scsi <linux-scsi@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
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
Content-Type: multipart/mixed; boundary="===============3918954081615172418=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3918954081615172418==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline

--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 02:45:18PM +0100, Stefano Garzarella wrote:
> On Tue, Dec 01, 2020 at 12:59:43PM +0000, Stefan Hajnoczi wrote:
> > On Fri, Nov 20, 2020 at 07:31:08AM -0500, Michael S. Tsirkin wrote:
> > > On Fri, Nov 20, 2020 at 08:45:49AM +0000, Stefan Hajnoczi wrote:
> > > > On Thu, Nov 19, 2020 at 5:08 PM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
> > > > >
> > > > > On Thu, Nov 19, 2020 at 4:43 PM Mike Christie
> > > > > <michael.christie@oracle.com> wrote:
> > > > > >
> > > > > > On 11/19/20 10:24 AM, Stefan Hajnoczi wrote:
> > > > > > > On Thu, Nov 19, 2020 at 4:13 PM Mike Christie
> > > > > > > <michael.christie@oracle.com> wrote:
> > > > > > >>
> > > > > > >> On 11/19/20 8:46 AM, Michael S. Tsirkin wrote:
> > > > > > >>> On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi w=
rote:
> > > > > > > struct vhost_run_worker_info {
> > > > > > >      struct timespec *timeout;
> > > > > > >      sigset_t *sigmask;
> > > > > > >
> > > > > > >      /* List of virtqueues to process */
> > > > > > >      unsigned nvqs;
> > > > > > >      unsigned vqs[];
> > > > > > > };
> > > > > > >
> > > > > > > /* This blocks until the timeout is reached, a signal is rece=
ived, or
> > > > > > > the vhost device is destroyed */
> > > > > > > int ret =3D ioctl(vhost_fd, VHOST_RUN_WORKER, &info);
> > > > > > >
> > > > > > > As you can see, userspace isn't involved with dealing with th=
e
> > > > > > > requests. It just acts as a thread donor to the vhost driver.
> > > > > > >
> > > > > > > We would want the VHOST_RUN_WORKER calls to be infrequent to =
avoid the
> > > > > > > penalty of switching into the kernel, copying in the argument=
s, etc.
> > > > > >
> > > > > > I didn't get this part. Why have the timeout? When the timeout =
expires,
> > > > > > does userspace just call right back down to the kernel or does =
it do
> > > > > > some sort of processing/operation?
> > > > > >
> > > > > > You could have your worker function run from that ioctl wait fo=
r a
> > > > > > signal or a wake up call from the vhost_work/poll functions.
> > > > >
> > > > > An optional timeout argument is common in blocking interfaces lik=
e
> > > > > poll(2), recvmmsg(2), etc.
> > > > >
> > > > > Although something can send a signal to the thread instead,
> > > > > implementing that in an application is more awkward than passing =
a
> > > > > struct timespec.
> > > > >
> > > > > Compared to other blocking calls we don't expect
> > > > > ioctl(VHOST_RUN_WORKER) to return soon, so maybe the timeout will
> > > > > rarely be used and can be dropped from the interface.
> > > > >
> > > > > BTW the code I posted wasn't a carefully thought out proposal :).=
 The
> > > > > details still need to be considered and I'm going to be offline f=
or
> > > > > the next week so maybe someone else can think it through in the
> > > > > meantime.
> > > >
> > > > One final thought before I'm offline for a week. If
> > > > ioctl(VHOST_RUN_WORKER) is specific to a single vhost device instan=
ce
> > > > then it's hard to support poll-mode (busy waiting) workers because
> > > > each device instance consumes a whole CPU. If we stick to an interf=
ace
> > > > where the kernel manages the worker threads then it's easier to sha=
re
> > > > workers between devices for polling.
> > >=20
> > >=20
> > > Yes that is the reason vhost did its own reason in the first place.
> > >=20
> > >=20
> > > I am vaguely thinking about poll(2) or a similar interface,
> > > which can wait for an event on multiple FDs.
> >=20
> > I can imagine how using poll(2) would work from a userspace perspective=
,
> > but on the kernel side I don't think it can be implemented cleanly.
> > poll(2) is tied to the file_operations->poll() callback and
> > read/write/error events. Not to mention there isn't a way to substitue
> > the vhost worker thread function instead of scheduling out the current
> > thread while waiting for poll fd events.
> >=20
> > But maybe ioctl(VHOST_WORKER_RUN) can do it:
> >=20
> >  struct vhost_run_worker_dev {
> >      int vhostfd;      /* /dev/vhost-TYPE fd */
> >      unsigned nvqs;    /* number of virtqueues in vqs[] */
> >      unsigned vqs[];   /* virtqueues to process */
> >  };
> >=20
> >  struct vhost_run_worker_info {
> >       struct timespec *timeout;
> >       sigset_t *sigmask;
> >=20
> >       unsigned ndevices;
> >       struct vhost_run_worker_dev *devices[];
> >  };
> >=20
> > In the simple case userspace sets ndevices to 1 and we just handle
> > virtqueues for the current device.
> >=20
> > In the fancier shared worker thread case the userspace process has the
> > vhost fds of all the devices it is processing and passes them to
> > ioctl(VHOST_WORKER_RUN) via struct vhost_run_worker_dev elements.
>=20
> Which fd will be used for this IOCTL? One of the 'vhostfd' or we should
> create a new /dev/vhost-workers (or something similar)?
>=20
> Maybe the new device will be cleaner and can be reused also for other stu=
ff
> (I'm thinking about vDPA software devices).
>=20
> >=20
> > From a security perspective it means the userspace thread has access to
> > all vhost devices (because it has their fds).
> >=20
> > I'm not sure how the mm is supposed to work. The devices might be
> > associated with different userspace processes (guests) and therefore
> > have different virtual memory.
>=20
> Maybe in this case we should do something similar to io_uring SQPOLL kthr=
ead
> where kthread_use_mm()/kthread_unuse_mm() is used to switch virtual memor=
y
> spaces.
>=20
> After writing, I saw that we already do it this in the vhost_worker() in
> drivers/vhost/vhost.c
>=20
> >=20
> > Just wanted to push this discussion along a little further. I'm buried
> > under emails and probably wont be very active over the next few days.
> >=20
>=20
> I think ioctl(VHOST_WORKER_RUN) might be the right way and also maybe the
> least difficult one.

Sending an ioctl API proposal email could help progress this discussion.

Interesting questions:
1. How to specify which virtqueues to process (Mike's use case)?
2. How to process multiple devices?

Stefan

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/GgMoACgkQnKSrs4Gr
c8hCoQf/SoerwKarSrCbMrILigfYpuYZc5i96I08ZMQHTdP2+lpWd0bn+y5JglIl
dkket7paJtwxqGLPtyH3TZW3iO608L3tci9Mx/+tUBZLUBipTI9KqMPoseUvS/bQ
kyBs7NFFuaLK+XUmaEy73JMY8dU6c/Xl9PC8F1j4FK6Yx+U25bK4M5cSzyZzR/T3
AyroUbt9e9cu6e41wsgCMhQYzXG0rT6V+KUJBhtOWTZ8Oa1AFyiX1SoIaAWUfcgi
b+RHSUhamjv87mb7jivsB/XFKDcyceL2LuRcL68UIlXt8rsZDGRmYCpHln9QMPIy
fFXgjie3aGN5eVISirSwGny2nFGUfg==
=jWcN
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--


--===============3918954081615172418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3918954081615172418==--

