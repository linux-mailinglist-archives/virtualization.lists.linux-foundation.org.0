Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E61068D1
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 10:26:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB38687FE8;
	Fri, 22 Nov 2019 09:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qI0-Orz60kd3; Fri, 22 Nov 2019 09:25:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 915D987FC1;
	Fri, 22 Nov 2019 09:25:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DD07C18DA;
	Fri, 22 Nov 2019 09:25:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2726EC18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 09:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0CB7A889C8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 09:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hl4s2Eb65mCw
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 09:25:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0FBA88895B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574414753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NQ5wfa2k/ZGh4tRlMZlUTAY+jcVvzWiqwqcMi1NaDLQ=;
 b=B62s9SHUvoqPoLcWIXbiT4r3I6/nHEA9YBdgVHlwN5gxUgUv8gReP1/zR42LQhfr5++8ml
 YON8fzyUqOlwUvB2t1H+UqROn9Y5NEiMN/YV0NLz4aUr2m2snuT7DX+w0NPxxkB0wQ31+7
 EAY30p2aFg2pfVeluUTBUKkK7PCKHbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-l_ijsUHGPBSfxTfG5fbmtQ-1; Fri, 22 Nov 2019 04:25:50 -0500
X-MC-Unique: l_ijsUHGPBSfxTfG5fbmtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C04D107AD89;
 Fri, 22 Nov 2019 09:25:48 +0000 (UTC)
Received: from localhost (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC3B5D6A7;
 Fri, 22 Nov 2019 09:25:47 +0000 (UTC)
Date: Fri, 22 Nov 2019 09:25:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 4/6] vsock: add vsock_loopback transport
Message-ID: <20191122092546.GA464656@stefanha-x1.localdomain>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-5-sgarzare@redhat.com>
 <20191121093458.GB439743@stefanha-x1.localdomain>
 <20191121095948.bc7lc3ptsh6jxizw@steredhat>
 <20191121152517.zfedz6hg6ftcb2ks@steredhat>
MIME-Version: 1.0
In-Reply-To: <20191121152517.zfedz6hg6ftcb2ks@steredhat>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
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
Content-Type: multipart/mixed; boundary="===============7846284614583473819=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============7846284614583473819==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 04:25:17PM +0100, Stefano Garzarella wrote:
> On Thu, Nov 21, 2019 at 10:59:48AM +0100, Stefano Garzarella wrote:
> > On Thu, Nov 21, 2019 at 09:34:58AM +0000, Stefan Hajnoczi wrote:
> > > On Tue, Nov 19, 2019 at 12:01:19PM +0100, Stefano Garzarella wrote:
> > > > +static struct workqueue_struct *vsock_loopback_workqueue;
> > > > +static struct vsock_loopback *the_vsock_loopback;
> > >=20
> > > the_vsock_loopback could be a static global variable (not a pointer) =
and
> > > vsock_loopback_workqueue could also be included in the struct.
> > >=20
> > > The RCU pointer is really a way to synchronize vsock_loopback_send_pk=
t()
> > > and vsock_loopback_cancel_pkt() with module exit.  There is no other
> > > reason for using a pointer.
> > >=20
> > > It's cleaner to implement the synchronization once in af_vsock.c (or
> > > virtio_transport_common.c) instead of making each transport do it.
> > > Maybe try_module_get() and related APIs provide the necessary semanti=
cs
> > > so that core vsock code can hold the transport module while it's bein=
g
> > > used to send/cancel a packet.
> >=20
> > Right, the module cannot be unloaded until open sockets, so here the
> > synchronization is not needed.
> >=20
> > The synchronization come from virtio-vsock device that can be
> > hot-unplugged while sockets are still open, but that can't happen here.
> >=20
> > I will remove the pointers and RCU in the v2.
> >=20
> > Can I keep your R-b or do you prefer to watch v2 first?

I'd like to review v2.

> > > > +MODULE_ALIAS_NETPROTO(PF_VSOCK);
> > >=20
> > > Why does this module define the alias for PF_VSOCK?  Doesn't another
> > > module already define this alias?
> >=20
> > It is a way to load this module when PF_VSOCK is starting to be used.
> > MODULE_ALIAS_NETPROTO(PF_VSOCK) is already defined in vmci_transport
> > and hyperv_transport. IIUC it is used for the same reason.
> >=20
> > In virtio_transport we don't need it because it will be loaded when
> > the PCI device is discovered.
> >=20
> > Do you think there's a better way?
> > Should I include the vsock_loopback transport directly in af_vsock
> > without creating a new module?
> >=20
>=20
> That last thing I said may not be possible:
> I remembered that I tried, but DEPMOD found a cyclic dependency because
> vsock_transport use virtio_transport_common that use vsock, so if I
> include vsock_transport in the vsock module, DEPMOD is not happy.
>=20
> Do you think it's okay in this case to keep MODULE_ALIAS_NETPROTO(PF_VSOC=
K)
> or is there a better way?

The reason I asked is because the semantics of duplicate module aliases
aren't clear to me.  Do all modules with the same alias get loaded?
Or just the first?  Or ...?

Stefan

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3XqZoACgkQnKSrs4Gr
c8g8zwgAgv0qn/NHDbIBcCRih2eGRkR+l2CqDKByM5A65GN5n5ZwQJvooj/0hZZa
maHWK3vTmOU1c5m5gwRHJcTNTvK3hL3xYgxMCzanpWkpK6xPFSbBReQ1KtN+2IJh
1bXN7mvpTAKFkIm10jnGIzK53Tv5y46c+dHQ+Q+Wx56zSCMWcMhPZUBXSAE8Tx61
VAeo0HFPzx/wgy785xR3+tw4xV0M8UlbcYqJG/jTToIES2z4JUNIVTAczg22QpSe
hp9KwKDgSMvJLmb6fzefYTgp/hTT3fQh448YbpeHAsly8RSoJjkJx/1w4qj/AVAT
rI4XWaP4Enu7IgGna2wLQSCP+fqRog==
=VfA7
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--


--===============7846284614583473819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7846284614583473819==--

