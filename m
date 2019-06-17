Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D61BA47791
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 03:20:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 228DDC75;
	Mon, 17 Jun 2019 01:20:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C63ACC6A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 01:20:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 66838E6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 01:20:44 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5H1GkRW010462 for <virtualization@lists.linux-foundation.org>;
	Sun, 16 Jun 2019 21:20:43 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2t5x9duwwk-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Sun, 16 Jun 2019 21:20:43 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<sbobroff@linux.ibm.com>; Mon, 17 Jun 2019 02:20:41 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 17 Jun 2019 02:20:38 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x5H1Kbtp26345770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 17 Jun 2019 01:20:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A47ECAE057;
	Mon, 17 Jun 2019 01:20:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54AB1AE05F;
	Mon, 17 Jun 2019 01:20:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jun 2019 01:20:37 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 81114A00D4;
	Mon, 17 Jun 2019 11:20:35 +1000 (AEST)
Date: Mon, 17 Jun 2019 11:20:34 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [EXTERNAL] Re: [PATCH 1/1] drm/bochs: Fix connector leak during
	driver unload
References: <93b363ad62f4938d9ddf3e05b2a61e3f66b2dcd3.1558416473.git.sbobroff@linux.ibm.com>
	<20190521081029.dexgf7e7d3b7wxdw@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20190521081029.dexgf7e7d3b7wxdw@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19061701-0008-0000-0000-000002F44852
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061701-0009-0000-0000-0000226157A3
Message-Id: <20190617012033.GA1151@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906170011
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============0329040397705768519=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0329040397705768519==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 10:10:29AM +0200, Gerd Hoffmann wrote:
>   Hi,
>=20
> The bug is in the driver, so ...
>=20
> > Bisecting the issue for commits to drivers/gpu/drm/bochs/ points to:
> > 6579c39594ae ("drm/bochs: atomic: switch planes to atomic, wire up help=
ers.")
> > ... but the issue also seems to be due to a change in the generic drm c=
ode
>=20
> ... this one is the culprit and should be listed.
>=20
> > (reverting it separately fixes the issue):
> > 846c7dfc1193 ("drm/atomic: Try to preserve the crtc enabled state in dr=
m_atomic_remove_fb, v2.")
> > ... so I've included both in the commit.  Is that the right thing to do?
>=20
> That only triggers the driver bug.
>=20
> I'll fix it up on commit,
>   Gerd

Sorry if I misunderstood, but were you going to take the patch and fix
it up or would you like me to post a v2?

Cheers,
Sam.


--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0G6tMACgkQMX8w6AQl
/iJjVgf/T6KF8XcN9Z/Yppy+tUW0hD9031/YPdlJJ7slrFUkPrEcVSxARY1J32SO
f7Vdc6de427aF9P33QULxkg/rqAbdVYTuim6s3BQUPax7JYmkfviHOKUNPVdDlN/
BUBpEPqkanHxn8KKBSd4OdKWpek/20RTAgM+Vg5jwhN8jtLNHbrqXQf+z3ll1SS/
9iHxA/KH8/lBv1RH2AfbChumNz/dNioxMoZizPOxEZbu9G8tfDb40q2HBfLD8lXk
aCdFb8P6d37bkR1xn51HKqGgChbL6orlfiVuT1goYLB/MLxDvHn+9G5yywcwLjvp
zWJH22IKznWBtuRpaaoTunVc4UPd+Q==
=snbg
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--


--===============0329040397705768519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0329040397705768519==--

