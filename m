Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B30143EBD
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 14:59:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF66981BD6;
	Tue, 21 Jan 2020 13:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEH36OeBb6HA; Tue, 21 Jan 2020 13:59:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C6FB981E6C;
	Tue, 21 Jan 2020 13:59:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E172C0174;
	Tue, 21 Jan 2020 13:59:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20D34C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A0CE204D9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXM0-T3DnfcI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:59:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C9FD2037A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579615157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CI31RgQa6K3M/cRgVFMidnl25FxGspPQSLhquDKpkG4=;
 b=gEXUjfvjsXoEuJvUNV+cATfP4kiZV6gevDUHTA19K+eZhyEMvNk+vsorO2cLXCRyAiI8BO
 zHA+5sPmTuz/Ox+fu8q0gXm8UNGWdkSIEQRDHjxAxKKrJkcdxyco3nvCuj+bpaQdWrfJz2
 dOjN/WcIRDzBWhtOO2DeMQyJrA+hurA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-pNVNfVZoP5yPDTX_pmGGAw-1; Tue, 21 Jan 2020 08:59:13 -0500
X-MC-Unique: pNVNfVZoP5yPDTX_pmGGAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11D596125D;
 Tue, 21 Jan 2020 13:59:12 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB35A8BE1E;
 Tue, 21 Jan 2020 13:59:08 +0000 (UTC)
Date: Tue, 21 Jan 2020 13:59:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200121135907.GA641751@stefanha-x1.localdomain>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
 <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
 <20200120170120-mutt-send-email-mst@kernel.org>
 <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, David Miller <davem@davemloft.net>,
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
Content-Type: multipart/mixed; boundary="===============3830273736315638954=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3830273736315638954==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 10:07:06AM +0100, Stefano Garzarella wrote:
> On Mon, Jan 20, 2020 at 11:02 PM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> > On Mon, Jan 20, 2020 at 05:53:39PM +0100, Stefano Garzarella wrote:
> > > On Mon, Jan 20, 2020 at 5:04 PM Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > > > On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrote:
> > > > > On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> > > > > > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wr=
ote:
> > > > > > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > > > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > > > > > >
> > > > > > > > > This patch adds 'netns' module param to enable this new f=
eature
> > > > > > > > > (disabled by default), because it changes vsock's behavio=
r with
> > > > > > > > > network namespaces and could break existing applications.
> > > > > > > >
> > > > > > > > Sorry, no.
> > > > > > > >
> > > > > > > > I wonder if you can even design a legitimate, reasonable, u=
se case
> > > > > > > > where these netns changes could break things.
> > > > > > >
> > > > > > > I forgot to mention the use case.
> > > > > > > I tried the RFC with Kata containers and we found that Kata s=
him-v1
> > > > > > > doesn't work (Kata shim-v2 works as is) because there are the=
 following
> > > > > > > processes involved:
> > > > > > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsoc=
k and
> > > > > > >   passes it to qemu
> > > > > > > - kata-shim (runs in a container) wants to talk with the gues=
t but the
> > > > > > >   vsock device is assigned to the init_netns and kata-shim ru=
ns in a
> > > > > > >   different netns, so the communication is not allowed
> > > > > > > But, as you said, this could be a wrong design, indeed they a=
lready
> > > > > > > found a fix, but I was not sure if others could have the same=
 issue.
> > > > > > >
> > > > > > > In this case, do you think it is acceptable to make this chan=
ge in
> > > > > > > the vsock's behavior with netns and ask the user to change th=
e design?
> > > > > >
> > > > > > David's question is what would be a usecase that's broken
> > > > > > (as opposed to fixed) by enabling this by default.
> > > > >
> > > > > Yes, I got that. Thanks for clarifying.
> > > > > I just reported a broken example that can be fixed with a differe=
nt
> > > > > design (due to the fact that before this series, vsock devices we=
re
> > > > > accessible to all netns).
> > > > >
> > > > > >
> > > > > > If it does exist, you need a way for userspace to opt-in,
> > > > > > module parameter isn't that.
> > > > >
> > > > > Okay, but I honestly can't find a case that can't be solved.
> > > > > So I don't know whether to add an option (ioctl, sysfs ?) or wait=
 for
> > > > > a real case to come up.
> > > > >
> > > > > I'll try to see better if there's any particular case where we ne=
ed
> > > > > to disable netns in vsock.
> > > > >
> > > > > Thanks,
> > > > > Stefano
> > > >
> > > > Me neither. so what did you have in mind when you wrote:
> > > > "could break existing applications"?
> > >
> > > I had in mind:
> > > 1. the Kata case. It is fixable (the fix is not merged on kata), but
> > >    older versions will not work with newer Linux.
> >
> > meaning they will keep not working, right?
>=20
> Right, I mean without this series they work, with this series they work
> only if the netns support is disabled or with a patch proposed but not
> merged in kata.
>=20
> >
> > > 2. a single process running on init_netns that wants to communicate w=
ith
> > >    VMs handled by VMMs running in different netns, but this case can =
be
> > >    solved opening the /dev/vhost-vsock in the same netns of the proce=
ss
> > >    that wants to communicate with the VMs (init_netns in this case), =
and
> > >    passig it to the VMM.
> >
> > again right now they just don't work, right?
>=20
> Right, as above.
>=20
> What do you recommend I do?

Existing userspace applications must continue to work.

Guests are fine because G2H transports are always in the initial network
namespace.

On the host side we have a real case where Kata Containers and other
vsock users break.  Existing applications run in other network
namespaces and assume they can communicate over vsock (it's only
available in the initial network namespace by default).

It seems we cannot isolate new network namespaces from the initial
network namespace by default because it will break existing
applications.  That's a bummer.

There is one solution that maintains compatibility:

Introduce a per-namespace vsock isolation flag that can only transition
from false to true.  Once it becomes true it cannot be reset to false
anymore (for security).

When vsock isolation is false the initial network namespace is used for
<CID, port> addressing.

When vsock isolation is true the current namespace is used for <CID,
port> addressing.

I guess the vsock isolation flag would be set via a rtnetlink message,
but I haven't checked.

The upshot is: existing software doesn't benefit from namespaces for
vsock isolation but it continues to work!  New software makes 1 special
call after creating the namespace to opt in to vsock isolation.

This approach is secure because whoever sets up namespaces can
transition the flag from false to true and know that it can never be
reset to false anymore.

Does this make sense to everyone?

Stefan

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4nA6sACgkQnKSrs4Gr
c8jNpAf/QU3r0K8eFwijfWx3t+0myCLkBJ2BerQqOfsFDij7R8uOJSEfhtDAt4Ob
r8Eh3afoZxGDv8BncT8HgLViON6XgFiN6HdZF/491+EOpYhsi91cmQowZqMN1HN9
edEiDoc1N0Jc+f8LHok5nKiWZvH0m8tPJ57bxwMAecBKMc61AmRo1UqtXFTvIW4T
vbRGjVdNGxRUxBbV2yStk9WGmEq8Jl5Rw8TqKdy1idCdWtwHAhi4EihI5/cyKK9R
YlVti1NK5hwYXbFXluZxUZXr3cIPUvA4GeyMbBMUVbeBzp2KPFGJfbR6hvPJ4gDW
FjgfDdsn+rqWe6CbRtRuExcBmC9cQg==
=pP6n
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--


--===============3830273736315638954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3830273736315638954==--

