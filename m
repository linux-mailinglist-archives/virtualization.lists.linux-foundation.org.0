Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CD39E03D
	for <lists.virtualization@lfdr.de>; Mon,  7 Jun 2021 17:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C54140203;
	Mon,  7 Jun 2021 15:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulAQtlfQnIzD; Mon,  7 Jun 2021 15:23:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4687140227;
	Mon,  7 Jun 2021 15:23:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1BB5C0001;
	Mon,  7 Jun 2021 15:23:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 451FAC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 15:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 328BB40105
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 15:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lboSzxYeiPW7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 15:23:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3932540227
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623079406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQwwwRdrZ6LaChUnuXU63XguCJG6w88HoCF5tiXY9yU=;
 b=h4xXElLbof89/bIqHa8SwhJCIoGzCMbWjaaMfdO5prpy1XksYONDLTQOYQ9/iSvKk7G/dQ
 eznFTymp4aQ+BRfCEYJYgqt2qFvzvIxz8R36a5LRdqoaZ4KvyAmW6awZg7DENaA8d0FhVM
 Wy+GbMOfJmtgSnNt/Mszmat02aSRDQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-mqxYEZBLMKSvFwsPsHlx4g-1; Mon, 07 Jun 2021 11:23:22 -0400
X-MC-Unique: mqxYEZBLMKSvFwsPsHlx4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ADFD180FD6D;
 Mon,  7 Jun 2021 15:23:21 +0000 (UTC)
Received: from localhost (ovpn-114-44.ams2.redhat.com [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65C7B60CC6;
 Mon,  7 Jun 2021 15:23:17 +0000 (UTC)
Date: Mon, 7 Jun 2021 16:23:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: michael.christie@oracle.com
Subject: Re: vhost: multiple worker support
Message-ID: <YL455LckMXfs0uuL@stefanha-x1.localdomain>
References: <20210525180600.6349-1-michael.christie@oracle.com>
 <YLjpMXbfJsaLrgF5@stefanha-x1.localdomain>
 <523e6207-c380-9a9d-7a5d-7b7ee554d7f2@oracle.com>
 <faa6085b-dfd8-9ddf-8b52-20053ac182ef@oracle.com>
MIME-Version: 1.0
In-Reply-To: <faa6085b-dfd8-9ddf-8b52-20053ac182ef@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-scsi@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============2838853063208297454=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2838853063208297454==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kyb5/9sATge0h0pI"
Content-Disposition: inline


--Kyb5/9sATge0h0pI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 05, 2021 at 05:40:17PM -0500, michael.christie@oracle.com wrote:
> On 6/3/21 5:16 PM, Mike Christie wrote:
> > On 6/3/21 9:37 AM, Stefan Hajnoczi wrote:
> >> On Tue, May 25, 2021 at 01:05:51PM -0500, Mike Christie wrote:
> >>> The following patches apply over linus's tree or mst's vhost branch
> >>> and my cleanup patchset:
> >>>
> >>> https://urldefense.com/v3/__https://lists.linuxfoundation.org/piperma=
il/virtualization/2021-May/054354.html__;!!GqivPVa7Brio!P55eslnMW_iZkoTUZck=
whnSw_9Z35JBScgtSYRh4CMFTRkSsWwKOYqY0huUfBfIPM8BV$=20
> >>>
> >>> These patches allow us to support multiple vhost workers per device. I
> >>> ended up just doing Stefan's original idea where userspace has the
> >>> kernel create a worker and we pass back the pid. This has the benefit
> >>> over the workqueue and userspace thread approach where we only have
> >>> one'ish code path in the kernel during setup to detect old tools. The
> >>> main IO paths and device/vq setup/teardown paths all use common code.
> >>>
> >>> The kernel patches here allow us to then do N workers device and also
> >>> share workers across devices.
> >>>
> >>> I've also included a patch for qemu so you can get an idea of how it
> >>> works. If we are ok with the kernel code then I'll break that up into
> >>> a patchset and send to qemu-devel.
> >>
> >> It seems risky to allow userspace process A to "share" a vhost worker
> >> thread with userspace process B based on a matching pid alone. Should
> >> they have ptrace_may_access() or similar?
> >>
> >=20
> > I'm not sure. I already made it a little restrictive in this posting, b=
ut
>=20
> Made a mistake here. In this posting I did not make it restrictive and
> I was allowing any old 2 processes to share. So we would need something
> like ptrace_may_access if go this route.
>=20
> If we restrict sharing workers with the same owner, then I'm not sure if
> need anything.

Agreed.

Sharing between processes becomes most interesting when there is busy
polling (because it consumes CPU and we should consolidate polling onto
as few CPUs as possible). Without polling we can just share the threads
within a process.

Stefan

--Kyb5/9sATge0h0pI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC+OeQACgkQnKSrs4Gr
c8itnwgAyaZ9Om2772W/pMrI+RZS8bt0A2DvHS8+fjZPz57Q08tawZ91kvAykxQq
YI4wduuObGWltmlTh6Unmm3eVdRBHVG8rn5szrYcC4C4IxjQZyPRpemgU5qVJtQn
ECAqx1JveFR9evQk/MXIFy1Y33oNuM2VS3yst2kqaS7KsmRbhfb+AnPbgfqM61z1
ULxQtdL2NbW1Cs4xObsBfk48EhL5MXaL9AGL4sm/YA+wVePRrCYzGt9U2oGZCvqu
EZCfAoxz9C6tJ5ZiZVbBfFN05Dhej7677/daxSUs79SWwV/uw1SHR8AR5roxuuZc
6yokRBdnHyd2DL10zMk5/8FzXhE3Wg==
=qN6w
-----END PGP SIGNATURE-----

--Kyb5/9sATge0h0pI--


--===============2838853063208297454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2838853063208297454==--

