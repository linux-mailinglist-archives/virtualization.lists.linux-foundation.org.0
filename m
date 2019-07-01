Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD225BFA9
	for <lists.virtualization@lfdr.de>; Mon,  1 Jul 2019 17:22:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 988004BB7;
	Mon,  1 Jul 2019 15:22:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BA5794BA3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:22:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9BE28834
	for <virtualization@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 15:22:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C19483082A9A;
	Mon,  1 Jul 2019 15:21:54 +0000 (UTC)
Received: from localhost (unknown [10.36.118.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 268386F947;
	Mon,  1 Jul 2019 15:21:49 +0000 (UTC)
Date: Mon, 1 Jul 2019 16:21:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] scsi: virtio_scsi: Use struct_size() helper
Message-ID: <20190701152148.GG11900@stefanha-x1.localdomain>
References: <20190619192833.GA825@embeddedor>
MIME-Version: 1.0
In-Reply-To: <20190619192833.GA825@embeddedor>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 01 Jul 2019 15:22:07 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>
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
Content-Type: multipart/mixed; boundary="===============4279123424929837694=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============4279123424929837694==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline


--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 02:28:33PM -0500, Gustavo A. R. Silva wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>=20
> struct virtio_scsi {
> 	...
>         struct virtio_scsi_vq req_vqs[];
> };
>=20
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
>=20
> So, replace the following form:
>=20
> sizeof(*vscsi) + sizeof(vscsi->req_vqs[0]) * num_queues
>=20
> with:
>=20
> struct_size(vscsi, req_vqs, num_queues)
>=20
> This code was detected with the help of Coccinelle.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/scsi/virtio_scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0aJQwACgkQnKSrs4Gr
c8hU0wf/SEM8YCmD62jJAJNbhuuxbgPPdSmJV/Oh3RzqiM/ujaeDjX1Msi+8fFbR
NlE7Cr9xEkGuEacjWbl+MNio761nAUo5Ibln9uws3BTpnHClVohmaat2RfuRyoB5
0O1FC55L1Gj8+/RaRoZAO3gld6TM5+KFuptuYN4kOl9/DJDSbjoGX11dFtyL6Jut
mSdjs07Koh+Uxt+2/gIEoflBy6tr8nbOIpIb0qI9Y+4iYXUFPvRqDhqnZ1TezcWE
T4lWINqg4FuT+MMmCAyk8KLhj9FVKLMG7mCRT/R+emhi2yTwyMwvKLYeMW0uikUQ
2NfsNT8OZBYFNEdUzjeCiw4Mg8f99A==
=FseJ
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--

--===============4279123424929837694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4279123424929837694==--
