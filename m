Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA961440C0
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 16:44:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B7EE86092;
	Tue, 21 Jan 2020 15:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bY0ocscQxHHh; Tue, 21 Jan 2020 15:43:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E507865D0;
	Tue, 21 Jan 2020 15:43:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F5E6C0174;
	Tue, 21 Jan 2020 15:43:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F788C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 15:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 01AAC87535
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 15:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auuSU2tf3fwY
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 15:43:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4F89B86EA3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579621424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YcbauX61o7tWuEN+WbxCHxYsM/sg+0p71uHLTvabbzY=;
 b=OSIfEO2yeC5c7x5CQKfUhsay8HJRNteuOps/cci6FY4dEmM9q6axFx0Ajvoly5BUervHzO
 M+2vgik+of0mbaF0mLswLISTZu6CEwPw1TY8tnQ8IVjyz6whc2NyU87ZXQg9HuOMZD3bRH
 XxSanvKIP4qR1D6MD2gRq2qNRtMJzPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-LD4l0I28Mgquq2M4QBsksg-1; Tue, 21 Jan 2020 10:43:41 -0500
X-MC-Unique: LD4l0I28Mgquq2M4QBsksg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C413618FF667;
 Tue, 21 Jan 2020 15:43:39 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 186F210013A7;
 Tue, 21 Jan 2020 15:43:36 +0000 (UTC)
Date: Tue, 21 Jan 2020 15:43:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200121154335.GB641751@stefanha-x1.localdomain>
References: <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
 <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
 <20200120170120-mutt-send-email-mst@kernel.org>
 <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
 <20200121055403-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200121055403-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 netdev@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Miller <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============3479602614345979800=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3479602614345979800==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline

--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 06:14:48AM -0500, Michael S. Tsirkin wrote:
> On Tue, Jan 21, 2020 at 10:07:06AM +0100, Stefano Garzarella wrote:
> > On Mon, Jan 20, 2020 at 11:02 PM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> > > On Mon, Jan 20, 2020 at 05:53:39PM +0100, Stefano Garzarella wrote:
> > > > On Mon, Jan 20, 2020 at 5:04 PM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
> > > > > On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrot=
e:
> > > > > > On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > > > > > > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella =
wrote:
> > > > > > > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrot=
e:
> > > > > > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > > > > > > >
> > > > > > > > > > This patch adds 'netns' module param to enable this new=
 feature
> > > > > > > > > > (disabled by default), because it changes vsock's behav=
ior with
> > > > > > > > > > network namespaces and could break existing application=
s.
> > > > > > > > >
> > > > > > > > > Sorry, no.
> > > > > > > > >
> > > > > > > > > I wonder if you can even design a legitimate, reasonable,=
 use case
> > > > > > > > > where these netns changes could break things.
> > > > > > > >
> > > > > > > > I forgot to mention the use case.
> > > > > > > > I tried the RFC with Kata containers and we found that Kata=
 shim-v1
> > > > > > > > doesn't work (Kata shim-v2 works as is) because there are t=
he following
> > > > > > > > processes involved:
> > > > > > > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vs=
ock and
> > > > > > > >   passes it to qemu
> > > > > > > > - kata-shim (runs in a container) wants to talk with the gu=
est but the
> > > > > > > >   vsock device is assigned to the init_netns and kata-shim =
runs in a
> > > > > > > >   different netns, so the communication is not allowed
> > > > > > > > But, as you said, this could be a wrong design, indeed they=
 already
> > > > > > > > found a fix, but I was not sure if others could have the sa=
me issue.
> > > > > > > >
> > > > > > > > In this case, do you think it is acceptable to make this ch=
ange in
> > > > > > > > the vsock's behavior with netns and ask the user to change =
the design?
> > > > > > >
> > > > > > > David's question is what would be a usecase that's broken
> > > > > > > (as opposed to fixed) by enabling this by default.
> > > > > >
> > > > > > Yes, I got that. Thanks for clarifying.
> > > > > > I just reported a broken example that can be fixed with a diffe=
rent
> > > > > > design (due to the fact that before this series, vsock devices =
were
> > > > > > accessible to all netns).
> > > > > >
> > > > > > >
> > > > > > > If it does exist, you need a way for userspace to opt-in,
> > > > > > > module parameter isn't that.
> > > > > >
> > > > > > Okay, but I honestly can't find a case that can't be solved.
> > > > > > So I don't know whether to add an option (ioctl, sysfs ?) or wa=
it for
> > > > > > a real case to come up.
> > > > > >
> > > > > > I'll try to see better if there's any particular case where we =
need
> > > > > > to disable netns in vsock.
> > > > > >
> > > > > > Thanks,
> > > > > > Stefano
> > > > >
> > > > > Me neither. so what did you have in mind when you wrote:
> > > > > "could break existing applications"?
> > > >
> > > > I had in mind:
> > > > 1. the Kata case. It is fixable (the fix is not merged on kata), bu=
t
> > > >    older versions will not work with newer Linux.
> > >
> > > meaning they will keep not working, right?
> >=20
> > Right, I mean without this series they work, with this series they work
> > only if the netns support is disabled or with a patch proposed but not
> > merged in kata.
> >=20
> > >
> > > > 2. a single process running on init_netns that wants to communicate=
 with
> > > >    VMs handled by VMMs running in different netns, but this case ca=
n be
> > > >    solved opening the /dev/vhost-vsock in the same netns of the pro=
cess
> > > >    that wants to communicate with the VMs (init_netns in this case)=
, and
> > > >    passig it to the VMM.
> > >
> > > again right now they just don't work, right?
> >=20
> > Right, as above.
> >=20
> > What do you recommend I do?
> >=20
> > Thanks,
> > Stefano
>=20
> If this breaks userspace, then we need to maintain compatibility.
> For example, have two devices, /dev/vhost-vsock and /dev/vhost-vsock-netn=
s?

/dev/vhost-vsock-netns is cleaner and simpler than my suggestion.  I
like it!

This is nice for containers (say you want to run QEMU inside a container
on the host) because you can allow only /dev/vhost-vsock-netns inside
containers.  This prevents them from opening /dev/vhost-vsock to get
access to the initial network namespace.

Stefan

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4nHCcACgkQnKSrs4Gr
c8iOjAgArNIcauYKdihZzUB/8JJdrIjzQR0bQf9Ul7ERaBhxeb2+BSqx3L/DLkny
CYL7HXVrKVs+/OXf7pBdalE69qsOfDdBhDhEBOHI515awLF/7xJHwokchC5j/VQv
Wcvn9CS3zmks9ssJHRtIdraxTBxc04EAp5U+lDUxRLLjB4HcCLc+CwoS/RV75V92
3RzOQB4CMmV+4heL+gXh3e7UfvNLEfVyKyOYw8qj1yIAnFkv2Rd8pXxNfPTuH0ch
2iEJxQy8y8vIqEONnMeDMLWiAmssHjzujKry8UOZ+OdMLPSRLgc487jVvoH9UEQP
53GYRFwYtUGkG7An19ImstKXkcydcA==
=CVL/
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--


--===============3479602614345979800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3479602614345979800==--

