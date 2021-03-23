Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4D3459C5
	for <lists.virtualization@lfdr.de>; Tue, 23 Mar 2021 09:34:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E80D40378;
	Tue, 23 Mar 2021 08:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsWD0ELnuZlQ; Tue, 23 Mar 2021 08:34:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBE8D4037B;
	Tue, 23 Mar 2021 08:34:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97925C0001;
	Tue, 23 Mar 2021 08:34:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3B6BC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 835CE4037B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hEv-BP4tkaK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:34:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39205402BF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616488476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q+XqBOYH5szrxcpTS4fDYJhdDcNEt/ZUf2eh1gomiVA=;
 b=LDF0Me4Tt4bu8PAIzdsF1pzRodQIz1Y/w2Is+1tUo8tcqCmZN5MHVuy2WBMqcE5xP0In2N
 Ckd80JCdzjPGZYn1vIbzxE0NAA72y1dLqIgZVPPTSHvVNlNZC8lnULl3fMLUtuEYzmH5U7
 EwOqRanGELluQdGVQkUBHgIy/o31z+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-1gjqH4KlO3KBxRuOedrYOQ-1; Tue, 23 Mar 2021 04:34:32 -0400
X-MC-Unique: 1gjqH4KlO3KBxRuOedrYOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3315107ACCD;
 Tue, 23 Mar 2021 08:34:30 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 208F360C0F;
 Tue, 23 Mar 2021 08:34:26 +0000 (UTC)
Date: Tue, 23 Mar 2021 08:34:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [virtio-comment] Re: [RFC PATCH v1] virtio-vsock: use C style
 defines for constants
Message-ID: <YFmoESIM64aiF5sk@stefanha-x1.localdomain>
References: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
 <YFiE9opnZ976hwbP@stefanha-x1.localdomain>
 <20210322092547-mutt-send-email-mst@kernel.org>
 <YFip8VVJOXy2EpjH@stefanha-x1.localdomain>
 <71e16d33-b5f5-d551-ad5a-22b45e946b9a@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <71e16d33-b5f5-d551-ad5a-22b45e946b9a@kaspersky.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Andra Paraschiv <andraprs@amazon.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 Colin Ian King <colin.king@canonical.com>,
 Norbert Slusarek <nslusarek@gmx.net>, oxffffaa@gmail.com,
 virtio-comment@lists.oasis-open.org, Jakub Kicinski <kuba@kernel.org>,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============6555871770579262714=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============6555871770579262714==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KuhFm2qSGF4L7ua9"
Content-Disposition: inline

--KuhFm2qSGF4L7ua9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 09:18:34AM +0300, Arseny Krasnov wrote:
>=20
> On 22.03.2021 17:30, Stefan Hajnoczi wrote:
> > On Mon, Mar 22, 2021 at 09:34:58AM -0400, Michael S. Tsirkin wrote:
> >> On Mon, Mar 22, 2021 at 11:52:22AM +0000, Stefan Hajnoczi wrote:
> >>> On Mon, Mar 22, 2021 at 09:37:59AM +0300, Arseny Krasnov wrote:
> >>>> @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device=
 Types / Socket Device / Device O
> >>>>  hints are permanent once sent and successive packets with bits clea=
r do not
> >>>>  reset them.
> >>>> =20
> >>>> +\begin{lstlisting}
> >>>> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> >>>> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
> >>>> +\end{lstlisting}
> >>> The spec has no other _BIT constants.
> >> True. Sometimes there's an _F_ somewhere there instead.
> > You're right, I missed the virtio-net bit constants:
> >
> >   #define VIRTIO_NET_F_GUEST_TSO4 7
> >
> > Compared to:
> >
> >   #define VIRTQ_DESC_F_AVAIL     (1 << 7)
> >
> > or
> >
> >   #define VIRTQ_DESC_F_WRITE     2
> >
> > It's an inconsistent mix :). Hard to tell them apart when they aren't
> > bitmask constants with '<<'.
> >
> > Can we use '<<' for clarity on new constants?
>=20
> So for bit constants, i can use:
>=20
> #define VIRTIO_VSOCK_SHUTDOWN_RECEIVE (1 << 0)
> #define VIRTIO_VSOCK_SHUTDOWN_SEND    (1 << 1)
>=20
> for this case and all other next cases, when i'll add SEQPACKET
> description in spec?

Personally I think that's clearest. Michael pointed out that the spec is
not consistent though, so I won't complain if you prefer to keep the
_BIT numbering.

Stefan

--KuhFm2qSGF4L7ua9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZqBEACgkQnKSrs4Gr
c8isxAgAoWCvHA3XJZ2rRVEts+n5e2d96jYiolhYn0bAbZxY6w318IIVO14czZlY
JrEuzbF5WAHY8rSuTfFiyF9wREsjhDRg0Wvc+c05mHxwN2pMLPmPGk53uZ+i0efV
+Krzp/e3kONpYaGhyUzmArNRCRJ3e+PJEAVY/snwlVivTM1gHIT0MsNanHVzErED
t/C3tzB508QCeJBoO4LZuqQiMNWvk4W68+bc8/NRNTJVrccvq+Ae2NkWFmnqqy0y
jChVEke8Zc8JY52WpP6uWtiaORQWRGUzT6J0eCok9zxZ/G4XJDC9BdUBx9Xgzfxk
IXqK/3h2cQogJ0URXvKJN40z/fk2mg==
=fvqJ
-----END PGP SIGNATURE-----

--KuhFm2qSGF4L7ua9--


--===============6555871770579262714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6555871770579262714==--

